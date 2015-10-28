Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrT0T-0003ag-5V
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 15:51:22 +0000
Received: by wicfx6 with SMTP id fx6so203374675wic.1
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2015 08:50:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151028121400.44dd2a0f@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
 <562FDB9C.4010705@nod.at> <20151028102410.663dc526@bbrezillon>
 <CAOMqctTjrjrwY+R6n87OS1J7TnzfFJyMUevsJ=9u5SHgbURE_w@mail.gmail.com>
 <20151028121400.44dd2a0f@bbrezillon>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 28 Oct 2015 16:50:19 +0100
Message-ID: <CAOMqctT4n1nE7JemHdxvqpjUwKsjwEm2iZTQi0o9TCYqALTUig@mail.gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Andrea Scian <rnd4@dave-tech.it>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 October 2015 at 12:14, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 28 Oct 2015 11:44:49 +0100
> Michal Suchanek <hramrach@gmail.com> wrote:
>
>> On 28 October 2015 at 10:24, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > Hi Richard,
>> >
>> > On Tue, 27 Oct 2015 21:16:28 +0100
>> > Richard Weinberger <richard@nod.at> wrote:
>> >
>> >> Boris,
>> >>
>> >> Am 23.10.2015 um 10:14 schrieb Boris Brezillon:
>> >> >> I'm currently working on the paired pages problem we have on MLC chips.
>> >> >> I remember discussing it with Artem earlier this year when I was
>> >> >> preparing my talk for ELC.
>> >> >>
>> >> >> I now have some time I can spend working on this problem and I started
>> >> >> looking at how this can be solved.
>> >> >>
>> >> >> First let's take a look at the UBI layer.
>> >> >> There's one basic thing we have to care about: protecting UBI metadata.
>> >> >> There are two kind of metadata:
>> >> >> 1/ those stored at the beginning of each erase block (EC and VID
>> >> >>    headers)
>> >> >> 2/ those stored in specific volumes (layout and fastmap volumes)
>> >> >>
>> >> >> We don't have to worry about #2 since those are written using atomic
>> >> >> update, and atomic updates are immune to this paired page corruption
>> >> >> problem (either the whole write is valid, or none of it is valid).
>> >> >>
>> >> >> This leaves problem #1.
>> >> >> For this case, Artem suggested to duplicate the EC header in the VID
>> >> >> header so that if page 0 is corrupted we can recover the EC info from
>> >> >> page 1 (which will contain both VID and EC info).
>> >> >> Doing that is fine for dealing with EC header corruption, since, AFAIK,
>> >> >> none of the NAND vendors are pairing page 0 with page 1.
>> >> >> Still remains the VID header corruption problem. Do prevent that we
>> >> >> still have several solutions:
>> >> >> a/ skip the page paired with the VID header. This is doable and can be
>> >> >>    hidden from UBI users, but it also means that we're loosing another
>> >> >>    page for metadata (not a negligible overhead)
>> >> >> b/ storing VID info (PEB <-> LEB association) somewhere else. Fastmap
>> >> >>    seems the right place to put that in, since fastmap is already
>> >> >>    storing those information for almost all blocks. Still we would have
>> >> >>    to modify fastmap a bit to store information about all erase blocks
>> >> >>    and not only those that are not part of the fastmap pool.
>> >> >>    Also, updating that in real-time would require using a log approach,
>> >> >>    instead of the atomic update currently used by fastmap when it runs
>> >> >>    out of PEBs in it's free PEB pool. Note that the log approach does
>> >> >>    not have to be applied to all fastmap data (we just need it for the
>> >> >>    PEB <-> LEB info).
>> >> >>    Another off-topic note regarding the suggested log approach: we
>> >> >>    could also use it to log which PEB was last written/erased, and use
>> >> >>    that to handle the unstable bits issue.
>> >> >> c/ (also suggested by Artem) delay VID write until we have enough data
>> >> >>    to write on the LEB, and thus guarantee that it cannot be corrupted
>> >> >>    (at least by programming on the paired page ;-)) anymore.
>> >> >>    Doing that would also require logging data to be written on those
>> >> >>    LEBs somewhere, not to mention the impact of copying the data twice
>> >> >>    (once in the log, and then when we have enough data, in the real
>> >> >>    block).
>> >> >>
>> >> >> I don't have any strong opinion about which solution is the best, also
>> >> >> I'm maybe missing other aspects or better solutions, so feel free to
>> >> >> comment on that and share your thoughts.
>> >> >
>> >> > I decided to go for the simplest solution (but I can't promise I won't
>> >> > change my mind if this approach appears to be wrong), which is either
>> >> > using a LEB is MLC or SLC mode. In SLC modes, only the first page of
>> >> > each pair is used, which completely address the paired pages problem.
>> >> > For now the SLC mode logic is hidden in the MTD/NAND layers which are
>> >> > providing functions to write/read in SLC mode.
>> >> >
>> >> > Thanks to this differentiation, UBI is now exposing two kind of LEBs:
>> >> > - the secure (small) LEBS (those accessed in SLC mode)
>> >> > - the unsecure (big) LEBS (those accessed in MLC mode)
>> >> >
>> >> > The secure LEBs are marked as such with a flag in the VID header, which
>> >> > allows tracking secure/unsecure LEBs and controlling the maximum size a
>> >> > UBI user can read/write from/to a LEB.
>> >> > This approach assume LEB 0 and 1 are never paired together (which
>> >>
>> >> You mean page 0 and 1?
>> >
>> > Yes.
>> >
>> >>
>> >> > AFAICT is always true), because VID is stored on page 1 and we need the
>> >> > secure_flag information to know how to access the LEB (SLC or MLC mode).
>> >> > Of course I expose a few new helpers in the kernel API, and we'll
>> >> > probably have to do it for the ioctl interface too if this approach is
>> >> > validated.
>> >> >
>> >> > That's all I got for the UBI layer.
>> >> > Richard, Artem, any feedback so far?
>> >>
>> >> Changing the on-flash format of UBI is a rather big thing.
>> >> If it needs to be done I'm fine with it but we have to give our best
>> >> to change it only once. :-)
>> >
>> > Yes, I know that, and I don't pretend I chose the right solution ;-),
>> > any other suggestions to avoid changing the on-flash format?
>> >
>> > Note that I only added a new flag, and this flag is only set when you
>> > map a LEB in SLC mode, which is not the default case, which in turn
>> > means you'll be able to attach to an existing UBI partition. Of course
>> > the reverse is not true, once you've started using the secure LEB
>> > feature you can't attach this image with an UBI implementation that does
>> > not support this feature.
>>
>> Isn't a secure LEB just a plain LEB with half pages unused? Since you
>> only write secure LEBs normally and unsecure LEBs only in garbage
>> collector and you can tell secure LEB by the layout of used pages
>> there isn't really need for special marking AFAICFT
>
> This implies scanning several pages per block to determine which type
> of LEB is in use, which will drastically increase the attach time.
> The whole point of this flag is to avoid scanning anything else but the
> EC and VID headers (or the fastmap LEBs if fastmap is in use).

Why do you need to scan anything more than you would normally?

You assume that any blocks already written are written correctly and
you will write any new blocks securely and perform garbage collection
to condense blocks which have unused pages that cannot be written
securely or were already used and have stale data. The current data
format supposedly already allows determining which pages are in use
and which not without extra scanning so there is no more work to be
done. The only issue I see is that blocks which are writable by
current driver cannot be written securely in some cases. You have to
deal with that while upgrading a filesystem from old format anyway so
not changing the format will just use the upgrade code path more.

Thanks

Michal
