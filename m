Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dCllm-00006j-H6
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 11:45:07 +0000
Date: Mon, 22 May 2017 13:44:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jan Glauber <jglauber@cavium.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 2/2] nand: cavium: Nand flash controller for Cavium
 ARM64 SOCs
Message-ID: <20170522134437.5947abf7@bbrezillon>
In-Reply-To: <20170327160524.29019-3-jglauber@cavium.com>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-3-jglauber@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 27 Mar 2017 18:05:24 +0200
Jan Glauber <jglauber@cavium.com> wrote:

> Add a driver for the nand flash controller as found on Cavium's
> ARM64 SOCs.
> 
> The nand flash controller can support up to 8 chips and is presented
> as a PCI device. It uses a DMA engine to transfer data between the nand
> and L2/DRAM and a programmable command queue to issue multiple
> nand flash commands together.
> 
> Signed-off-by: Jan Glauber <jglauber@cavium.com>
> ---
>  drivers/mtd/nand/Kconfig       |    6 +
>  drivers/mtd/nand/Makefile      |    1 +
>  drivers/mtd/nand/cavium_nand.c | 1160 ++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/cavium_nand.h |  231 ++++++++

Just noticed that you create a .h file to define driver structs and
macros, but those definitions are actually only used in cavium_nand.c.
Please move everything to cavium_nand.c.
