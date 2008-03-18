Received: from de01egw01.freescale.net ([192.88.165.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jbe9R-0006oP-PI
	for linux-mtd@lists.infradead.org; Tue, 18 Mar 2008 15:55:03 +0000
Date: Tue, 18 Mar 2008 10:54:45 -0500
From: Scott Wood <scottwood@freescale.com>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] fsl_elbc_nand: fix mtd name
Message-ID: <20080318155445.GA17944@ld0162-tx32.am.freescale.net>
References: <20080318154344.GA31173@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080318154344.GA31173@localhost.localdomain>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 18, 2008 at 06:43:44PM +0300, Anton Vorontsov wrote:
> With this patch applied fsl_elbc_nand chip will have proper name:
> 
>    root@b1:~# cat /proc/mtd
>    dev:    size   erasesize  name
>    mtd0: 00800000 00010000 "fe000000.flash"
>    mtd1: 02000000 00004000 "e0600000.flash"
> 
> p.s. We can't use priv->dev->bus_id as in physmap_of, because
> fsl_elbc_nand pretends to be a localbus controller, so its bus_id is
> "address.localbus", which is incorrect and thus will also not work
> for multiple chips.

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
