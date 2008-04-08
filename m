Received: from mta.parkeon.com ([81.80.172.210])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjFIG-0004ot-0k
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 14:59:28 +0000
Received: from mail1.parkeon.com ([192.168.76.219]
	helo=mail.besancon.parkeon.com)
	by mta.parkeon.com with esmtp (Exim 4.69)
	(envelope-from <fgirardot@besancon.parkeon.com>) id 1JjFID-0003Sl-EJ
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 16:59:25 +0200
Received: from localhost ([127.0.0.1] helo=srv023-ttb.besancon.parkeon.com)
	by mail.besancon.parkeon.com with esmtp (Exim 4.24)
	id 1JjFID-0000by-CD
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 16:59:25 +0200
Message-ID: <47FB884B.9050301@besancon.parkeon.com>
Date: Tue, 08 Apr 2008 16:59:23 +0200
From: Fabrice GIRARDOT <fgirardot@besancon.parkeon.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [JFFS2] Garbage collector says "Checked all inodes but still 0x5e3d0
	bytes of unchecked space?"
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all.

I'm using a JFFS2 root filesystem on a 2.6.12 Linux kernel,
powered by an ARM9 cpu.
My storage hardware is a 128 MBytes NAND device.

Sometimes, after several unclean system resets, JFFS2's garbage
collector outputs this message :
"Checked all inodes but still 0x5e3d0 bytes of unchecked space?
  kernel BUG at fs/jffs2/gc.c:139!"

As far as I understand, the GC has checked the last inode,
but has still some unchecked space. Since this should not occur,
the code in jffs2's file gc.c reaches a "BUG()" statement.

Some search on this problem did not provides me with much
information.
I found a message in 2002 where the problem could be an hardware
problem (same data not read twice identically), and an other
one sent in 2006 where the "unchecked_size" may be badly computed.

I don't know which exact version of jffs2 I'm using ; my gc.c
file is version 1.144 on 21-dec-2004, which may look a bit old.
Unfortunately, I can not switch to a newer kernel version.

Does somebody has more information on this problem ?
Is it a bug in jffs2 and/or its GC ? Is it fixed ?
Could it be an harwdare problem, confusing jffs2 ?

Any information is welcome.


Regards,

-- 
Fabrice GIRARDOT
