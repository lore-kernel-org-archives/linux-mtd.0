Received: from [202.114.36.28] (helo=bbs.ccnu.edu.cn)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196oiY-0000Qz-Kq
	for <linux-mtd@lists.infradead.org>; Sat, 19 Apr 2003 10:33:07 +0100
Date: Sat, 19 Apr 2003 17:48:31 +0800
From: lhl <lhl@phy.ccnu.edu.cn>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Message-Id: <E196oiY-0000Qz-Kq@pentafluge.infradead.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Subject: DFORMAT ERROR " IPL block is bad."on DiskOnChip 2000?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When I use the DOC5.1.4 DOS utilities'
DFORMAT /WIN:DC00 /S:DOC514.EXB /FIRST

ERRORS

DiskOnChip 2000 found in 0xdc000.
64M media, 16K unit
Virgin card rebuilding unit map.
Media has been scanned
ERROR - IPL block is bad.
Error formatting DiskOnChip.
Status code is 119 (flUnknow status) received from flFormatPhysicalDrive.
Format failed.

What's the matter with it?
