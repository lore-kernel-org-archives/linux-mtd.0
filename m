Received: from pd953af32.dip.t-dialin.net ([217.83.175.50] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fUmq-00042j-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 23:44:04 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Radu Corlan <rcorlan@pcnet.ro>, linux-mtd@lists.infradead.org
Subject: Re: Support for parallel access in nand chips
Date: Tue, 26 Feb 2002 00:58:52 +0100
References: <Pine.LNX.4.10.10202260121390.701-100000@pinot.profis.ro>
In-Reply-To: <Pine.LNX.4.10.10202260121390.701-100000@pinot.profis.ro>
Cc: Joerg Zastrau <dl1bku@amsat.org>
MIME-Version: 1.0
Message-Id: <0202260058520I.03406@thomas>
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

On Tuesday, 26. February 2002 07:30, Radu Corlan wrote:
> On our application (a PPC405 embedded system), we use two TC58256 NAND
> chips conected on a 16-bit bus. we designed it this way in order to
> increase the read/write speed - it would double our bandwidth. The
> problem, of course, is that nand.c only accesses the flash 8 bits at a
> time.
>
> We intend to hack nand.c to use the 16-bit access (and make a special
> entry in nand_chip with a double erase_size), but i'd like to know if
> anybody thought of supporting the parallel access.
No. 
But please don't hack nand.c. Build a nand16.c from nand.c and hack this. 
Else we get a mess in the code, which was cleaned up a few days ago :)
And a lot of overhead of 8/16bit decisions. You just have to provide the same 
functionality as nand.c. You will not need a special entry in nand_chip. The 
information there is enough. 

-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
