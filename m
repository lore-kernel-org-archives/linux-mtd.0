Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P70su-0003gi-JH
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 07:08:53 +0000
Received: by wyi11 with SMTP id 11so1628992wyi.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 00:08:50 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 16 Oct 2010 15:08:46 +0800
Message-ID: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
Subject: Re :Re: [Help] SST39VF6401B Support
From: yidong zhang <zhangyd6@gmail.com>
To: yegorslists@googlemail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: taliaferro62@gmail.com, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi

>Just to apply the patch and see what happens. The most important part
>of this patch is:
>
>Please refer to the data sheets Table 6:
>39VF6401B data sheet http://www.sst.com/downloads/datasheet/S71288.pdf
>39VF6401 data sheet http://www.sst.com/downloads/datasheet/S71223-03.pdf
>
>The difference in the 6th bus write cycle. 39VF6401B uses 0x50 and
>39VF6401 uses 0x30.
>
>Without this even if the chip gets detected you cannot write to it.
>
>I haven't look at this since my try to submit this patch, so I don't
>know how to fix the stuff for cfi_probe.

 Recently, i use the 39VF6401B flash, and i apply your patch. The chip
can be get detected. But when i erase one sector, it use 0x30 to erase
one block. The size of a block is much bigger than a sector as we
know.So i use the JEDEC probe to detect the flash. And i make the
erase size to one block-erase size. And it works fine. So i think
the  chip(39VF6401B)  should not be CFI compliant, maybe the  JEDEC
mode is better.

Regards,
zhang
