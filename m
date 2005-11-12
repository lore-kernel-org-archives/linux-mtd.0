Received: from caramon.arm.linux.org.uk ([212.18.232.186])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eb05k-0000sj-DC
	for linux-mtd@lists.infradead.org; Sat, 12 Nov 2005 13:27:14 -0500
Received: from flint.arm.linux.org.uk ([2002:d412:e8ba:1:201:2ff:fe14:8fad])
	by caramon.arm.linux.org.uk with esmtpsa (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.52) id 1Eb00k-0006yO-3n
	for linux-mtd@lists.infradead.org; Sat, 12 Nov 2005 18:21:59 +0000
Received: from rmk by flint.arm.linux.org.uk with local (Exim 4.52)
	id 1Eb00i-0001H1-AK
	for linux-mtd@lists.infradead.org; Sat, 12 Nov 2005 18:21:56 +0000
Date: Sat, 12 Nov 2005 18:21:55 +0000
From: Russell King <rmk@arm.linux.org.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20051112182155.GE28987@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King <rmk@arm.linux.org.uk>
Subject: fyi: jornada720 build failure in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2 seems to have a problem.  Anyone care to fix it /in/
/mainline/ please?

  CC      fs/jffs2/scan.o
fs/jffs2/scan.c: In function 'jffs2_fill_scan_buf':
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
fs/jffs2/scan.c:288: error: invalid use of void expression
make[2]: *** [fs/jffs2/scan.o] Error 1
make[1]: *** [fs/jffs2] Error 2
make: *** [fs] Error 2

Full build log:

http://armlinux.simtec.co.uk/kautobuild/2.6.15-rc1/jornada720_defconfig/zimage.log

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
