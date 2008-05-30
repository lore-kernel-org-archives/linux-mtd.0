Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1xgZ-00013K-JA
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 06:01:55 +0000
Received: by rv-out-0708.google.com with SMTP id b17so4482217rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 May 2008 23:01:54 -0700 (PDT)
Message-ID: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
Date: Fri, 30 May 2008 15:01:54 +0900
From: "KeunO Park" <lastnite@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello guys. I am a newbie here.

I am working in embedded device. and I handled some kind of flash
filesystem like yaffs2, jffs2, rfs on ONENAND/NAND and tffs on MDOC.
you know, in territory of mobile phone, mass storage class func
becomes basic function.

but well known linux flash filesystems do not support this function
except ubiblk.
(ok. rfs support MSC. but this is not opensourced.)
I need both ubifs(for system partition) and ubiblk(for user
partition). so I tested ubifs and ubiblk.

before you see this result, remember this is just the report of my test.


some days ago, I tested the performance of ubifs, ubiblk and yaffs2.
here is the result.

[test board]
cpu:s3c2448 400MHz sdram:64MB nand:128MB

the copying file is 10MB size and created with /dev/urandom.
so I think that there may be some disadvantage to ubifs using compressor.

[write test]

yaffs2
write: 10.20s, 12.09s, 12.24s avg:11.51s (868KB/s)
load avg right after copy&sync: 0.03 -> 0.11

ubifs (LZO)
write: 14.45s, 14.40s, 14.45s avg:14.43s (693KB/s)
load avg right after copy&sync: 0.03 -> 0.53

ubifs (ZLIB)
write : 27.17s, 27.18s, 27.21s avg:27.18 (367KB/s)
load avg right after copy&sync: 0.03 -> 0.80

ubifs (No Compression)
write: 6.69s, 10.90s, 10.98s avg:9.52s (1050KB/s)
load avg right after copy&sync: 0.03 -> 0.43

ubiblk(vfat mount)
read: 0.46s, 0.47s, 0.46s avg: 0.463s (21.5MB/s)
write: 12.13s, 14.95s, 12.61s avg:13.23s (755KB/s)
load avg right after copy&sync: 0.02 -> 0.31

With above result, it seems that there is some overload in ubi.


PS: I am not good at english. and english is not my native language.
so plz understand my wierd sentence. :-)
