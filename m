Received: from ppp-08-005.001.starnetwx.net ([66.19.63.5] helo=digidescorp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CzN5F-0004HJ-JJ
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2005 22:46:51 +0000
Received: from banana ([192.168.254.111])
	by digidescorp.com (digidescorp.com [192.168.254.251])
	(MDaemon.PRO.v7.1.2.R) with ESMTP id md50000030541.msg
	for <linux-mtd@lists.infradead.org>; Thu, 10 Feb 2005 16:46:15 -0600
From: "Steven J. Magnani" <steve@digidescorp.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 10 Feb 2005 16:44:12 -0600
Message-ID: <002f01c50fc2$0d968ed0$6ffea8c0@banana>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Bug in jffs2/scan.c re: incorrect assumption of "all clean" block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello MTD folk,

I'm not hooked into the MTD list so please cc: me on any replies. Also
please note that this is my first experience with this code, so excuse
me if I've gone off base.

I believe there is a bug in fs/jffs2/scan.c that causes it to
incorrectly assume a block with a cleanmarker is "all clean". This
causes an "Eep. Block 0xXXXXXXXX taken from free_list had free_size of
0xXXXXXXXX!!" to go off when jffs2_do_reserve_space() is called later.

There are 4 conditions that have to be met in a particular block for the
bug to surface:

* The block has a cleanmarker
* The end of the block has to be free space (0xFF)
* The block has JFFS2_NODETYPE_INODEs
* The block does NOT have any JFFS2_NODETYPE_DIRENTs

The test that governs the "all clean" assumption is as follows (cf.
scan.c 1.118 line 435)

	if (buf_ofs == jeb->offset && jeb->used_size ==
PAD(c->cleanmarker_size) && 
	    c->cleanmarker_size && !jeb->dirty_size &&
!jeb->first_node->next_in_ino) {

The bug is that there is no test that checks whether any
JFFS2_NODETYPE_INODEs have been seen. Since only JFFS2_NODETYPE_DIRENTs
are counted as used, and JFFS2_NODETYPE_INODEs are counted as unchecked,
I think that the correction should look like this:

	if (buf_ofs == jeb->offset && ((jeb->used_size +
jeb->unchecked_size) == PAD(c->cleanmarker_size)) && 
	    c->cleanmarker_size && !jeb->dirty_size &&
!jeb->first_node->next_in_ino) {


This seems consistent with what is done at line 631:

	if ((jeb->used_size + jeb->unchecked_size) ==
PAD(c->cleanmarker_size) && !jeb->dirty_size 
		&& (!jeb->first_node || !jeb->first_node->next_in_ino) )

...although the two are still not checking quite the same set of
conditions.

Comments? I can provide a JFFS2 image that triggers the problem if
someone is interested in stepping through it.

Steve Magnani
Digital Design Corporation
www.digidescorp.com
