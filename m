Received: from pd9e41c87.dip.t-dialin.net ([217.228.28.135] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ckBw-0002nT-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 09:34:36 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, gleixner@autronix.de
Subject: Re: JFFS2 & NAND
Date: Mon, 18 Feb 2002 10:48:33 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02021810263602.00860@thomas> <11512.1014021987@redhat.com> <19529.1014024551@redhat.com>
In-Reply-To: <19529.1014024551@redhat.com>
MIME-Version: 1.0
Message-Id: <02021810483303.00860@thomas>
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

On Monday, 18. February 2002 10:29, David Woodhouse wrote:
> gleixner@autronix.de said:
> > Yes inside JFFS2, but who tells the NAND driver, which layout to use.
>
> Do we really need the NAND driver to be able to use more than one layout?
>
> Either we have hardware ECC which determines the layout, or the NAND driver
> implements software ECC and gets to choose. Can't the filesystem just deal
> with the ECC layout used by the NAND driver, as determined by the
> underlying hardware?
Also hardware ECC does not determine the layout. It just builds the ECC, you 
have to read it out of the CLPD and write it at a appropriate place in the 
OOB area. Same on read.  
We can use a fixed layout for every chip-type. There are 2 good reasons not 
to do that.
1. The SMC DOS-FAT oob layout is more than ugly. To press our idea of oob 
usage into this, is like you slice a bread in many small pieces to fit into 
the subdivisions of your tupperbox, instead of rearanging the contents of the 
box.

2. I don't want to put too much restrictions into the oob layout, so we would 
make it hard for somebody, who want's to implement a different filesystem 
than JFFS2.

-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
