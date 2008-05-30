Received: from rv-out-0708.google.com ([209.85.198.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1ypn-0002nQ-Nd
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 07:15:32 +0000
Received: by rv-out-0708.google.com with SMTP id b17so4508220rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 May 2008 00:15:30 -0700 (PDT)
Message-ID: <5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
Date: Fri, 30 May 2008 16:15:30 +0900
From: "KeunO Park" <lastnite@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
In-Reply-To: <1212129223.31023.106.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Yes, yaffs, jffs2 are "special" class of file-systems and they were not
> designed to be what you call "mass storage class func". They should
> rather be used as root file system on "internal" flash, which is smaller
> than "mass memory", where you store your core libraries, etc.
>
>> yaffs2
>> write: 10.20s, 12.09s, 12.24s avg:11.51s (868KB/s)
>> load avg right after copy&sync: 0.03 -> 0.11
>>
>> ubifs (LZO)
>> write: 14.45s, 14.40s, 14.45s avg:14.43s (693KB/s)
>> load avg right after copy&sync: 0.03 -> 0.53
>>
>> ubifs (ZLIB)
>> write : 27.17s, 27.18s, 27.21s avg:27.18 (367KB/s)
>> load avg right after copy&sync: 0.03 -> 0.80
>>
>> ubifs (No Compression)
>> write: 6.69s, 10.90s, 10.98s avg:9.52s (1050KB/s)
>> load avg right after copy&sync: 0.03 -> 0.43
> We beat yaffs2? Sounds nice :-)

according to the above result(and only with no compressor option :-), yes.
but, I think that load avg result is too much higher than yaffs2's.
this may result in some critical situation especially on the mobile phone.
For example, camera or camcorder application in mobile devices need to write
the encoded display data steadily to NAND. so because of the high load avg,
we may get stuttered display result.
(I had experienced this before with the combination of 416Mhz pxa27x &
mdoc tffs)
so I wanna more light ubi.

regards,
KeunO Park
