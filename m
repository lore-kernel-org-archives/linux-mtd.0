Received: from pd953a70e.dip.t-dialin.net ([217.83.167.14] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16o74R-0007AM-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2002 18:13:52 +0000
Message-Id: <200203211829.g2LITTW14080@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: rkaiser@sysgo.de, Robert Kaiser <rob@sysgo.de>
Subject: Re: drivers/mtd/nand/spia.c broken ?
Date: Thu, 21 Mar 2002 19:29:29 +0100
Cc: linux-mtd@lists.infradead.org
References: <200203211538.g2LFcVw31556@dagobert.svc.sysgo.de> 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Donnerstag, 21. März 2002 19:02 , Thomas Gleixner wrote:
> > Line 161: return = -ENOMEM
> This is the standard return, if kmalloc failes :) The data cache was
> introduced due to the changes in nand.c, which were made for JFFS2 on NAND
OOPS, missed the '=' :)
-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
