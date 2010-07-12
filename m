Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYDwX-0001XV-9k
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 08:00:50 +0000
Received: by bwz20 with SMTP id 20so1779444bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jul 2010 01:00:45 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Jul 2010 10:00:44 +0200
Message-ID: <AANLkTim9UejsaoDT4IypuONDDZSfASelAmcGXhhNv7A8@mail.gmail.com>
Subject: UBIFS sequential write performance vs YAFFS2
From: Leo Barnes <barnes.leo@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I have now done quite a lot of measurements comparing the filesystem
performance of both YAFFS2 and UBIFS on a device. Most of the results
seem logical, but there is something that looks very strange to me.
Here is the data:

MTD raw write speeds:
Block (128 KiB): 3937 KiB/s
2 pages (4 KiB): 3770 KiB/s
1 page (2 KiB): 3724 KiB/s

YAFFS2 sequential write speed: 3250 KiB/s
UBIFS sequential write speed: 1930 KiB/s

UBIFS is mounted with -o compr=none,bulk_read,no_chk_data_crc (of
which compr=none should be the only one affecting write speed if I
understand the options correctly).
The speeds have been measured using iozone and tiotest, and since no
compression is used, it should not matter that these programs only
write zeros. I tried running tiotest with the option to use
synchronous writes which dropped the UBIFS speed right down to about
900 KiB/s, so the programs are apparantly not using the O_SYNC flag
until forced.

Can anyone explain why UBIFS seems to give so much worse performance
when using no compression? I know that UBIFS does the writing
asynchronously, using a write-buffer. This should add some overhead,
but since this overhead is done in RAM, it should be negligible when
compared to the time it takes to write to flash. When studying exactly
what commands both YAFFS2 and UBIFS sends to the MTD-layer, it seems
that both filesystems only do writes one page at a time, so it
shouldnt have anything to do with the fact that writing a full block
is faster than a page (it's not that much faster anyway). Is it
perhaps the CRC calculation that gives such a large overhead?

Best regards,
//Leo
