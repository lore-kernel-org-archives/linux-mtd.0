Received: from ozlabs.org ([203.10.76.45])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J3NRM-00072b-2g
	for linux-mtd@lists.infradead.org; Sat, 15 Dec 2007 03:12:00 +0000
Date: Sat, 15 Dec 2007 13:58:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3 4/4] Freescale enhanced Local Bus Controller FCM
	NAND support.
Message-ID: <20071215025851.GA8430@localhost.localdomain>
References: <20071214221736.GA21231@loki.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20071214221736.GA21231@loki.buserror.net>
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 14, 2007 at 04:17:36PM -0600, Scott Wood wrote:
> Signed-off-by: Nick Spence <nick.spence@freescale.com>
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---
> Fixed some formatting issues, removed some leftover debugging cruft,
> and added a comment about potential conflicts in the interrupt
> handling.

Why is the NAND MTD driver specific to the elbc bus?  And why does it
bind to the elbc node, rather than the nand node under it?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
