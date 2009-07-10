Message-ID: <52588.192.168.10.89.1247225810.squirrel@dbdmail.itg.ti.com>
Date: Fri, 10 Jul 2009 17:06:50 +0530 (IST)
Subject: [PATCH 0/2] [MTD] [NAND] Add prefetch and dma support for omap2/3  
	NAND      driver
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
References: <54851.192.168.10.89.1243946277.squirrel@dbdmail.itg.ti.com>   
	<47286.192.168.10.89.1244108024.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <47286.192.168.10.89.1244108024.squirrel@dbdmail.itg.ti.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
	david-b@pacbell.net, linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have splited gpmc prefetch support for NAND into two patches:
[PATCH 1:2] : Adding support for nand prefetch-read and post-write, in MPU mode.
[PATCH 2:2] : Adding DMA mode support in nand prefetch/post-write

These patches implements Tony's comments. (For comments and discussion see:
http://lists.infradead.org/pipermail/linux-mtd/2009-June/025993.html)

Other than that, gpmc_prefetch_(inti/request) call has been removed, as nothing
great was done in that and we really do not need that.

Function 'gpmc_prefetch_enable' does check for 'if prefetch is already being
used by some other driver?'. And if it is busy, normal cpu copy method for
read/write request will be used.

Thanks and regards,
vimal
