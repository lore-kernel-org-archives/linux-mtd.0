Received: from zcamail05.zca.compaq.com ([161.114.32.105])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bOs8-0001pc-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2001 17:04:20 +0100
Message-ID: <D99C1FB421989A40818B6370E3187094C8E2F5@tayexc19.americas.cpqcorp.net>
From: "Christian, Andrew" <Andrew.Christian@compaq.com>
To: 'Russ Dill' <Russ.Dill@asu.edu>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
	"Hicks, Jamey" <Jamey.Hicks@compaq.com>
Subject: RE: Dynamic Rubin compression performance in JFFS2 on iPAQ
Date: Mon, 27 Aug 2001 12:09:41 -0400
MIME-Version: 1.0
Content-Type: text/plain
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

I should have mentioned that we started with your stuff, and modified it.
The major change is to cache the scanned dirnodes so directory traversals
are faster, and allowed us to add an "ls" command from the bootloader.

	Brian Avery		<brian.avery@compaq.com>


-----Original Message-----
From: Russ Dill [mailto:Russ.Dill@asu.edu]
Sent: Monday, August 27, 2001 11:29 AM
To: Christian, Andrew
Cc: 'linux-mtd@lists.infradead.org'; Hicks, Jamey
Subject: Re: Dynamic Rubin compression performance in JFFS2 on iPAQ


On 27 Aug 2001 11:04:59 -0400, Christian, Andrew wrote:
> We recently updated the iPAQ bootldr (version 2.15.0 on
www.handhelds.org)
> to support booting the kernel out of JFFS2.  In the process of doing this,
> we ran into difficulties uncompressing kernel images from non-sorted lists
> of file fragments - in particular, we had troubles with DYNRUBIN
> decompression.
> 
> That caused us to look at the benefits of the different compression
> algorithms in JFFS2.  On a typical iPAQ with approximately 45 Mbytes of
> uncompressed data, we see the following numbers:
> 				
>         Fragments	    Compressed Uncompressed   Saved     Saved
> 				(bytes)     (bytes)    (bytes)     (%)
> 
> NONE          813         248473      248473          0      0%   
> ZLIB        12287       20886586    46882145   25995559     55%   	
> DYNRUBIN       70	         20864       21490        626	 3%
> RTIME           5	            94         115         21     18%
> 
> Total       13175       21156017    47152223   25996206     55%
> 
> These numbers are representative of the different iPAQs we tested - in
fact,
> DYNRUBIN in this iPAQ saved the most bytes of any of the tested iPAQS.
> 
> Including DYNRUBIN compression in the iPAQ Linux kernel requires an
> additional 5793 bytes (a compressed zImage) 
> 
> For the moment, we have added a CONFIG option to turn off DYNRUBIN
> compression for iPAQs --- decompression is left turned on for backward
> compatibility.
> 
> We're curious - what is the intended target of DYNRUBIN compression?  We
> haven't seen any advantages from including it on the iPAQ, but it must be
> advantageous for some system or data type.  Anyone?

I've allready written jffs2 boot code. DYNRUBIN can compress something
that has been gzipped, but its not worth it. I think you save more space
if you just put a straight vmlinux in the jffs2 image. Also, turning on
the I-cache is very important for speed. Also, the code contains its own
deflate algorithm that saves a lot of space over including zlib. My
jffs2/cramfs code is here

http://russ.dhs.org/load_kernel.html

It will get updated as it gets integrated into blob
