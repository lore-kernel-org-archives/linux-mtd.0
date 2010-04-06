Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nz4UA-0003kU-Dc
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2010 08:50:15 +0000
Subject: Re: Can not mount UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=E6=9E=97=E4=BA=8E=E5=B3=BB?= <okpalin@gmail.com>
In-Reply-To: <a145ef951003102343h58c7f78bh5c2ed3357fe0fe4e@mail.gmail.com>
References: <a145ef951003102343h58c7f78bh5c2ed3357fe0fe4e@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Apr 2010 11:48:36 +0300
Message-ID: <1270543716.6754.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2010-03-11 at 15:43 +0800, 林于峻 wrote:
> Dear all,
> 
> I am trying UBIFS on android on nVidia Tegra T20.
> I add a new MTD partition, flash_eraseall, ubiattach, ubimkvol, and mount it.
> Error occurs when mount it.
> 
> The total command I enter is:
>     # ubidetach /dev/ubi_ctrl -d 0
>     ubidetach /dev/ubi_ctrl -d 0
>     # flash_eraseall /dev/mtd/mtd4
>     flash_eraseall /dev/mtd/mtd4

Better use ubiformat instead of flash_eraseall:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_ubierase

>     Erasing 128 Kibyte @ 2000000 -- 100 % complete.
>     # ubiattach /dev/ubi_ctrl -m 4
>     ubiattach /dev/ubi_ctrl -m 4
>     UBI device number 0, total 256 LEBs (32505856 bytes, 31.0 MiB),
> available 250 LEBs (31744000 bytes, 30.3 MiB), LEB size 126976 bytes
> (124.0 KiB)
>     # ubimkvol /dev/ubi0 -m -N rootfs
>     ubimkvol /dev/ubi0 -m -N rootfs
>     Set volume size to 31744000
>     Volume ID 0, size 250 LEBs (31744000 bytes, 30.3 MiB), LEB size
> 126976 bytes (124.0 KiB), dynamic, name "rootfs", alignment 1
>     # mount -t ubifs ubi0:rootfs /sdcard
>     mount -t ubifs ubi0:rootfs /sdcard
>     mount: Invalid argument
> 
> The NAND flash is HY27UF084G2B.

Could you please first validate your flash with nandtests? Take the
tests from the latest kernel.

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
