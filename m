Received: from de01egw01.freescale.net ([192.88.165.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JbePh-0002YF-8o
	for linux-mtd@lists.infradead.org; Tue, 18 Mar 2008 16:11:45 +0000
Date: Tue, 18 Mar 2008 11:11:39 -0500
From: Scott Wood <scottwood@freescale.com>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH v2] fsl_elbc_nand: fix mtd name
Message-ID: <20080318161139.GD17944@ld0162-tx32.am.freescale.net>
References: <20080318154344.GA31173@localhost.localdomain>
	<20080318155814.GA5223@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080318155814.GA5223@localhost.localdomain>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 18, 2008 at 06:58:14PM +0300, Anton Vorontsov wrote:
> Oops, forgot the NULL checking.
[snip] 
> +	if (priv->mtd.name)
> +		kfree(priv->mtd.name);
> +

Not needed; kfree(NULL) is a no-op.

-Scott
