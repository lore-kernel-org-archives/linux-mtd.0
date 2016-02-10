Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aTVfg-0005lt-0E
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2016 14:23:11 +0000
Received: by mail-qg0-x22e.google.com with SMTP id y9so14376729qgd.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2016 06:22:47 -0800 (PST)
Date: Wed, 10 Feb 2016 11:22:42 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Ofer Heifetz <oferh@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx_nand: add support for partial chunks
Message-ID: <20160210142242.GA1352@laptop.cereza>
References: <1455112461-20713-1-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455112461-20713-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10 Feb 02:54 PM, Thomas Petazzoni wrote:
> This commit is needed to properly support the 8-bits ECC configuration
> with 4KB pages.
> 
> When pages larger than 2 KB are used on platforms using the PXA3xx
> NAND controller, the reading/programming operations need to be split
> in chunks of 2 KBs or less because the controller FIFO is limited to
> about 2 KB (i.e a bit more than 2 KB to accomodate OOB data). Due to
> this requirement, the data layout on NAND is a bit strange, with ECC
> interleaved with data, at the end of each chunk.
> 
> When a 4-bits ECC configuration is used with 4 KB pages, the physical
> data layout on the NAND looks like this:
> 
> | 2048 data | 32 spare | 30 ECC | 2048 data | 32 spare | 30 ECC |
> 
> So the data chunks have an equal size, 2080 bytes for each chunk,
> which the driver supports properly.
> 
> When a 8-bits ECC configuration is used with 4KB pages, the physical
> data layout on the NAND looks like this:
> 
> | 1024 data | 30 ECC | 1024 data | 30 ECC | 1024 data | 30 ECC | 1024 data | 30 ECC | 64 spare | 30 ECC |
> 
> So, the spare area is stored in its own chunk, which has a different
> size than the other chunks. Since OOB is not used by UBIFS, the initial
> implementation of the driver has chosen to not support reading this
> additional "spare" chunk of data.
> 
> Unfortunately, Marvell has chosen to store the BBT signature in the
> OOB area. Therefore, if the driver doesn't read this spare area, Linux
> has no way of finding the BBT. It thinks there is no BBT, and rewrites
> one, which U-Boot does not recognize, causing compability problem
> between the bootloader and the kernel in terms of NAND usage.
> 
> To fix this, this commit implements the support for reading a partial
> last chunk. This support is currently only useful for the case of 8
> bits ECC with 4 KB pages, but it will be useful in the future to
> enable other configurations such as 12 bits and 16 bits ECC with 4 KB
> pages, or 8 bits ECC with 8 KB pages, etc. All those configurations
> have a "last" chunk that doesn't have the same size as the other
> chunks.
> 
> In order to implement reading of the last chunk, this commit:
> 
>  - Adds a number of new fields to the pxa3xx_nand_info to describe how
>    many full chunks and how many chunks we have, the size of full
>    chunks and partial chunks, both in terms of data area and spare
>    area.
> 
>  - Fills in the step_chunk_size and step_spare_size variables to
>    describe how much data and spare should be read/written for the
>    current read/program step.
> 
>  - Reworks the state machine to accommodate doing the additional read
>    or program step when a last partial chunk is used.
> 
> This commit has been tested on a Marvell Armada 398 DB board, with a
> 4KB page NAND, tested in both 4 bits ECC and 8 bits ECC
> configurations. Robert Jarzmik has tested on some PXA platforms.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
