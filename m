Received: from flock1.newmail.ru ([212.48.140.157])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 197f8h-0002y7-5K
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 18:31:35 +0100
From: "A.L. Klyutchenya" <asoneofus@nm.ru>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 21 Apr 2003 21:30:50 +0400
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304212130.50598.asoneofus@nm.ru>
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 8bit
Subject: root=?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Der sirs,

How to sent kernel rootfs params?
I have NAND Flash, and have error on boot:

NAND device: Manufacture ID: 0xec, Chip ID: 0x75 (Samsung NAND 
32MB 3,3V)
Using static partition definition
Creating 1 MTD partitions on "NAND 32MB 3,3V":
0x00000000-0x02000000 : "OSSC VoIP phone Nand Flash"
Im [init_mtd] starting at mtdcore.c line 422
Im [init_mtdblock] starting at mtdblock-core.c line 229
Im [netlink_proto_init] starting at af_netlink.c line 995
Im [inet_init] starting at af_inet.c line 1202
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
Kernel panic: I have no root and I want to scream

I use "root=mtd0", "root=mtdblock", "root=/dev/mtd0", 
"root=/dev/mtdblock" with no effects :-(

I create image (JFFS2) with kernel and place in NAND Flash.

-- 
ВсехБлаг!      
      ____   __
     /   |  / / А. Л. Клютченя
    / /| | / /  (asoneofus)
   / /_| |/ /   mail:   asoneofus@kde.ru
  / ____  _ \   www:    http://www.qt.kde.ru
 / /   | | \ \  icq:    113679387
/_/    |_|  \_\ 
