Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cjvp-0002lh-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 09:17:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02021810263602.00860@thomas> 
References: <02021810263602.00860@thomas>  <02021809481101.00860@thomas> <02021720360705.08654@thomas> <11512.1014021987@redhat.com> 
To: gleixner@autronix.de
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 & NAND 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Feb 2002 09:29:11 +0000
Message-ID: <19529.1014024551@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

gleixner@autronix.de said:
> Yes inside JFFS2, but who tells the NAND driver, which layout to use.

Do we really need the NAND driver to be able to use more than one layout? 

Either we have hardware ECC which determines the layout, or the NAND driver 
implements software ECC and gets to choose. Can't the filesystem just deal 
with the ECC layout used by the NAND driver, as determined by the 
underlying hardware?


--
dwmw2
