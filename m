Received: from zcamail05.zca.compaq.com ([161.114.32.105])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bNrg-0001jl-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2001 15:59:49 +0100
Received: from exctay-gh01.tay.cpqcorp.net (exctay-gh01.tay.cpqcorp.net [16.103.129.42])
	by zcamail05.zca.compaq.com (Postfix) with ESMTP id 74722100C
	for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2001 08:09:25 -0700 (PDT)
Message-ID: <D99C1FB421989A40818B6370E3187094C9B90F@tayexc19.americas.cpqcorp.net>
From: "Christian, Andrew" <Andrew.Christian@compaq.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Cc: "Hicks, Jamey" <Jamey.Hicks@compaq.com>
Subject: Dynamic Rubin compression performance in JFFS2 on iPAQ
Date: Mon, 27 Aug 2001 11:04:59 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

We recently updated the iPAQ bootldr (version 2.15.0 on  www.handhelds.org)
to support booting the kernel out of JFFS2.  In the process of doing this,
we ran into difficulties uncompressing kernel images from non-sorted lists
of file fragments - in particular, we had troubles with DYNRUBIN
decompression.

That caused us to look at the benefits of the different compression
algorithms in JFFS2.  On a typical iPAQ with approximately 45 Mbytes of
uncompressed data, we see the following numbers:
				
        Fragments	    Compressed Uncompressed   Saved     Saved
				(bytes)     (bytes)    (bytes)     (%)

NONE          813         248473      248473          0      0%   
ZLIB        12287       20886586    46882145   25995559     55%   	
DYNRUBIN       70	         20864       21490        626	 3%
RTIME           5	            94         115         21     18%

Total       13175       21156017    47152223   25996206     55%

These numbers are representative of the different iPAQs we tested - in fact,
DYNRUBIN in this iPAQ saved the most bytes of any of the tested iPAQS.

Including DYNRUBIN compression in the iPAQ Linux kernel requires an
additional 5793 bytes (a compressed zImage) 

For the moment, we have added a CONFIG option to turn off DYNRUBIN
compression for iPAQs --- decompression is left turned on for backward
compatibility.

We're curious - what is the intended target of DYNRUBIN compression?  We
haven't seen any advantages from including it on the iPAQ, but it must be
advantageous for some system or data type.  Anyone?


	Brian Avery		<brian.avery@compaq.com>
	Andrew Christian	<andrew.christian@compaq.com>


Compaq Computer Corporation
Cambridge Research Laboratory
