Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPha0-00061G-Sg
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2009 18:13:35 +0000
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	n0LIDPis019501 for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jan 2009 11:13:26 -0700 (MST)
Received: from ld0162-tx32.am.freescale.net (ld0162-tx32.am.freescale.net
	[10.82.19.112])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id n0LIDPZ0021814
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jan 2009 12:13:25 -0600 (CST)
Date: Wed, 21 Jan 2009 12:13:24 -0600
From: Scott Wood <scottwood@freescale.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc: more printing warning fixes for the l64 to ll64
	conversion
Message-ID: <20090121181324.GA32224@ld0162-tx32.am.freescale.net>
References: <20090121111651.7d6e87ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090121111651.7d6e87ec.sfr@canb.auug.org.au>
Cc: Nick Spence <nick.spence@freescale.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@ozlabs.org, Egor Martovetsky <egor@pasemi.com>,
	Paul Mackerras <paulus@samba.org>,
	Doug Thompson <dougthompson@xmission.com>,
	Olof Johansson <olof@lixom.net>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	bluesmoke-devel@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 21, 2009 at 11:16:51AM +1100, Stephen Rothwell wrote:
> -	printk(KERN_INFO "eLBC NAND device at 0x%zx, bank %d\n",
> +	printk(KERN_INFO "eLBC NAND device at 0x%llx, bank %d\n",
>  	       res.start, priv->bank);

This won't work if resource_size_t is 32-bit; it needs a cast.

ACK the other two fsl_elbc fixes.

-Scott
