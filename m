Received: from clavin.cs.tamu.edu
	([128.194.130.106] helo=cs.tamu.edu ident=0)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q83v-00050q-B0
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:02:59 +0100
Received: from unix.cs.tamu.edu (unix [128.194.138.13])
	by cs.tamu.edu (8.11.0/8.11.0) with ESMTP id h5BG3Ug05434
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 11:03:30 -0500 (CDT)
Received: from localhost (choudhri@localhost)
	by unix.cs.tamu.edu (8.10.2+Sun/8.10.2) with ESMTP id h5BG3Uf07951
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 11:03:30 -0500 (CDT)
Date: Wed, 11 Jun 2003 11:03:30 -0500 (CDT)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.GSO.4.44.0306111054540.7463-100000@unix.cs.tamu.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: jffs2 vs. ext3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I am trying jffs2 and ext3 on a 3MB Intel NOR flash. I have a piece of
code in function part_write (mtdpart.c) that outputs the size in bytes and pid
of the process (current) sending write requests.

With ext3, no matter how many bytes are written (by an application/user
level program), the part_write function always gets a request that is
multiple of 128K (131072 bytes). This does not happen with jffs2 though.
Also, with ext3, the process is always mtdblockd, whereas with jffs2 the
process sending the request is the actual user/application process.

Any ideas why it happens ?

thanks in advance,
-siddharth

_____________________________________________________________________
     Unix is user friendly - its just picky about its friends.
_____________________________________________________________________
