Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgswP-0002tj-Ub
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 11:19:26 +0000
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, =?UTF-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?=
 <qiwang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <560A73A5.2070406@nod.at>
Date: Tue, 29 Sep 2015 13:19:01 +0200
MIME-Version: 1.0
In-Reply-To: <20150917152240.757c9e90@bbrezillon>
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

Hi!

Am 17.09.2015 um 15:22 schrieb Boris Brezillon:
> Hello,
> 
> I'm currently working on the paired pages problem we have on MLC chips.
> I remember discussing it with Artem earlier this year when I was
> preparing my talk for ELC.
> 
> I now have some time I can spend working on this problem and I started
> looking at how this can be solved.
> 
> First let's take a look at the UBI layer.
> There's one basic thing we have to care about: protecting UBI metadata.
> There are two kind of metadata:
> 1/ those stored at the beginning of each erase block (EC and VID
>    headers)
> 2/ those stored in specific volumes (layout and fastmap volumes)
> 
> We don't have to worry about #2 since those are written using atomic
> update, and atomic updates are immune to this paired page corruption
> problem (either the whole write is valid, or none of it is valid).
> 
> This leaves problem #1.
> For this case, Artem suggested to duplicate the EC header in the VID
> header so that if page 0 is corrupted we can recover the EC info from
> page 1 (which will contain both VID and EC info).
> Doing that is fine for dealing with EC header corruption, since, AFAIK,
> none of the NAND vendors are pairing page 0 with page 1.
> Still remains the VID header corruption problem. Do prevent that we
> still have several solutions:
> a/ skip the page paired with the VID header. This is doable and can be
>    hidden from UBI users, but it also means that we're loosing another
>    page for metadata (not a negligible overhead)
> b/ storing VID info (PEB <-> LEB association) somewhere else. Fastmap
>    seems the right place to put that in, since fastmap is already
>    storing those information for almost all blocks. Still we would have
>    to modify fastmap a bit to store information about all erase blocks
>    and not only those that are not part of the fastmap pool.
>    Also, updating that in real-time would require using a log approach,
>    instead of the atomic update currently used by fastmap when it runs
>    out of PEBs in it's free PEB pool. Note that the log approach does
>    not have to be applied to all fastmap data (we just need it for the
>    PEB <-> LEB info).
>    Another off-topic note regarding the suggested log approach: we
>    could also use it to log which PEB was last written/erased, and use
>    that to handle the unstable bits issue.
> c/ (also suggested by Artem) delay VID write until we have enough data
>    to write on the LEB, and thus guarantee that it cannot be corrupted
>    (at least by programming on the paired page ;-)) anymore.
>    Doing that would also require logging data to be written on those
>    LEBs somewhere, not to mention the impact of copying the data twice
>    (once in the log, and then when we have enough data, in the real
>    block).

Let's start with UBI, as soon it is stable on MLC NAND we can focus on
UBIFS.

Solution a) sounds very promising to me as the can be implemented easily
and loosing another page for meta data is IMHO acceptable on MLC.
Especially as MLC NANDs are anyways bigger and cheaper than SLC.

b) is tricky as fastmap follows the design principle that UBI can fall
back to a full scan if the fastmap is corrupted or a self check fails.
If the ability to full scan suddenly depends on fastmap it can become
messy.

In terms of computer science c) is the most elegant solution but converting
UBI to a log based "block layer" is not trivial and as you wrote the write
overhead is not negligible.

So, I'd vote for a) and see how well it does in our powercut tests. :-)

Thanks,
//richard
