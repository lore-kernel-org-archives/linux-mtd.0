Received: from mg01.austin.ibm.com ([192.35.232.18])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17fmhS-0004yH-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 20:23:58 +0100
Received: from austin.ibm.com (netmail.austin.ibm.com [9.3.7.137])
	by mg01.austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id OAA38798
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 14:22:32 -0500
Received: from popmail.austin.ibm.com (popmail.austin.ibm.com [9.53.247.178])
	by austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id OAA81268
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 14:23:54 -0500
Received: from mahi190.austin.ibm.com (mahi190.austin.ibm.com [9.3.154.190]) by popmail.austin.ibm.com (AIX4.3/8.9.3/8.7-client1.01) with ESMTP id OAA06310 for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 14:23:53 -0500
Subject: JFFS2 Power Fail Issue
From: Stephen Hui <gromit1463@mailworks.org>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 16 Aug 2002 14:23:48 -0500
Message-Id: <1029525828.11559.47.camel@mahi190.austin.ibm.com>
Mime-Version: 1.0
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

Hi,

My JFFS2 filesystem doesn't like having the plug pulled on it.  I get
some bad behaviour when:

1.  I have the partition mounted under another filesystem, and I pull
the plug while writing to it, or

2.  I have the partition unlocked and mounted read-write as root, and I
pull the plug (regardless of whether I'm writing).

After booting again and mounting the partition, I get a bunch of these:

Write error in obliterating obsoleted node at 0x0007eaec: -30                                                                                                                     
Write error in obliterating obsoleted node at 0x0013d66c: -30                                                                                                                     
Write error in obliterating obsoleted node at 0x0013d7b4: -30                                                                                                                     
Write error in obliterating obsoleted node at 0x0013d884: -30                                                                                                                     
Write error in obliterating obsoleted node at 0x0013dbec: -30

and each time I pull the plug and bring it back up, more nodes are
obsoleted.  Has this been seen before?  I'm using the latest JFFS2 code.

Thanks in advance,
Stephen.



-- 
"Find out what you've been missing while you've been
rebooting Windows NT." -- Infoworld on Linux

http://www.ao.com/~regan/penguins/tux.html
