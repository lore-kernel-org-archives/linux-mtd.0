Received: from webmail9.mail.yandex.net ([213.180.223.100])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMPHH-0004Kb-7j
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 14:23:16 +0100
Date: Sun, 10 Sep 2006 17:19:15 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <450410D3.000007.27650@webmail9.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: dwmw2@infradead.org
Subject: Re: State of UBI
In-Reply-To: <1157885559.2977.136.camel@pmac.infradead.org>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<1157885559.2977.136.camel@pmac.infradead.org>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, jwboyer@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

>Preliminary impressions are that I'm concerned by the amount of code --
>it's _huge_.

It's subjective. I don't know what does huge mean here. But UBI is
not larger then JFFS2 if you use the slocount program
(http://www.dwheeler.com/sloc/) you'll see it is not larger then JFFS2.

>And I'm concerned by the fact that it doesn't just provide
>MTD devices.

Just because MTD device and UBI volume are two different things. There
are similarities, but they are still different and have different
semantics.

1. UBI works on top of MTD. It's a layer above an (one) MTD device.
   MTD over MTD does not make sense.
2. Most of stuff in MTD inteface is just not needed for UBI.
3. MTD interface does not have many thins UBI needs.

>I had envisaged that it would be fairly much akin to
>another partitioning layer, perhaps requiring a few extra methods to be
>added to the mtd_info.

It'd make MTD totally confusing. Having a separate layer is less error
prone and provides better modularization.

Let me provide an example to show how clear and flexible it is.

Consider a situation when one has a NAND chip. He may want to store
kernel image at a fixed place at the beginning of the flash. And the rest
of the chip he wants to use for data storage.

So, he creates 2 MTD partitions - mtd0 and mtd1. He uses mtd0 for the
kernel image and he feeds mtd1 to UBI. So he ends up with

* mtd0 containing the kernel. He can access it via /dev/mtd0 and change it.
* mtd1 owed by UBI. But he still can access it via /dev/mtd1. E.g., this
  may be needed for debugging purposes.
* ubi0 - a UBI device which manages UBI volumes and uses mtd0 as the storage.
* ubi0_0, ubi0_1, etc - ubi volumes which may be used for JFFS2 file system.

And if the user had 2 NAND chips, he could have mtd3 which is the whole
second chip. Then he could contcatenate mtd2 and mtd3 and create one ubi0
on top of the concatenation. Or he first could apply a striping layer
(BTW, what's going on with it?) on them, and create ubi0 on top of the
striped MTD device. Or, if the chips are very different, he could create
ubi0 on top of mtd2 and ubi1 on top of mtd3 - just 2 separate and independent
UBI devices.

>But it's a new type of device all of its own, and
>requires far more to be changed in MTD users (like JFFS2, FTL, etc.)
>than I had imagined.

VS "it's a new type of device" - yes, it is new type of device by design.
And it is not an MTD device because we already have MTD devices. And it
has its own interface which is small and nice.

VS "requires far more to be changed in MTD users (like JFFS2, FTL, etc.)" -
not really. Yo may emulate an MTD device on top of an UBI device. This is
why we have (?) gluebi.

>And should the 'static partition' stuff be a layer on _top_ of UBI
>rather than an inseparable part of it?

Sorry David, I don't understand this. Refine please. What is "static
partition"? The same as "an MTD partition" - just a piece of physical
flash?

Artem.
