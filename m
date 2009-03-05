Received: from proofpoint1.lanl.gov ([204.121.3.25])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lf1Lq-0004Dw-Fu
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 00:22:17 +0000
Message-ID: <49AF1B16.5000907@lanl.gov>
Date: Wed, 04 Mar 2009 17:21:42 -0700
From: "Marcus G. Daniels" <mdaniels@lanl.gov>
MIME-Version: 1.0
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [Cbe-oss-dev] [PATCH/RFC] ps3/block: Add ps3vram-ng driver for
	accessing video RAM as block device
References: <alpine.LRH.2.00.0903041444300.32279@vixen.sonytel.be>
In-Reply-To: <alpine.LRH.2.00.0903041444300.32279@vixen.sonytel.be>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, Linux/PPC Development <linuxppc-dev@ozlabs.org>,
	linux-mtd@lists.infradead.org,
	Vivien Chappelier <vivien.chappelier@free.fr>,
	Cell Broadband Engine OSS Development <cbe-oss-dev@ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Geert Uytterhoeven wrote:
> Ideally, we think it would be best if the existing MTD-based ps3vram driver
> would be replaced by the new block-based ps3vram driver before 2.6.29 is
> released. This would relieve the burden of supporting two different swap space
> schemes on PS3 (swap on /dev/mtdblock0 vs. /dev/ps3vram) from the distro
> maintainer's shoulders, as in that case there would never have been a stable
> kernel version containing the MTD-based ps3vram driver.
> [..]
>   - ps3vram-ng is faster than ps3vram:
>       o 1 MiB blocks: +50% (read), +5% (write)
>       o 4 KiB blocks: +50% (read), +5% (write)
>       o 512 B blocks: +10% (read), +10% (write)
>   
Fwiw, it's a useful swap device, since space is so limited -- the 
performance improvements are certainly appealing too.

Marcus
