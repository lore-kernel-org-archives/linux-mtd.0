Received: from mailhost.cs.tamu.edu
	([128.194.130.106] helo=cs.tamu.edu ident=0)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190myf-0006VX-BC
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 19:28:49 +0100
Received: from unix.cs.tamu.edu (unix [128.194.138.13])
	by cs.tamu.edu (8.11.0/8.11.0) with ESMTP id h32ISlr22168
	for <linux-mtd@lists.infradead.org>;
	Wed, 2 Apr 2003 12:28:47 -0600 (CST)
Received: from localhost (choudhri@localhost)
	by unix.cs.tamu.edu (8.10.2+Sun/8.10.2) with ESMTP id h32ISlI19098
	for <linux-mtd@lists.infradead.org>;
	Wed, 2 Apr 2003 12:28:47 -0600 (CST)
Date: Wed, 2 Apr 2003 12:28:47 -0600 (CST)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.GSO.4.44.0304021225270.18949-100000@unix.cs.tamu.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: newbie: struct flchip in flashchip.h...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


What are the members of the structure <mtd/flashchip.h>
struct flchip {
...
	int word_write_time;
	int buffer_write_time;
	int erase_time;
}
used for ?

-siddharth

_____________________________________________________________________
     Unix is user friendly - its just picky about its friends.
_____________________________________________________________________
