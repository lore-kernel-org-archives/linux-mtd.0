Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFE4b-0000FC-1J
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2004 11:51:26 -0400
Message-ID: <416414B7.1060509@inf.u-szeged.hu>
Date: Wed, 06 Oct 2004 17:52:23 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,  jffs-dev@axis.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: bug in nodemgmt.c?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

During the final testing of my model-based-patch I think I found a bug 
in fs/jffs2/nodemgmt.c

In function jffs2_mark_node_obsolete() at the part of "Merge with the 
next node in the physical list, if there is one and if it's also 
obsolete" there is a comment: "we don't need to check jeb->last_node".

Is it right? Because I think we should deal with jeb->last_node here, or 
should not use "D1(ACCT_PARANOIA_CHECK(jeb));" statement any more, but 
now it is used by also this function.

ACCT_PARANOIA_CHECK walk throught the nodes (using next_phys) and if at 
the end of the list is not equals to jeb->last_node than halts. 
Unfortunatelly with simple "NULL pointer dereference" without any 
usefull messages.

Just say I'm right and I fix this problem in the CVS (a single
"if (jeb->last_node == n) jeb->last_node=ref;" line into nodemgmt.c and 
better message in ACCT_PARANOIA_CHECK).

Regards,
Ferenc
