Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BECwb-0002Rn-5D
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 20:54:41 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: linux-mtd@lists.infradead.org
Date: Thu, 15 Apr 2004 21:50:25 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404152150.25570.tglx@linutronix.de>
Subject: NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

the NAND driver was reworked to support the new 2K page size chips.
There is support for autoplacement of OOB data built in now, as discussed some 
time ago,

Status:
	JFFS2 mounts on small / large chips (current JFFS2 CVS code)
	YAFFS mounts on small chips (Patch is sent to YAFFS maillist)

Some TODO's remain, like optimization of non page aligned read access and 
support for the cached page programming, which is provided by the new Samsung 
chips. Most of this is already designed in, but not enabled yet as I wanted 
to have it working with the standard functionality first. This will happen in 
the next weeks.
And of course updating the nand html documentation.

This makes some small modifications to the board drivers neccecary. 
We need one additional buffer. The sizeof this buffer is oobsize * pages per 
block, e.g.
blocksize 16384
pagesize 512
= 32 pages per block
* 16 byte out of band data
= 512 byte buffer
The pointer must be set  _before_  calling nand_scan
The pointer for the data buffer, which was neccecary also before the change,
must be set now before calling nand_scan(), as nand_scan() contains a check 
for both pointers now.
Check the modifications in autcpu12.c for reference.


I want to say thanks to 
	Aleph One Ltd. and Toby Churchil Ltd. They supported this work
and
	llandre in Italy, who seems to be the only one in the universe who has a 
board with those new chips up and running. He did all the testing. 


Please check it out and help testing.

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
