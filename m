Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19c0yi-0003Wk-Gp
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 11:54:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "PIPLANI, PERRY J. (JSC-EV3) (NASA)" <perry.j.piplani@nasa.gov>
In-Reply-To: <5A9E3D5804EA1F4582C9A99A50404F82010017E5@jsc-mail06.jsc.nasa.gov>
References: 
	 <5A9E3D5804EA1F4582C9A99A50404F82010017E5@jsc-mail06.jsc.nasa.gov>
Message-Id: <1058180089.26819.66.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 14 Jul 2003 11:54:49 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Single driver (doc2000) doesn't work on a millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-07-07 at 15:28, PIPLANI, PERRY J. (JSC-EV3) (NASA) wrote:
> Everything works as expected if I use the doc2001.c driver. 
> 
> However, using the doc2000 driver however, I get the following:
> _DoC_WaitReady called for out-of-line wait
> _DoC_WaitReady called for out-of-line wait
>     ...ad infinitum...

This is very bizarre. The doc2000 driver when talking to a Millennium
should be behaving _identically_ to the doc2001 driver. It works on all
the Millennium devices I've ever tested with, and I've never managed to
reproduce your problem, although others have reported it in the past
occasionally.

They're very similar in structure, for obvious reasons -- it may be
worth going through them side-by-side and looking for differences.

For a start, I notice that in the doc2001 DoC_Command() function, we
write the byte to the Mil_CDSN_IO register and then we write the
WritePipeTerm register. But in the doc2000 driver, we don't use the
pipeline and we do a slow write by writing to the CDSNSlowIO register
first followed by the Mil_CDSN_IO register. 

So for a start, perhaps you could try this patch...

Index: doc2000.c
===================================================================
RCS file: /home/dwmw2/.mtd-cvs-backup/cvs/mtd/drivers/mtd/devices/doc2000.c,v
retrieving revision 1.55
diff -u -p -r1.55 doc2000.c
--- doc2000.c	1 Jul 2003 22:23:21 -0000	1.55
+++ doc2000.c	14 Jul 2003 10:48:13 -0000
@@ -143,11 +143,10 @@ static inline int DoC_Command(struct Dis
 	WriteDOC(xtraflags | CDSN_CTRL_CLE | CDSN_CTRL_CE, docptr, CDSNControl);
 	DoC_Delay(doc, 4);	/* Software requirement 11.4.3 for Millennium */
 
-	if (DoC_is_Millennium(doc))
-		WriteDOC(command, docptr, CDSNSlowIO);
-
 	/* Send the command */
 	WriteDOC_(command, docptr, doc->ioreg);
+	if (DoC_is_Millennium(doc))
+		WriteDOC(0x00, docptr, WritePipeTerm);
 
 	/* Lower the CLE line */
 	WriteDOC(xtraflags | CDSN_CTRL_CE, docptr, CDSNControl);

You'll note there's also a similar difference in DoC_Address. For
testing purposes, you could just drop the doc2001 DoC_Address routine
into the doc2000 driver. That obviously isn't the _real_ fix since that
would break doc2000 support, but if it fixes it for you then we know
what the problem is. 

Out of interest, if you try the half-complete driver in
nand/diskonchip.c in CVS, does that work for you? Note you'll get basic
hardware support _only_ out of that so far, there's no ECC yet and NFTL
probably won't work on it. JFFS2 does with software ECC but that's it. 

-- 
dwmw2
