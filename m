Received: from ftp.linux-mips.org ([194.74.144.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8ya2-0002Ye-Vl
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 09:20:04 -0400
Received: from localhost.localdomain ([127.0.0.1]:12707 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20022449AbXGLNTi (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Thu, 12 Jul 2007 14:19:38 +0100
Date: Thu, 12 Jul 2007 14:04:36 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [PATCH] MTD:  Remove useless references to MIPS_HYDROGEN3 and
	MIPS_MIRAGE_WHY.
Message-ID: <20070712130436.GC11019@linux-mips.org>
References: <Pine.LNX.4.64.0707111700370.19869@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0707111700370.19869@localhost.localdomain>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 11, 2007 at 05:04:02PM -0400, Robert P. J. Day wrote:

> 
> Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
> 
> ---
> 
>   this is a superset of the earlier patch.  this one removes *both*
> apparently useless references from alchemy-flash.c.  ralf already
> verified that the HYDROGEN3 reference is toast, perhaps he can verify
> the second one as well.

Saw the other one first but anyway, same answer as to the other email.
It's dead since a while, so:

Acked-by: Ralf Baechle <ralf@linux-mips.org>

There was also another fragment of Hydrogen 3 code left under arch/mips
which I just deleted.

  Ralf
