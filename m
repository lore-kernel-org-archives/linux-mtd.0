Received: from pd9e413bf.dip.t-dialin.net ([217.228.19.191] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fliA-0005JB-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 17:48:22 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Radu Corlan <rcorlan@pcnet.ro>, linux-mtd@lists.infradead.org
Subject: Re: nftl problem
Date: Tue, 26 Feb 2002 19:03:15 +0100
References: <Pine.LNX.4.10.10202261939200.608-100000@pinot.profis.ro>
In-Reply-To: <Pine.LNX.4.10.10202261939200.608-100000@pinot.profis.ro>
MIME-Version: 1.0
Message-Id: <0202261903150J.10190@thomas>
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

On Wednesday, 27. February 2002 01:46, Radu Corlan wrote:
> Before i gave up on nftl, i found the following problem: nftl accesses the
> flash through the read_ecc and write_ecc function pointers in the slave
> mtd_info structure. However, when the slave structure is initialised, only
> the read and write function pointers are filled, not the read_ecc and
> write_ecc; i got kernel panic out of this, which got away when i filled
> the fields.
>
> Anyway, i gave up on nftl; my mtd seems to run ok now, as i put a ext2
> filesystem on the mtdblock0 device and it runs fine.
>
> But i can;t get jffs2 to work - i used the code from the latest snapshot
> on the infradead site - is it ok? Can i get a 'stable' version somewhere?
> my kernel is 2.4.2.
What does not work on JFFS2? You must setup the ECC config in your nand16 
driver. 
There's a lot of development going on. But try to use the code from CVS. I 
have just updated the nand stuff to support variable command delays and fixed 
a the CONFIG_ECC_LAYOUT stuff in nand.c

-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
