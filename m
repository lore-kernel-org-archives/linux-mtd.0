Received: from mailhost.opengroup.fr ([62.160.165.1] helo=mailhost.ri.silicomp.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Az4G-0008NT-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 19:47:56 +0000
Received: from sisley.ri.silicomp.fr (root@sisley [62.160.165.44])
	by mailhost.ri.silicomp.fr (8.12.1/8.12.1) with ESMTP id fB3JwSdG010611
	for <linux-mtd@lists.infradead.org>; Mon, 3 Dec 2001 20:58:28 +0100
Received: from localhost (saffroy@localhost)
	by sisley.ri.silicomp.fr (8.11.3/8.11.3) with ESMTP id fB3JwU123819
	for <linux-mtd@lists.infradead.org>; Mon, 3 Dec 2001 20:58:30 +0100
Date: Mon, 3 Dec 2001 20:58:30 +0100 (CET)
From: Jean-Marc Saffroy <saffroy@ri.silicomp.fr>
To: <linux-mtd@lists.infradead.org>
Subject: Rational for JFFS2 deletion dirent ?
Message-ID: <Pine.LNX.4.31.0112032043040.22767-100000@sisley.ri.silicomp.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi all,

I'm currently looking at the JFFS2 code, and I was wondering why the
unlink operation creates a deletion dirent. Isn't it sufficient to mark
the old dirent as obsolete ?

BTW, I can't find where deletion dirents are actually removed, except when
their parent directory is removed or their erasure block is garbage
collected, have I missed other places ?

TIA.


Regards,

-- 
Jean-Marc Saffroy - Research Engineer - Silicomp Research Institute
mailto:saffroy@ri.silicomp.fr
