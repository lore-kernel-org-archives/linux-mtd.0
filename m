Received: from av9-2-sn1.fre.skanova.net ([81.228.11.116])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgOK5-0007Yg-NF
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 09:15:43 -0500
Received: from smtp3-1-sn1.fre.skanova.net (smtp3-1-sn1.fre.skanova.net
	[81.228.11.163])
	by av9-2-sn1.fre.skanova.net (Postfix) with ESMTP id 5C52237E4A
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Dec 2004 15:15:28 +0100 (CET)
Received: from grey (h161n2fls34o815.telia.com [213.67.183.161])
	by smtp3-1-sn1.fre.skanova.net (Postfix) with ESMTP id 2600B37E4A
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Dec 2004 15:15:28 +0100 (CET)
From: "Per Hedblom" <per.hedblom@abem.se>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 20 Dec 2004 15:15:20 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Message-Id: <20041220141528.2600B37E4A@smtp3-1-sn1.fre.skanova.net>
Subject: question about placement of JFFS2_SB_FLAG_MOUNTING  flag.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My jffs2 stops running during mount at "pass 2a" in jffs2_build_filesystem
at the first call to jffs2_mark_node_obsolete .

The D1 printout is:
------------------------------------
<7>Pass 2: ino #91, nlink 1, ic 0x02247af8, nodes 0x022360c8
<7>Pass 2: ino #92, nlink 0, ic 0x022476f0, nodes 0x02224338
<7>JFFS2: Removing ino #92 with nlink == zero.
<7>obsoleting node at 0x0007b720
<7>Obsoleting node at 0x0007b720 of len 30: Wasting
<7>obliterating obsoleted node at 0x0007b720
------------------------------------

My question is if it correct that this "Pass 2a" should be executed with the
JFFS2_SB_FLAG_MOUNTING flag off. I can make the code run by moving the place
were JFFS2_SB_FLAG_MOUNTING is turned off to after Pass 2a. 

I am using eCos with mtd cvs updated jffs2 source code.
/Per
