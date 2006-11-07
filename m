Received: from mail.gmx.de ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GhOqx-0004b8-Vw
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 06:10:58 -0500
Content-Type: text/plain; charset="iso-8859-1"
Date: Tue, 07 Nov 2006 12:10:47 +0100
From: mvw@nurfuerspam.de
Message-ID: <20061107111047.189600@gmx.net>
MIME-Version: 1.0
Subject: BUILD JFFS2
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

since 5 day i would build an jffs2 filesystem but i dont know howto.
I only know that i buld this with this comand 
mkfs.jffs -e 20000 -r dir -o image.jffs2  

What files are needed or better can anybody send me his filesystem for a look?

-------------------------------------------------------------------
Creating 4 MTD partitions on "MTD map driver for JDSU OSAboard":
0x00000000-0x00020000 : "uboot"
0x00020000-0x00040000 : "environment"
0x00040000-0x00140000 : "kernel"
0x00140000-0x00f40000 : "jffs2"
mice: PS/2 mouse device common for all mice
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 60K
(at the moment nothing more came)
--------------------------------------------------------------------

Thank you for your comments.

Armin

-- 
GMX DSL-Flatrate 0,- Euro* - Überall, wo DSL verfügbar ist!
NEU: Jetzt bis zu 16.000 kBit/s! http://www.gmx.net/de/go/dsl
