Received: from pd9e41f3e.dip.t-dialin.net ([217.228.31.62] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aQJU-0000Z8-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 23:56:49 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Steve_Chen@kingston.com, gleixner@autronix.de
Subject: Re: NAND flash and JFFS(2)
Date: Tue, 12 Feb 2002 01:10:21 +0100
Cc: David Woodhouse <dwmw2@infradead.org>, jffs-dev@axis.com,
   linux-mtd@lists.infradead.org
References: <OF2342AFB5.08DD24E0-ON88256B5D.0081B9A3@LocalDomain>
In-Reply-To: <OF2342AFB5.08DD24E0-ON88256B5D.0081B9A3@LocalDomain>
MIME-Version: 1.0
Message-Id: <0202120110210C.00764@thomas>
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

On Tuesday, 12. February 2002 00:42, Steve_Chen@kingston.com wrote:
> 1. What does "page data valid flag" mean ?  How do you use it ?
This flag is programmed to 0, if a complete page is written and tells the 
ECC, that the data can be read with ECC.  
> 2. If jffs2 detects a bad block, does it set a flag in one of the bytes in
> oob ?  I suppose we don't want to use byte 05 (bad block status) which was
> set by the chip manufacturer.
Not yet, but we are going to implement this. We definitly will use byte 5. We 
detect the bad blocks marked by the manufacturer, which we never touch again, 
and mark detected bad blocks at the same place.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
