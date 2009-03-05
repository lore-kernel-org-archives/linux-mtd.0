Received: from mx1.suse.de ([195.135.220.2])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lf7pi-00081g-9n
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 07:17:32 +0000
Message-Id: <AA44F8E7-5FBC-4378-A86D-C094ECABD625@aepfle.de>
From: Olaf Hering <olaf@aepfle.de>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
In-Reply-To: <alpine.LRH.2.00.0903041444300.32279@vixen.sonytel.be>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v930.3)
Subject: Re: [PATCH/RFC] ps3/block: Add ps3vram-ng driver for accessing video
	RAM as block device
Date: Thu, 5 Mar 2009 08:17:24 +0100
References: <alpine.LRH.2.00.0903041444300.32279@vixen.sonytel.be>
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, Linux/PPC Development <linuxppc-dev@ozlabs.org>,
	linux-mtd@lists.infradead.org,
	Vivien Chappelier <vivien.chappelier@free.fr>,
	David Woodhouse <dwmw2@infradead.org>,
	Cell Broadband Engine OSS Development <cbe-oss-dev@ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.03.2009 um 14:57 schrieb Geert Uytterhoeven:

> Ideally, we think it would be best if the existing MTD-based ps3vram  
> driver
> would be replaced by the new block-based ps3vram driver before  
> 2.6.29 is
> released. This would relieve the burden of supporting two different  
> swap space
> schemes on PS3 (swap on /dev/mtdblock0 vs. /dev/ps3vram) from the  
> distro
> maintainer's shoulders, as in that case there would never have been  
> a stable
> kernel version containing the MTD-based ps3vram driver.

openSuSE already ships with the ps3vram driver since a two releases.
A simple name based udev rule could symlink ps3vram to mtdblock0, so  
an upgrade
will not break existing setups.

> +obj-$(CONFIG_PS3_VRAM)		+= ps3vram_ng.o

Please give the driver the obvious name "ps3vram", that way upgrading  
will be smooth.

I see our old mtddriver does not have modalias support for autoloading.
Hopefully the new driver has this feature.

Olaf
