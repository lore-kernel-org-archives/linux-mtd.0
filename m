Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YH0CR-0006Qx-TV
 for linux-mtd@lists.infradead.org; Fri, 30 Jan 2015 01:16:44 +0000
Received: by mail-ob0-f170.google.com with SMTP id wp4so21335139obc.1
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jan 2015 17:16:21 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
In-Reply-To: <CA+YNSmW28UAqJsfXrdDd=sHmaL5Gk_yuHRhxB-2ydnKEX5Gnww@mail.gmail.com>
References: <CA+YNSmW28UAqJsfXrdDd=sHmaL5Gk_yuHRhxB-2ydnKEX5Gnww@mail.gmail.com>
Date: Thu, 29 Jan 2015 17:16:20 -0800
Message-ID: <CAAK6Zt1oKBEwJkF6pUvsOvKUG7e0GXef8AxgXqPfgoBqmBWxhg@mail.gmail.com>
Subject: Re: UBI on top of a smaller portion of a bigger MTD device
From: Daniel Ehrenberg <dehrenberg@chromium.org>
To: Nam Nguyen <namnguyen@chromium.org>
Content-Type: text/plain; charset=UTF-8
Cc: Mike Frysinger <vapier@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To give slightly more context, we use the same built kernel image in
two modes: One when booting from USB in a "recovery" mode meant to do
a reinstallation to the device, and the other when operating normally.
These have the same kernel command-line arguments, device tree, etc.
In normal boot, the firmware augments the device tree with the
partition table read from NOR, and in USB boot it does not (that might
be wrong anyway--we are recovering, after all). I see two ways that we
could do the installation to the device:
- Make a simple modification to ubiformat to give it offset and length
parameters for a "soft partition" on the device. Another member of our
group has already made a change to nandwrite to do the same thing, and
it seems to have been accepted upstream. This would be very little
code change in mtdutils and not require any kernel code.
- Implement a dynamic MTD partitioning mechanism. We can't simply pass
the partition table through modprobe when loading the NAND driver
because the NAND driver is built-in (since it's what we're loading the
rootfs off of). I thought this option would be a lot more work to
implement. I thought it might be difficult to upstream in part because
there's already a dynamic ubi partitioning mechanism. We're unable to
use ubi partitions for everything, however, since the kernel is read
from the firmware (our firmware is based on depthcharge), and ubi
seems like a lot of code to port to a firmware codebase that prides
itself on being in the low tens of thousands of lines of code.
Instead, we use several MTD partitions, some of which are formatted
with UBI and have one UBI volume on each.

Dan

On Thu, Jan 29, 2015 at 4:58 PM, Nam Nguyen <namnguyen@chromium.org> wrote:
> Hello list,
>
> I am wondering if there is interest to make ubi utils work with a
> partial range on the MTD device, like other mtd utils. I would
> contribute code to make that happen.
>
> Use case:
>
> We have one big NAND device on which we store kernel (a blob), rootfs
> (ext4) and other ubifs. The partition info of that device is stored in
> a NOR device. Upon boot, the firmware reads from NOR device, passes
> partition values to the kernel via device tree, and the kernel will
> set up MTD partitions. The MTD module is compiled in because rootfs is
> on it.
>
> In recovery mode, however, the firmware does not read anything from
> the (writable) NOR flash for fear of grabbing garbage values and
> bricking the device. Hence the kernel has no info about any MTD
> partition. Yet the recovery USB stick does have such information on
> its rootfs. So we were thinking maybe we could augment ubi-utils with
> where the partition starts, where it ends, to work with the raw NAND
> device.
>
> I talked to derRichard in #mtd channel. Perhaps this email could
> explain it better on why we can't set up MTD partitions.
>
> If there is any other way to achieve the same goal, I'd love to hear
> about it too.
>
> Thanks,
> Nam
