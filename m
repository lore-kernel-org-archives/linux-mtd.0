Received: from motgate5.mot.com ([144.189.100.105])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AiV3u-0000A7-Vu
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2004 08:47:11 +0000
Received: from az33exr01.mot.com (az33exr01.mot.com [10.64.251.231])
	by motgate5.mot.com (Motorola/Motgate5) with ESMTP id i0J8iTXe014346
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Jan 2004 01:44:29 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by az33exr01.mot.com (Motorola/az33exr01) with ESMTP id i0J8f4aI029506
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2004 02:41:05 -0600
Message-ID: <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
From: Li Yang-r58472 <LeoLi@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 19 Jan 2004 16:43:11 +0800
MIME-Version: 1.0
Content-Type: text/plain
Subject: jffs2+mtd+big endian problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm doing a JFFS2 port to a PowerPC target board.  I have several questions while porting.

1. Which kind of endian should I use in JFFS2?  Mkfs.jffs2 (older version, I have tried the new binary on JFFS2 website, the big-endian option breaks) can generate images of the two endian types.

2. I added a new map file in driver/mtd/maps directory.  Which read/write/memcpy operation should I use?  __raw_readw() or readw()? Or Inw()?  They determined whether to swap bytes.

I have tried several cases.  When I use little-endian fs and __raw_read(), the JFFS2 mount got error: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x8519 instead.  

However, after I change to use big-endian fs, mount can be successful.  Create new file on JFFS2 got error: Node totlen on flash (0x44000000) != totlen in node ref (0x00000044).  Seems data written to flash are 32-bit byte-swaped.

Has anyone here done JFFS2 on Powerpc Big-endian system?  What are your options?


--
Leo Li
Software Engineer
Metrowerks -- a Motorola company
Linux Solutions Group
 
Office: +8610-65642272
LeoLi@motorola.com
 
