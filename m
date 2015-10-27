Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrAfv-00056z-VJ
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 20:16:58 +0000
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <562FDB9C.4010705@nod.at>
Date: Tue, 27 Oct 2015 21:16:28 +0100
MIME-Version: 1.0
In-Reply-To: <20151023101406.6d1490e5@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 23.10.2015 um 10:14 schrieb Boris Brezillon:
>> I'm currently working on the paired pages problem we have on MLC chips.
>> I remember discussing it with Artem earlier this year when I was
>> preparing my talk for ELC.
>>
>> I now have some time I can spend working on this problem and I started
>> looking at how this can be solved.
>>
>> First let's take a look at the UBI layer.
>> There's one basic thing we have to care about: protecting UBI metadata.
>> There are two kind of metadata:
>> 1/ those stored at the beginning of each erase block (EC and VID
>>    headers)
>> 2/ those stored in specific volumes (layout and fastmap volumes)
>>
>> We don't have to worry about #2 since those are written using atomic
>> update, and atomic updates are immune to this paired page corruption
>> problem (either the whole write is valid, or none of it is valid).
>>
>> This leaves problem #1.
>> For this case, Artem suggested to duplicate the EC header in the VID
>> header so that if page 0 is corrupted we can recover the EC info from
>> page 1 (which will contain both VID and EC info).
>> Doing that is fine for dealing with EC header corruption, since, AFAIK,
>> none of the NAND vendors are pairing page 0 with page 1.
>> Still remains the VID header corruption problem. Do prevent that we
>> still have several solutions:
>> a/ skip the page paired with the VID header. This is doable and can be
>>    hidden from UBI users, but it also means that we're loosing another
>>    page for metadata (not a negligible overhead)
>> b/ storing VID info (PEB <-> LEB association) somewhere else. Fastmap
>>    seems the right place to put that in, since fastmap is already
>>    storing those information for almost all blocks. Still we would have
>>    to modify fastmap a bit to store information about all erase blocks
>>    and not only those that are not part of the fastmap pool.
>>    Also, updating that in real-time would require using a log approach,
>>    instead of the atomic update currently used by fastmap when it runs
>>    out of PEBs in it's free PEB pool. Note that the log approach does
>>    not have to be applied to all fastmap data (we just need it for the
>>    PEB <-> LEB info).
>>    Another off-topic note regarding the suggested log approach: we
>>    could also use it to log which PEB was last written/erased, and use
>>    that to handle the unstable bits issue.
>> c/ (also suggested by Artem) delay VID write until we have enough data
>>    to write on the LEB, and thus guarantee that it cannot be corrupted
>>    (at least by programming on the paired page ;-)) anymore.
>>    Doing that would also require logging data to be written on those
>>    LEBs somewhere, not to mention the impact of copying the data twice
>>    (once in the log, and then when we have enough data, in the real
>>    block).
>>
>> I don't have any strong opinion about which solution is the best, also
>> I'm maybe missing other aspects or better solutions, so feel free to
>> comment on that and share your thoughts.
> 
> I decided to go for the simplest solution (but I can't promise I won't
> change my mind if this approach appears to be wrong), which is either
> using a LEB is MLC or SLC mode. In SLC modes, only the first page of
> each pair is used, which completely address the paired pages problem.
> For now the SLC mode logic is hidden in the MTD/NAND layers which are
> providing functions to write/read in SLC mode.
> 
> Thanks to this differentiation, UBI is now exposing two kind of LEBs:
> - the secure (small) LEBS (those accessed in SLC mode)
> - the unsecure (big) LEBS (those accessed in MLC mode)
> 
> The secure LEBs are marked as such with a flag in the VID header, which
> allows tracking secure/unsecure LEBs and controlling the maximum size a
> UBI user can read/write from/to a LEB.
> This approach assume LEB 0 and 1 are never paired together (which

You mean page 0 and 1?

> AFAICT is always true), because VID is stored on page 1 and we need the
> secure_flag information to know how to access the LEB (SLC or MLC mode).
> Of course I expose a few new helpers in the kernel API, and we'll
> probably have to do it for the ioctl interface too if this approach is
> validated.
> 
> That's all I got for the UBI layer.
> Richard, Artem, any feedback so far?

Changing the on-flash format of UBI is a rather big thing.
If it needs to be done I'm fine with it but we have to give our best
to change it only once. :-)

>>
>> That's all for the UBI layer. We will likely need new functions (and
>> new fields in existing structures) to help UBI users deal with MLC
>> NANDs: for example a field exposing the storage type or a function
>> helping users skip one (or several) blocks to secure the data they have
>> written so far. Anyway, those are things we can discuss after deciding
>> which approach we want to take.
>>
>> Now, let's talk about the UBIFS layer. We are facing pretty much the
>> same problem in there: we need to protect the data we have already
>> written from time to time.
>> AFAIU (correct me if I'm wrong), data should be secure when we sync the
>> file system, or commit the UBIFS journal (feel free to correct me if
>> I'm not using the right terms in my explanation).
>> As explained earlier, the only way to secure data is to skip some pages
>> (those that are paired with the already written ones).
>>
>> I see two approaches here (there might be more):
>> 1/ do not skip any pages until we are asked to secure the data, and
>>    then skip as much pages as needed to ensure nobody can ever corrupt
>>    the data. With this approach you can loose a non negligible amount
>>    of space. For example, with this paired pages scheme [1], if you
>>    only write page on page 2 and want to secure your data, you'll have
>>    to skip pages 3 to 8.
>> 2/ use the NAND in 'SLC mode' (AKA only write on half the pages in a
>>    block). With this solution you always loose half the NAND capacity,
>>    but in case of small writes, it's still more efficient than #1.
>>    Of course using that solution is not acceptable, because you'll
>>    only be able to use half the NAND capacity, but the plan is to use
>>    it in conjunction with the GC, so that from time to time UBIFS
>>    data chunks/nodes can be put in a single erase block without
>>    skipping half the pages.
>>    Note that currently the GC does not work this way: it tries to
>>    collect chunks one by one and write them to the journal to free a
>>    dirty LEB. What we would need here is a way to collect enough data
>>    to fill an entire block and after that release the LEBs that where
>>    previously using half the LEB capacity.
>>
>> Of course both of those solutions implies marking the skipped regions
>> as dirty so that the GC can account for the padded space. For #1 we
>> should probably also use padding nodes to reflect how much space is lost
>> on the media, though I'm not sure how this can be done. For #2, we may
>> have to differentiate 'full' and 'half' LEBs in the LPT.
> 
> If you followed my un/secure LEB approach described above, you probably
> know that we don't have much solutions for the UBIFS layer.
> 
> My idea here is to use a garbage collection mechanism which will
> consolidate data LEBs (LEBs containing valid data nodes).
> By default all LEBs are used in secure (SLC) mode, which makes the
> UBIFS layer reliable. From time to time the consolidation GC will
> choose a few secure LEBs and move their nodes to an unsecure LEB.
> The idea is to fill the entire unsecure LEB, so that we never write on
> it afterwards, thus preventing any paired page corruption. Once this
> copy is finished we can release/unmap the secure LEBs we have
> consolidated (after adding a bud node to reference the unsecure LEB of
> course).
> 
> Here are a few details about the implementation I started to develop
> (questions will come after ;-)).
> I added a new category (called LPROPS_FULL) to track the LEBs that are
> almost full (lp->dirty + lp->free < leb_size / 4), so that we can
> easily consolidate 2 to 3 full LEBs into a single unsecure LEB.
> The consolidation is done by filling as much nodes as possible into an
> unsecure LEB, and after a single pass, this should results in at least
> one freed LEB freed: the consolidation moves nodes from at least 2
> secure LEBs into a single one, so you're freeing 2 LEBs but need to
> keep one for the next consolidation iteration, hence the single LEB
> freed.
> 
> Now comes the questions to the UBIFS experts:
> - should I create a new journal head to do what's described above?
>   AFAICT I can't use the GC head, because the GC can still do it's job
>   in parallel of the consolidation-GC, and the GC LEB might already be
>   filled with some data nodes, right?
>   I thought about using the data head, but again, it might already
>   point to a partially filled data LEB.
>   I added a journal head called BIG_DATA_HEAD, but I'm not sure this is
>   acceptable, so let me know what you think about that?

I'd vote for a new head.
If it turns out to be similar enough to another head we can still
merge it to that head.

> - when should we run the consolidation-GC? After the standard GC
>   pass, when this one didn't make any progress, or should we launch
>   it as soon as we have enough full LEBs to fill an unsecure LEB? The
>   second solution might have a small impact on performances of an empty
>   FS (below the half capacity size), but ITOH, it will scale better when
>   the FS size exceed this limit (no need to run the GC each time we
>   want to write new data).

I'd go for a hybrid approach.
Run the consolidation-GC if standard GC was unable to produce free space
and if more than X small LEBs are full.

> - I still need to understand the races between TNC and GC, since I'm
>   pretty sure I'll face the same kind of problems with the
>   consolidation-GC. Can someone explains that to me, or should I dig
>   further into the code :-)?

Not sure if I understand this questions correctly.

What you need for sure is i) a way to find out whether a LEB can be packed
and ii) lock it while packing.

> I'm pretty sure I forgot a lot of problematics here, also note that my
> implementation is not finished yet, so this consolidation-GC concept
> has not been validated. If you see anything that could defeat this
> approach, please let me know so that I can adjust my development.

Please share your patches as soon as possible. Just mark them as RFC
(really flaky code). I'll happily test them on my MLC boards and review them.

Thanks,
//richard
