Received: from py-out-1112.google.com ([64.233.166.177])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fpged-00084X-5L
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 03:16:20 -0400
Received: by py-out-1112.google.com with SMTP id i49so3409735pyi
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 00:16:03 -0700 (PDT)
Message-ID: <3a00f25a0606120016s7bebf353q6a9a790fc772ca58@mail.gmail.com>
Date: Mon, 12 Jun 2006 15:16:03 +0800
From: "Brian Wang" <brian.wang.0721@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD NFTL Performance
In-Reply-To: <3a00f25a0606081841n5f727893u6792e2c0c2c89db3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <3a00f25a0606081841n5f727893u6792e2c0c2c89db3@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I am wondering what kind of performance figure is _reasonable_ when we
use NFTL on NAND flash.

Here is mine:
Platform: S3C2410X, 202MHz ARM920T, with a built-in hardware NAND
controller, and a Samsung K9F1208 NAND (8-bit)
- Hardware ECC is turned on
- No debug messages
- nftl_format on an MTD partition of about 62MB takes 4m 0.39s
- Copy 17688580 bytes from tmpfs (RAM) to that partition (FAT32) takes
18.73s; this is about 922 kB/s

* I have to use FAT32 + NFTL because this device is going to behave as
a USB mass storage device.

Is that performance figure reasonable?
What gets in my head is that nowadays, USB high-speed flash
controllers can get 6-8 MB/s throughput.
Many of them have 8051 embedded, but mine is an ARM9...
I know the translation layer gets some overhead, but so does the USB
flash controllers that implement some wear-levelling algorithms.

Could someone give me a hint?  Must be missing something here...

Thanks. :-)



brian

-- 
brian
iMaGiNaTiOn iS mOrE iMpOrTaNt tHaN kNoWlEdGe
