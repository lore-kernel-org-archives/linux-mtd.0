Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y62iP-0007Wx-0L
 for linux-mtd@lists.infradead.org; Tue, 30 Dec 2014 19:44:26 +0000
Received: by mail-ie0-f169.google.com with SMTP id y20so14078960ier.0
 for <linux-mtd@lists.infradead.org>; Tue, 30 Dec 2014 11:44:03 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 30 Dec 2014 11:44:03 -0800
Message-ID: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>
Subject: Does UBIFS NAND ECC info get stored in OOB?
From: Steve deRosier <derosier@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi All,

Sorry if this is a stupid question, but I found a number of old
archived messages that explicitly state that UBIFS (actually, probably
UBI) doesn't utilize the OOB of a NAND flash at all for storing the
ECC information. And as near as I can tell from behavior and code, it
does certainly store ECC info in the OOB area.

So, does UBIFS utilize the OOB area to store ECC bits?  And if not,
where/how does it store this information?

I'm starting to assume that you're simply saying that UBIFS itself
doesn't use the OOB area, nor even handles the ECC itself, but that's
up to the chip driver layer. And that the driver will handle the ECC
and OOB as appropriate.  Am I correct?

Details of my question:

We're having some trouble with filesystem corruption on a Linux 3.8
kernel based on an Atmel SAM9g25 controller.  The controller does have
the PMECC unit.

It utilizes the mtd/nand/atmel_nand.c driver. This driver has the
PMECC bits in it and does appear to write/read/correct-via ECC bits in
the OOB area of the NAND.

We're using UBIFS for our rootfs.

And yes, I understand the 3.8 kernel is old, and we're upgrading, but
I'm trying to figure out why we're having the problems as I'm assuming
it's not a bug in the code but more of a configuration or process or
hardware issue.

One example of finding that UBI & UBIFS doesn't use the OOB area is "
this is not a problem for UBI/UBIFS, because neither UBIFS nor UBI use
OOB area;" from http://www.linux-mtd.infradead.org/doc/ubifs.html

Thanks any help,
- Steve
