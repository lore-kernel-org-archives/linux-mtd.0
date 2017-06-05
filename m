Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHq1t-0007DX-Og
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 11:18:40 +0000
Received: by mail-wr0-x235.google.com with SMTP id v104so36486433wrb.0
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jun 2017 04:18:16 -0700 (PDT)
Date: Mon, 5 Jun 2017 13:18:13 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Extends block2mtd and ubi drivers
Message-ID: <20170605111813.GD14675@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <cf1d3cae-885c-39dd-f118-c2a0d9682c94@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf1d3cae-885c-39dd-f118-c2a0d9682c94@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 02 June 2017 18:17:06 Richard Weinberger wrote:
> Pali,
> 
> Am 02.06.2017 um 17:43 schrieb Pali Rohár:
> > This patch series extends block2mtd and ubi drivers to better handle
> > read-only devices and allow to load UBI image from local file which was
> > created for nand device.
> > 
> > Tested for Nokia N900 with Maemo 5 rootfs ubifs image
> > (rootfs_RX-51_2009SE_21.2011.38-1_PR_MR0) which has erase size 128k,
> > write size 2k and nand subpage shift 2.
> 
> What is the use case behind this series?

Take existing ubi image (where is one ubifs volume) and unpack it. Or
rather unpack-modify-pack to do some small changes.

> Did you see my nandsim rework some time ago?
> http://lists.infradead.org/pipermail/linux-mtd/2016-September/069422.html

No yet. I have my patches since 2012, but I decided after cleaning up
them to send... As I think they could be useful for other people.

> If you need a way to load files/nanddumps as NAND devices, this should be a good
> starting point.
> This reminds me that I need to revive that series. :-)

nandsim.ko has problem that needs to be loaded with special parameters
compatible with characteristic of target nand for which is ubi image
prepared. Plus it is nand similator and not layer to translate arbitrary
file image on disk to mtd device. block2mtd is what is doing this part.

> > $ losetup -r /dev/loop0 rootfs_RX-51_2009SE_21.2011.38-1_PR_MR0.ubifs
> > $ echo -n /dev/loop0,131072,2048,2 > /sys/module/block2mtd/parameters/block2mtd
> > $ ubiattach -p /dev/mtd0
> > $ mount /dev/ubi0_0 /mnt/ubi -t ubifs
> > ...
> > $ umount /dev/ubi0_0
> > $ ubidetach -p /dev/mtd0
> > $ echo -n del=/dev/loop0 > /sys/module/block2mtd/parameters/block2mtd
> > $ losetup -d /dev/loop0
> 
> The module-parameter interface is odd. IMHO we should not extend it.

That file is used for adding new mapping from block device to mtd
device. Currently there is no other way how to specify that mapping or
removing mapping.

If you have better idea, let me know and I would try to implement it.

-- 
Pali Rohár
pali.rohar@gmail.com
