Received: from mail-gw.radisys.com ([206.102.10.35] helo=radisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157Nw1-0005GN-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 22:00:17 +0100
Received: (945 bytes) by radisys.com
	via sendmail with P:stdio/R:inet_hosts/T:smtp
	(sender: <Jan.Rovins@radisys.com>)
	id <m157Nzf-000qatC@radisys.com>
	for linux-mtd@lists.infradead.org; Tue, 5 Jun 2001 14:04:03 -0700 (PDT)
	(Smail-3.2.0.105 1999-Mar-3 #2 built 1999-Apr-18)
To: linux-mtd@lists.infradead.org
Subject: Latest cvs dosn't build (need to fix interp.c)
MIME-Version: 1.0
Message-ID: <OF597D578E.1F8F8219-ON85256A62.007302C9@radisys.com>
From: Jan.Rovins@radisys.com
Date: Tue, 5 Jun 2001 17:01:58 -0400
Content-Type: text/plain; charset="us-ascii"
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

Just fetched the latest CVS,
mtd/fs/jffs/interp.c  at line 376 there is a printk() that is malformed. 
(has too many sets of parens)
Could someone with CVS access please fix?

Thanks in advance,
Jan
