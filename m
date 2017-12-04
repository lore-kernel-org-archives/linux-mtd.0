Received: from smtp.exceet.ch ([77.245.33.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLqrT-0001TS-Ps
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 13:32:49 +0000
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
To: <linux-mtd@lists.infradead.org>, <boris.brezillon@free-electrons.com>
References: <20170529225931.226da943@bbrezillon>
CC: <peterpandong@micron.com>
Message-ID: <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
Date: Mon, 4 Dec 2017 14:32:14 +0100
MIME-Version: 1.0
In-Reply-To: <20170529225931.226da943@bbrezillon>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

 > If everything goes well, we should be good for 4.14, and the patches
 > will have spent enough time in linux-next to discover obvious bugs.

What is the latest status of the SPI-NAND framework patches?

The reason I am asking is, that we have hardware based on the NXP 
i.MX6UL SOC with a serial NAND connected via QSPI interface.

We currently have a working implementation based on a 3.14 vendor kernel 
using a modified version of the "mt29f_spinand" staging driver, but for 
the future we plan to use a recent mainline kernel.

We also think about porting our implementation to the new framework to 
enable support for more SPI NAND chips (Winbond, Toshiba) and for the 
NXP QSPI-controller.

Therefore we would like to know about the current schedule for bringing 
the framework to mainline.

Thanks,

Frieder Schrempf
