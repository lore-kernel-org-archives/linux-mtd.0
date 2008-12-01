Received: from mgw1.diku.dk ([130.225.96.91])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7Cji-0003gw-VQ
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 17:39:07 +0000
Date: Mon, 1 Dec 2008 18:39:01 +0100 (CET)
From: Julia Lawall <julia@diku.dk>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] drivers/mtd/nand/pasemi_nand.c: Add missing pci_dev_put
In-Reply-To: <20081201174327.GA21274@lixom.net>
Message-ID: <Pine.LNX.4.64.0812011838440.11341@pc-004.diku.dk>
References: <Pine.LNX.4.64.0811271319070.15160@pc-004.diku.dk>
	<20081201174327.GA21274@lixom.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 1 Dec 2008, Olof Johansson wrote:

> On Thu, Nov 27, 2008 at 01:19:49PM +0100, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > pci_get_device increments a reference count that should be decremented
> > using pci_dev_put.  I have thus added an extra label in the error handling
> > code to do this.  I don't know, however, whether there should be a
> > pci_dev_put before the return 0 as well.
> > 
> [...]
> 
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> Acked-by: Olof Johansson <olof@lixom.net>

Do you know the answer about the return 0?

julia
