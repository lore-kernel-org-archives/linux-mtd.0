Received: from albatross-ext.wise.edt.ericsson.se ([194.237.142.116])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15blxJ-0003ds-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 17:43:13 +0100
Received: from mailserver1.ericsson.se (mailserver1.ericsson.se [136.225.152.91])
	by albatross.wise.edt.ericsson.se (8.11.0/8.11.0/WIREfire-1.3) with ESMTP id f7SGnAK18671
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 18:49:11 +0200 (MEST)
Received: from switchboard.ericsson.se (mail@kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
	by mailserver1.ericsson.se (8.9.3/8.9.3/eri-1.0) with ESMTP id SAA27308
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 18:49:08 +0200 (MET DST)
Message-ID: <3B8BCB83.64A68A5F@inn.ericsson.se>
Date: Tue, 28 Aug 2001 18:49:08 +0200
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: jffs2 root
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

This is the last lines of a boot.

---
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 56k init 4k openfirmware
Starting userspace with /sbin/init 
Kernel panic: No init found.  Try passing init= option to kernel.
Rebooting in 180 seconds..
-----

What dose this mean?? It mounts jffs2 and I know /sbin/init is there.

The exact same kernel booting a ramdisk then mounting jffs2 works and a diff
of /sbin/init shows it to be correct. 


-- 
Kenneth Johansson	
Ericsson Business Innovation AB   Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@inn.ericsson.se
