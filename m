Received: from mail-yw0-f44.google.com ([209.85.213.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SokvF-0000IA-RF
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 00:36:55 +0000
Received: by yhq56 with SMTP id 56so769677yhq.17
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 17:36:51 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 10 Jul 2012 17:36:51 -0700
Message-ID: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
Subject: MLC NAND: all 0xff after erase?
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Kevin Cernekee <cernekee@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Joel Reardon <reardonj@inf.ethz.ch>, David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I've seen some issues with MLC NAND and where I might erase a block,
read it back, and receive a few bitflips such that the data is not
entirely 0xff (i.e., a few bytes may be 0xfe, 0x7f, 0xf7, etc.).
However, I also notice that UBI, UBIFS, and YAFFS2 all make the
assumption that an erased page/block will be totally pristine: all
0xff. This brings me to my main question:

Can someone find an example MLC NAND datasheet that guarantees reading
an erased page will yield all 0xff data?

On first read, in fact, an example MLC datasheet doesn't even define
what "clearing the contents of a block" means. From the datasheet [1]:

  "Erase operations are used to clear the contents of a block in the
NAND Flash array to prepare its pages for program operations."

This doesn't guarantee what happens when performing READ_PAGE on the
cleared block.

Now, if we truly cannot rely on fully-0xff after erase, then this
suggests a need for change in several different layers. A few comments
and proposals:

* A few bitflips on an otherwise-0xff page should not be treated as
unhandled corruption, as long as the erase operation did not return an
error status. Such a page should be still usable, provided the driver
has sufficient ECC capability.

* My NAND controller's HW ECC flags these erased-page bitflips as
uncorrectable errors, as there was no ECC written to the page and the
read data does not match the 0xff special "erased" case. I assume most
other ECC mechanisms would treat this similarly [2]. In such cases, I
suspect that the best the driver can do is to return the raw data
(0xff with flips) and an ECC error message.

* UBI and other FS layers need to distinguish between: (a) 0xff
cleanly-erased, (b) 0xff with bitflips, and (c) true ECC errors. In
the end, we may treat (a) and (b) the same (as erased pages), but the
problem is distinguishing between (b) and (c). This may require
modifications to:

  - the MTD API, to provide explicit notification of erased blocks.
For instance, we might introduce a new return code for mtd_read() that
represents (b); when MTD detects an ECC error, we check for all 0xff
with a threshold of bitflips, then return either -EBADMSG or a special
ERASED code.

  - UBI/UBIFS/other-FS's, to utilize the new ERASED return code that
can be checked before checking for all-0xff. Either the ERASED code or
all-0xff data would be considered "erased".

Any comments are welcome, especially regarding my first question.

Thanks,
Brian

[1] Datasheet for Micron MT29F32G08CBABA
[2] Counterexample: it seems NAND_ECC_SOFT actually corrects a single
bitflip in 0xff data. Tested with nandsim and `nandwrite -n -o`.
