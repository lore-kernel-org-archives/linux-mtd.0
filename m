Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DM1su-0007mt-DJ
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 11:47:45 +0100
Received: from il06exr03.mot.com (il06exr03.mot.com [129.188.137.133])
	by motgate8.mot.com (Motorola/Motgate8) with ESMTP id j3EAo324015227
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2005 03:50:03 -0700 (MST)
Received: from zch07exm05.corp.mot.com (ZCH07EXM05.corp.mot.com [200.3.1.211])
	by il06exr03.mot.com (8.13.1/8.13.0) with ESMTP id j3EAnpTU018688
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2005 05:49:52 -0500 (CDT)
Message-ID: <3BCB5FB76AFFF646BCFBC02A889B64F302435044@ZCH07EXM05.corp.mot.com>
From: Jiang Jun-A21079 <A21079@motorola.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 14 Apr 2005 18:47:28 +0800
MIME-Version: 1.0
Content-Type: text/plain
Subject: compile error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Compile information:
erase.c: In function `jffs2_mark_erased_block':
erase.c:336: error: structure has no member named `wbuf'
erase.c:339: error: structure has no member named `oobinfo'

JFFS2 is a snapshot of 20050413
I compile for NOR flash and WRITEBUFFER not defined.
