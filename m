Received: from d-106.linux2002.uq.net.au ([203.15.37.106] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Yaop-0000md-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2002 22:45:36 +0000
Date: Thu, 7 Feb 2002 08:55:44 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: gleixner@autronix.de
cc: Veli-Pekka =?iso-8859-1?q?Yl=F6nen?= <velpeyl@utu.fi>,
     <linux-mtd@lists.infradead.org>,  <jffs-dev@axis.com>
Subject: Re: NAND flash and JFFS(2)
In-Reply-To: <02020623470200.00888@thomas>
Message-ID: <Pine.LNX.4.44.0202070847350.3680-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 6 Feb 2002, Thomas Gleixner wrote:

> The ECC hardware does not limit us to one write. The ECC hardware just 
> calculates the ECC if requested and you must read it back out of the CPLD. 
> Then you program it into the spare area. On read you must also enable the ECC 
> hardware, read the page, read the ECC .... You can do also read/write without 
> ECC.There are no restrictions which part of the spare area to use.

True - but in order to implement ECC we have to either write partial 
blocks _without_ ECC, until we fill the block and write the ECC data with 
the 512nd byte, or batch the writes into pages. 

> Should i put them into CVS to jffs-nand-branch or send them by mail ?

Mail's probably best at this stage - thanks.

> > OK. It would be nice if we could trigger GC to fill the wbuf, rather than
> > padding - and only pad it if we really can't use up the space with GC
> > writes.
> Sure, but we must have something, that makes sure that data is written 
> immidiatly to the flash, if we have sensitive data loggers or configuration 
> data, where a loss is not acceptable.

We can do that. Triggering a GC pass to try to fill the wbuf won't take 
long - it can be done in the context of a fsync() call, and if we can't 
find anything else to write out, _then_ we pad it and still return 
(almost) immediately. 

We probably need to rethink our (ab)use of the s_dirt member of the 
superblock, and actually make write_super() do the sync too.

> Another thought about cleanmarker nodes. If we keep them in the page, we can 
> easy burn a jffs2-image into a raw flash. This makes life easier for 
> bootloaders....

Bootloaders need to know about JFFS2 anyway - currently they erase 
blocks without putting a cleanmarker in, then Linux will re-erase all 
those blocks again on first mount. 

-- 
dwmw2
