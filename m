Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGpGT-0003nM-1A
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 16:17:30 +0000
Subject: Re: [PATCH 0/5] Extends block2mtd and ubi drivers
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <cf1d3cae-885c-39dd-f118-c2a0d9682c94@nod.at>
Date: Fri, 2 Jun 2017 18:17:06 +0200
MIME-Version: 1.0
In-Reply-To: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pali,

Am 02.06.2017 um 17:43 schrieb Pali Rohár:
> This patch series extends block2mtd and ubi drivers to better handle
> read-only devices and allow to load UBI image from local file which was
> created for nand device.
> 
> Tested for Nokia N900 with Maemo 5 rootfs ubifs image
> (rootfs_RX-51_2009SE_21.2011.38-1_PR_MR0) which has erase size 128k,
> write size 2k and nand subpage shift 2.

What is the use case behind this series?

Did you see my nandsim rework some time ago?
http://lists.infradead.org/pipermail/linux-mtd/2016-September/069422.html
If you need a way to load files/nanddumps as NAND devices, this should be a good
starting point.
This reminds me that I need to revive that series. :-)

> $ losetup -r /dev/loop0 rootfs_RX-51_2009SE_21.2011.38-1_PR_MR0.ubifs
> $ echo -n /dev/loop0,131072,2048,2 > /sys/module/block2mtd/parameters/block2mtd
> $ ubiattach -p /dev/mtd0
> $ mount /dev/ubi0_0 /mnt/ubi -t ubifs
> ...
> $ umount /dev/ubi0_0
> $ ubidetach -p /dev/mtd0
> $ echo -n del=/dev/loop0 > /sys/module/block2mtd/parameters/block2mtd
> $ losetup -d /dev/loop0

The module-parameter interface is odd. IMHO we should not extend it.

Thanks,
//richard
