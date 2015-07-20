Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZH4v2-00088U-FX
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 06:51:21 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Cory Tusar <cory.tusar@pid1solutions.com>
Cc: Han Xu <han.xu@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] mtd: fsl-quadspi: Add mutex for accessing different
 SPI-NOR devices
Date: Mon, 20 Jul 2015 08:50:48 +0200
Message-ID: <22821071.S74fF7YYzh@ws-stein>
In-Reply-To: <55A7E9FA.4040704@pid1solutions.com>
References: <1437056014-16928-1-git-send-email-alexander.stein@systec-electronic.com>
 <55A7E9FA.4040704@pid1solutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Cory,

On Thursday 16 July 2015 13:29:30, Cory Tusar wrote:
> On 07/16/2015 10:13 AM, Alexander Stein wrote:
> > Access is only serialized for each NOR device in spi_nor_lock_and_prep(),
> > but not for the QSPI device.
>
> Are both devices that you're testing with in the below scenario QSPI, or
> is it a combination of QSPI + some other MTD device?

On my board a s70fl01gs is connected to QSPI bank A. As this is a dual-die 
chip it uses both chip-selcts on bank A. So in the end it's 2 QSPI devices.
When accessing different flashs on those 2 chip-selects i get the following
error message:
> [  233.157410] fsl-quadspi 1550000.quadspi: cmd 0x05 timeout, addr@00000000,
> FR:0x08000000, SR:0x00003c00 [  233.166731] error -110 reading SR
> [  233.170097] end_request: I/O error, dev mtdblock3, sector 72
> [  233.175740] Buffer I/O error on device mtdblock3, logical block 9

This seems to be caused by simultaneously access to different chips.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-11xx
Fax:    +49 (0) 0) 3765 38600-41xx
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
