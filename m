Received: from moutng.kundenserver.de ([212.227.126.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IS8xH-00083t-KH
	for linux-mtd@lists.infradead.org; Mon, 03 Sep 2007 06:14:55 -0400
Message-ID: <46DBDE75.90203@anagramm.de>
Date: Mon, 03 Sep 2007 12:14:13 +0200
From: Clemens Koller <clemens.koller@anagramm.de>
MIME-Version: 1.0
To: bryan.wu@analog.com
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
References: <1188804323.29566.6.camel@roc-laptop>
In-Reply-To: <1188804323.29566.6.camel@roc-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Bryan!

Bryan Wu schrieb:
> This is the driver for latest Blackfin BF54x nand flash controller
> 
>  - use nand_chip and mtd_info common nand driver interface
>  - provide both PIO and dma operation
>  - compiled with ezkit bf548 configuration
>  - use hardware 1-bit ECC
>  - tested with YAFFS2 and can mount YAFFS2 filesystem as rootfs

Looks great!

Will this driver also work for the new BF52x series of the Blackfin Series?
(Or is it planned to make it work for... anytime soon.)

Thank you!
-- 
Clemens Koller
__________________________________
R&D Imaging Devices
Anagramm GmbH
Rupert-Mayer-Straße 45/1
Linhof Werksgelände
D-81379 München
Tel.089-741518-50
Fax 089-741518-19
http://www.anagramm-technology.com
