Received: from rn-out-0910.google.com ([64.233.170.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K26M8-0005dQ-Kt
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 15:17:25 +0000
Received: by rn-out-0910.google.com with SMTP id m7so2203975rnd.3
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 May 2008 08:17:23 -0700 (PDT)
Message-ID: <5ed5c4730805300817xfa48738gd7aeed1791972b28@mail.gmail.com>
Date: Sat, 31 May 2008 00:17:22 +0900
From: "KeunO Park" <lastnite@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
In-Reply-To: <5ed5c4730805291914h187e0b0et2de31d595b52f125@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5ed5c4730805291914h187e0b0et2de31d595b52f125@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> [test board]
> cpu:s3c2448 400MHz sdram:64MB nand:128MB
>
> the copying file is 10MB size and created with /dev/urandom.
> so I think that there may be some disadvantage to ubifs using compressor.
>
> [write test]
>
> yaffs2
> write: 10.20s, 12.09s, 12.24s avg:11.51s (868KB/s)
> load avg right after copy&sync: 0.03 -> 0.11
>
> ubifs (LZO)
> write: 14.45s, 14.40s, 14.45s avg:14.43s (693KB/s)
> load avg right after copy&sync: 0.03 -> 0.53
>
> ubifs (ZLIB)
> write : 27.17s, 27.18s, 27.21s avg:27.18 (367KB/s)
> load avg right after copy&sync: 0.03 -> 0.80
>
> ubifs (No Compression)
> write: 6.69s, 10.90s, 10.98s avg:9.52s (1050KB/s)
> load avg right after copy&sync: 0.03 -> 0.43
>
> ubiblk(vfat mount)
> read: 0.46s, 0.47s, 0.46s avg: 0.463s (21.5MB/s)
> write: 12.13s, 14.95s, 12.61s avg:13.23s (755KB/s)
> load avg right after copy&sync: 0.02 -> 0.31
>
> With above result, it seems that there is some overload in ubi.
>

with the same device, I did the same test on micro SD.
write: 4.98s, 5.43s, 6.34s avg:5.58s (1792KB/s)
load avg right after copy&sync: 0.03 -> 0.33

It seems that there may be no meaning about comparing with ubifs and
microSD. but, I think that is helpful to someone in this mailing list.


regards,
KeunO Park.
