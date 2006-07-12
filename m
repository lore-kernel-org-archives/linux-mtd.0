Received: from web209.biz.mail.re2.yahoo.com ([68.142.224.171])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0UxN-00041p-Ic
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 23:00:14 -0400
Message-ID: <20060712030005.51211.qmail@web209.biz.mail.re2.yahoo.com>
Date: Tue, 11 Jul 2006 20:00:05 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Micron MT28F128J3 RP JFFS2 error
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: zql@glomationinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have a ARM (Cirrus EP9315) based SBC with 2 FLASH
chips, we used both Micron and Intel chips, 32MB
total.  The JFFS2 driver will give,

jffs2_scan_eraseblock(): Magic bitmask 0xXXXX not
found at 0xXXXXXXXX 

errors when the MTD was re-mounted after umount.  But
only on the boards with Micron chip not on the Intel. 
Googling the net I realized that there are slight
difference between the 2 chips.  Can someone kindly
point me to where I should start to look in order to
solve this problem?

The Linux kernel is 2.4.21.
