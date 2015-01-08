Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9IJn-0001tG-Me
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 19:00:29 +0000
Received: by mail-ig0-f174.google.com with SMTP id hn15so4320637igb.1
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 11:00:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALupW3AMWWs57nKEy1OsP_3ZLLH_US1ZPua+s8-qOWLVcnRd_g@mail.gmail.com>
References: <CALupW3AMWWs57nKEy1OsP_3ZLLH_US1ZPua+s8-qOWLVcnRd_g@mail.gmail.com>
Date: Thu, 8 Jan 2015 11:00:03 -0800
Message-ID: <CAAK6Zt3kirnghmg2ghP+U1hru-Muim90=yYDGmY+YSincmEKAQ@mail.gmail.com>
Subject: Re: WP# line on flash chip?
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Steve deRosier <derosier@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In designs I've worked on, the WP# line is only low initially when
coming out of reset in order to prevent random signals that might go
on the bus from messing up the state of the chip. You can hold it high
the rest of the time. So it's not typically controlled by the kernel
but by simple structures on the board itself. In fact, the kernel
can't drive it appropriately because the important time to hold it low
is before the kernel is up (or actually it can go low sooner than
that), and by the time the kernel is up, it's fine to have it high all
the time.

Dan

On Thu, Jan 8, 2015 at 9:59 AM, Steve deRosier <derosier@gmail.com> wrote:
> Our flash chip has an active-low write-protect line controlled via a
> GPIO. It's out-of-band of everything, the interface still has CS and
> other normal signals and those are connected to the NAND controller
> pins on our controller.  This pin isn't controlled by the controller,
> it's a GPIO activated pin. It's also out-of-band of the various LOCK
> commands that can be sent.
>
> The datasheet basically says it locks down the chip so that random
> data on the bus doesn't cause erase or programs.  Micron is telling us
> that we really should keep it asserted and only deassert it when we
> want to erase/write the device.  Right now, we deassert it shortly
> after boot.
>
> I can't find any way to add this pin to our device tree, nor do I see
> any evidence for support in either our atmel_nand driver or in
> higher-level MTD stuff like nand_base.
>
> Does the support for this exist and am I simply missing finding it, or
> is it not there at all (expected)?
>
> Assuming it's not there, and assuming I actually add it, is this a
> feature that the MTD maintainers would allow to go upstream? I'm
> assuming it's not a unique feature to this chip and that other chips
> may have it.
>
> Thanks,
> - Steve
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
