Received: from mailout07.sul.t-online.com ([194.25.134.83])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YiCA-0001DT-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2002 06:38:10 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas.Gleixner@t-online.de (Thomas Gleixner)
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>,
 gleixner@autronix.de
Subject: Re: NAND flash and JFFS(2)
Date: Thu, 7 Feb 2002 07:51:09 +0100
Cc: Veli-Pekka =?iso-8859-1?q?Yl=F6nen?= <velpeyl@utu.fi>,
 <linux-mtd@lists.infradead.org>,
 <jffs-dev@axis.com>
References: <Pine.LNX.4.44.0202070847350.3680-100000@lapdancer.baythorne.internal>
In-Reply-To: <Pine.LNX.4.44.0202070847350.3680-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Message-Id: <02020707510901.00888@thomas>
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

On Wednesday,  6. February 2002 23:55, David Woodhouse wrote:
> On Wed, 6 Feb 2002, Thomas Gleixner wrote:
> True - but in order to implement ECC we have to either write partial
> blocks _without_ ECC, until we fill the block and write the ECC data with
> the 512nd byte, or batch the writes into pages.
I mean we should keep the batch write. Thats correct. But we can leave the 
cleanmarker where it is now and write it without ECC and put the rest of the 
page with ECC. On small NAND devices we have only 8byte spare area per block. 
We need 3 byte for ECC and at least 1 byte for flags. Then the cleanmarker 
area is reduced to 4 bytes. Is that enough ?

> > Should i put them into CVS to jffs-nand-branch or send them by mail ?
> Mail's probably best at this stage - thanks.
I will send it in the afternoon

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
