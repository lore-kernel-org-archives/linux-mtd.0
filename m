Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 191R0G-0005vn-Ax
	for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2003 14:13:08 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 191R0G-0000KT-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2003 15:13:08 +0200
Date: Fri, 4 Apr 2003 15:13:08 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20030404131307.GB16455@tkeitel001.bln.innominate.local>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
Subject: Magic bitmask 0x1985 not found. fs corruption?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

after some reboots, I sometimes get a filesystem that causes the
following output when it is mounted:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0008: 0x8124 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0008: 0x8124 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300008: 0x8124 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0008: 0x8124 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400008: 0x8124 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420000: 0x2003 instead 
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420008: 0x8124 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440008: 0x8124 instead

Since th numers are repeating, I think this is a bug that strikes
multiple times. I'm using a CVS version that is a few weeks old.

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
