Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaOi5-0004nT-0P
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 07:54:53 +0000
Received: by fxm3 with SMTP id 3so1938827fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 00:54:51 -0700 (PDT)
Subject: Re: UBIFS sequential write performance vs YAFFS2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTim9UejsaoDT4IypuONDDZSfASelAmcGXhhNv7A8@mail.gmail.com>
References: <AANLkTim9UejsaoDT4IypuONDDZSfASelAmcGXhhNv7A8@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 10:54:48 +0300
Message-Id: <1279439688.16247.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2010-07-12 at 10:00 +0200, Leo Barnes wrote:
> Hello!
> 
> I have now done quite a lot of measurements comparing the filesystem
> performance of both YAFFS2 and UBIFS on a device. Most of the results
> seem logical, but there is something that looks very strange to me.
> Here is the data:
> 
> MTD raw write speeds:
> Block (128 KiB): 3937 KiB/s
> 2 pages (4 KiB): 3770 KiB/s
> 1 page (2 KiB): 3724 KiB/s
> 
> YAFFS2 sequential write speed: 3250 KiB/s
> UBIFS sequential write speed: 1930 KiB/s
> 
> UBIFS is mounted with -o compr=none,bulk_read,no_chk_data_crc (of
> which compr=none should be the only one affecting write speed if I
> understand the options correctly).
> The speeds have been measured using iozone and tiotest, and since no
> compression is used, it should not matter that these programs only
> write zeros. I tried running tiotest with the option to use
> synchronous writes which dropped the UBIFS speed right down to about
> 900 KiB/s, so the programs are apparantly not using the O_SYNC flag
> until forced.
> 
> Can anyone explain why UBIFS seems to give so much worse performance
> when using no compression? I know that UBIFS does the writing
> asynchronously, using a write-buffer. This should add some overhead,
> but since this overhead is done in RAM, it should be negligible when
> compared to the time it takes to write to flash. When studying exactly
> what commands both YAFFS2 and UBIFS sends to the MTD-layer, it seems
> that both filesystems only do writes one page at a time, so it
> shouldnt have anything to do with the fact that writing a full block
> is faster than a page (it's not that much faster anyway). Is it
> perhaps the CRC calculation that gives such a large overhead?

Difficult to say. You should use oprofile and figure out where UBIFS
spends more time. But herea are some random points which came to my
mind.

UBIFS maintains on-flash index, so I guess index overhead is something
which makes UBIFS slower comparing to YAFFS. 

Also, CRC32 calculation may slow things down.

We never tried to benchmark/optimize synchronous I/O. We only made sure
it syncs everything when operation return.

I know at least JFFS2 does not handle sync I/O completely correctly - it
does not sync the write-buffer. UBIFS syncs everything. Does YAFFS also
sync absolutely everything when write returns?

UBIFS writes can be much faster if we implemented ->write_pages VFS
method, we could then combine many pages and write them at once.

Then we have an idea of implementing asynchronous MTD io, just like in
block layer. Then, if write_pages is implemented, we could
compress/calculate crc in parallel with writing.

So, I thing because YAFFS is much simpler (this is YAFFS's strength), it
has less overhead, and it can write faster. UBIFS has room for
optimization, though.

But please, try oprofile, it will be useful.

Adrian had some comments, but keeps silence :-) CCing him.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
