Received: from mailc.telia.com ([194.22.190.4])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1lo-0004Xv-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 22:32:56 +0000
Message-ID: <005701c1bb29$393df6e0$e0d9b5d4@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se> <02022122583010.18560@thomas> <002f01c1bb23$dfceb540$e0d9b5d4@jocke> <02022123225211.18560@thomas>
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow, new improvment
Date: Thu, 21 Feb 2002 23:43:46 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Is the CRC check needed for the data part(if (ri.csize ....) in
jffs2_scan_inode_node ()
in ? Removing this check halves my already improved mount time :-)

The CRC check of ri.node_crc and rd.node_crc can be removed since it has
already
been checked in jffs2_scan_eraseblock(). OK ?

         Jocke
