Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9HNH-00060n-Jw
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 18:00:00 +0000
Received: by mail-ig0-f177.google.com with SMTP id z20so4119855igj.4
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 09:59:37 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 8 Jan 2015 09:59:37 -0800
Message-ID: <CALupW3AMWWs57nKEy1OsP_3ZLLH_US1ZPua+s8-qOWLVcnRd_g@mail.gmail.com>
Subject: WP# line on flash chip?
From: Steve deRosier <derosier@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our flash chip has an active-low write-protect line controlled via a
GPIO. It's out-of-band of everything, the interface still has CS and
other normal signals and those are connected to the NAND controller
pins on our controller.  This pin isn't controlled by the controller,
it's a GPIO activated pin. It's also out-of-band of the various LOCK
commands that can be sent.

The datasheet basically says it locks down the chip so that random
data on the bus doesn't cause erase or programs.  Micron is telling us
that we really should keep it asserted and only deassert it when we
want to erase/write the device.  Right now, we deassert it shortly
after boot.

I can't find any way to add this pin to our device tree, nor do I see
any evidence for support in either our atmel_nand driver or in
higher-level MTD stuff like nand_base.

Does the support for this exist and am I simply missing finding it, or
is it not there at all (expected)?

Assuming it's not there, and assuming I actually add it, is this a
feature that the MTD maintainers would allow to go upstream? I'm
assuming it's not a unique feature to this chip and that other chips
may have it.

Thanks,
- Steve
