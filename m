Received: from vernon.teraflops.com ([213.173.140.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZIjh-0003RV-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2002 23:11:29 +0100
Received: from localhost (oh3mqu@localhost)
	by vernon.teraflops.com (8.11.6/8.11.6) with ESMTP id g6TMBKn10815
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 01:11:20 +0300
Date: Tue, 30 Jul 2002 01:11:20 +0300 (EEST)
From: Ari Saastamoinen <mtd@oh3mqu.pp.vip.fi>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 and block size for writing
Message-ID: <Pine.LNX.4.44.0207300109560.10806-100000@vernon.teraflops.com>
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

Hello,

First I must be sorry if that subject has discussed before and/or this    
situation is already supported, but only thing what I found was with 
suvject "Does MTD include support for STM M58LW064?"  And the answer was  
no.  I have the project what have that chip, and I tried to use that
command set 0001 with the chip and it seems to be working somehow (using
linux kernel 2.4.18-rmk7).  When I tried to dd something to the
/dev/mtdblock/0 it seems to appear to the chip, but the JFFS2 writing do  
not work.

I tried to debug what went wrong and it seems that problem might be in    
write alignments.  On some chips it is possible to write zeros to the chip
at any time, but with this chip writing to the 4*16 bit page is allowed   
only once after erase.  Is there any configuration parameters for JFFS2 to
make it perform writes only with that kind of alignment?

And if there is no currently supporting for that I will make it by myself.
What is your suggestions?

1) Should I patch mtdblock so it caches all the writes and writes only 64
at the time?  I believe that file system is not safe agaings power
failures any more with that patch.

2) Should I patch mtdblock like: if I write 1 byte to it and it will
report that 8 bytes were written?  Can JFFS2 recognize that and next write
will go to the right place?

3) Or should I patch JFFS2 so it will do all needed alignment by itself?

4) Does anyone have any other suggestions?


PS. Sorry about my bad english too 8-)

--
Ari Saastamoinen
