Received: from mx-00.sil.at ([62.116.68.196])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7nkc-0002IU-9D
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 04:15:34 +0100
Date: Fri, 10 Oct 2003 05:13:02 +0200 (CEST)
From: Ingo Flaschberger <if@sil.at>
To: jffs-dev@axis.com
Message-ID: <Pine.GSO.4.56.0310100453520.19931@ikarus.sil.at>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: kmalloc jffs2_do_mount_fs 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

after 3 nights... debugging why my sharp zaurus do not boot from my
initrd.. i found:

kmalloc does not give you more than 128k (only i you "hack" it).
jffs2 with a filesystem about 40Mb need more when mounting..
to fix this.. i have luckily found a patch at the list:
http://lists.infradead.org/pipermail/linux-mtd/2002-December/006577.html

but why doe you not apply it to the source or warn because of this
"jffs2" problem???

thnx & bye, Ingo
