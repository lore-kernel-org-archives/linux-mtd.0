Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YadG-0000ls-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2002 22:33:38 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas.Gleixner@t-online.de (Thomas Gleixner)
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND flash and JFFS(2)
Date: Wed, 6 Feb 2002 23:47:02 +0100
Cc: Veli-Pekka =?iso-8859-1?q?Yl=F6nen?= <velpeyl@utu.fi>,
 <linux-mtd@lists.infradead.org>,
 <jffs-dev@axis.com>
References: <Pine.LNX.4.44.0202061444340.2447-100000@lapdancer.baythorne.internal>
In-Reply-To: <Pine.LNX.4.44.0202061444340.2447-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Message-Id: <02020623470200.00888@thomas>
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

On Wednesday,  6. February 2002 05:54, David Woodhouse wrote:
>
> We should be able to use their ECC hardware. As with the DiskOnChip, this
> effectively limits us to one write per page, even if the NAND chip can do
> more than that.
The ECC hardware does not limit us to one write. The ECC hardware just 
calculates the ECC if requested and you must read it back out of the CPLD. 
Then you program it into the spare area. On read you must also enable the ECC 
hardware, read the page, read the ECC .... You can do also read/write without 
ECC.There are no restrictions which part of the spare area to use. You can 
also do everything in software. Anyway we need a different driver for this 
adaptors, because they implement the access to the select lines in their 
CPLD.

> > Maybe we can use the SmartMedia scheme for ECC placement in general for
> > all NAND chips.
> Except DiskOnChip, which has its own layout.
OK

> > I have a look on the data sheets again. I know only about 2 writes/page
> > limit. But maybe we need this, when we have a less smart adaptor with ECC
> > hardware.
> Yes, the ECC makes supporting multiple writes quite hard. We could invent
> new node types and do ECC per-node, but I think it would be better to do
> block-based ECC and use the hardware capabilities, as we have to do write
> batching into blocks anyway.
See above

> OK. Could you show me the changes you had to make?
Should i put them into CVS to jffs-nand-branch or send them by mail ?

> OK, I'll have a go at it. I was leaving it till last, because it's not
> particularly likely to happen in real life. Once the rest works, I'll be
> all happy and motivated to do the evil bits of the error handling :)
sounds good to me

> OK. It would be nice if we could trigger GC to fill the wbuf, rather than
> padding - and only pad it if we really can't use up the space with GC
> writes.
Sure, but we must have something, that makes sure that data is written 
immidiatly to the flash, if we have sensitive data loggers or configuration 
data, where a loss is not acceptable.
 
Another thought about cleanmarker nodes. If we keep them in the page, we can 
easy burn a jffs2-image into a raw flash. This makes life easier for 
bootloaders....

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
