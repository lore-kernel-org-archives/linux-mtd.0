Received: from pd9eb8c1f.dip.t-dialin.net ([217.235.140.31] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cjqk-0002l2-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 09:12:43 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 & NAND
Date: Mon, 18 Feb 2002 10:26:36 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02021809481101.00860@thomas> <02021720360705.08654@thomas> <11512.1014021987@redhat.com>
In-Reply-To: <11512.1014021987@redhat.com>
MIME-Version: 1.0
Message-Id: <02021810263602.00860@thomas>
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

On Monday, 18. February 2002 09:46, David Woodhouse wrote:
> gleixner@autronix.de said:
> > Would it be ok to use a CONFIG option to tell the chip device driver
> > which  OOB configuration to use ?
>
> switch(mtd->ecctype) ?
Yes inside JFFS2, but who tells the NAND driver, which layout to use.
I think we should support this, to keep the possibility to implement other fs 
than JFFS2. (e.g. this ugly DOS-FAT of SMCard). So we could extend the 
CONFIG_NAND_ECC by a CONFIG_NAND_ECC_JFFS or something like that.
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
