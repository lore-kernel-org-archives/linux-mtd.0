Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CevYn-00018y-1w
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 08:20:50 -0500
Received: from jockewin (fw [172.31.1.1]) (authenticated bits=0)
	by dmz.lumentis.net (8.12.8/8.12.8) with ESMTP id iBGDKhNX029521
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 14:20:43 +0100
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Date: Thu, 16 Dec 2004 14:20:43 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEEEGDCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi List

I am a long time JFFS2 user(and developer), but I haven't been following
JFFS2 for a year or two. I have noticed that JFFS3 has begun and I figured
I would offer a few thoughts.

1) Consider changing the start seed to crc32 from 0 to -1. Zero
   is not a good start seed for crc32

2) Consider another checksum algorithm. Crc32 is very expensive
   and JFFS2 suffered severely in the early days. Now that crc32 is
   very optimized that problem is less visible, but crc32 is still
   expensive. Maybe an Adler32 checksum is good enough or a crc16?

3) Don't calculate a Adler32 checksum when comressing with zlib.
   JFFS2 already has its own checksum.

 Jocke
