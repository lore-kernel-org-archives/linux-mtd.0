Received: from portail2.utbm.fr ([193.48.246.11] helo=portail1.utbm.fr)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EaVNZ-0007Ly-9h
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2005 04:39:33 -0500
Received: from portail2.utbm.fr (localhost.localdomain [127.0.0.1])
	by portail1.utbm.fr (8.12.8/jtpda-5.4) with ESMTP id jAB9dNgf010773
	for <linux-mtd@lists.infradead.org>; Fri, 11 Nov 2005 10:39:23 +0100
Received: from vers-webmail.utbm.fr (vers-webmail.utbm.fr [192.168.1.28])
	by portail2.utbm.fr (8.12.8/8.12.8) with ESMTP id jAB9dN2b010767
	for <linux-mtd@lists.infradead.org>; Fri, 11 Nov 2005 10:39:23 +0100
Message-ID: <1131701962.437466ca80ccc@webmail2.utbm.fr>
Date: Fri, 11 Nov 2005 10:39:22 +0100
From: "Pierre.Ricadat@UTBM.fr" <Pierre.Ricadat@utbm.fr>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: [JFFS2]remove totlen from jffs2_raw_node_ref
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi'

I'm trying to remove totlen from jffs2_raw_node_ref structure.

Could you confirm (or not) the following changes are needed? I understood that
from http://lists.infradead.org/pipermail/linux-mtd/2003-October/008689.html

- create a jffs2_raw_node_ref structure even for the dirty nodes (in scan.c :
case JFFS2_NODETYPE_CLEANMARKER, line 632)

- create a jffs2_raw_node_ref for the obsolete nodes we add to wasted (in
scan.c, line 729)

- then modify the calls to totlen in the other files and use
ref_totlen()instead.

Is it enough to ensure we can calculate totlen well in every cases?

Thanks
-- 
Pierre Ricadat
