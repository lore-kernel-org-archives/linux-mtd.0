Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9hdc-0004f8-5J
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 05:45:00 -0500
Date: Fri, 11 Mar 2005 11:44:58 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050311104457.GB11203@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Actually I tried to debug, what happens in, before and after memcpy() in
fs/jffs2/scan.c line 773 (actual cvs) located in
jffs2_scan_dirent_node(), as I suspect some issues with dcache.
Therefore I copied memcpy() out of arch/arm/boot/compressed/misc.c (why
is it _there?) above jffs2_scan_dirent_node() to memcpykgk().

The "Name CRC failed on node at ..." is away. I populated the root-fs
on the system with "cp -a -r" over nfs and rebooted with this as
root-fs. No problems. But mounting takes ages :)

Whats next? :D

Konsti



-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
