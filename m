Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGzvZ-0007P8-E7
 for linux-mtd@lists.infradead.org; Fri, 30 Jan 2015 00:59:17 +0000
Received: by mail-ie0-f172.google.com with SMTP id at20so247602iec.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jan 2015 16:58:55 -0800 (PST)
MIME-Version: 1.0
Sender: namnguyen@google.com
From: Nam Nguyen <namnguyen@chromium.org>
Date: Thu, 29 Jan 2015 16:58:35 -0800
Message-ID: <CA+YNSmW28UAqJsfXrdDd=sHmaL5Gk_yuHRhxB-2ydnKEX5Gnww@mail.gmail.com>
Subject: UBI on top of a smaller portion of a bigger MTD device
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: Mike Frysinger <vapier@chromium.org>, dehrenberg@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list,

I am wondering if there is interest to make ubi utils work with a
partial range on the MTD device, like other mtd utils. I would
contribute code to make that happen.

Use case:

We have one big NAND device on which we store kernel (a blob), rootfs
(ext4) and other ubifs. The partition info of that device is stored in
a NOR device. Upon boot, the firmware reads from NOR device, passes
partition values to the kernel via device tree, and the kernel will
set up MTD partitions. The MTD module is compiled in because rootfs is
on it.

In recovery mode, however, the firmware does not read anything from
the (writable) NOR flash for fear of grabbing garbage values and
bricking the device. Hence the kernel has no info about any MTD
partition. Yet the recovery USB stick does have such information on
its rootfs. So we were thinking maybe we could augment ubi-utils with
where the partition starts, where it ends, to work with the raw NAND
device.

I talked to derRichard in #mtd channel. Perhaps this email could
explain it better on why we can't set up MTD partitions.

If there is any other way to achieve the same goal, I'd love to hear
about it too.

Thanks,
Nam
