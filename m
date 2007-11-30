Received: from xerxes.tchmachines.com ([208.76.80.175])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iy9bV-0005DP-BE
	for linux-mtd@lists.infradead.org; Fri, 30 Nov 2007 17:24:47 +0000
Message-ID: <36289.69.30.123.186.1196443476.squirrel@architechnical.net>
Date: Fri, 30 Nov 2007 12:24:36 -0500 (EST)
Subject: JFFS2 garbage collection threads not freezing?
From: "Pete MacKay" <armlinux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: rjw@sisk.pl
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We've ported from 2.6.18 to 2.6.24-rc3 on a pxa270-based machine and can
no longer enter 'standby' or 'mem' states.  I've stripped down the kernel
and talked with the freezer maintainer and we believe the jffs2 garbage
collection threads may not be calling try_to_freeze() or marking
themselves properly.  (We have two mounted jffs2 file systems - mtd2 and
mtd3).  The following is some cleaned-up output:

Freezing remaining freezable tasks ...
Freezing of tasks failed after 20.00 seconds (2 tasks refusing to freeze):
  task                PC stack   pid father
init          D c0244b90     0     1      0
kthreadd      S c0244b90     0     2      0
ksoftirqd/0   S c0244b90     0     3      2
events/0      S c0244b90     0     4      2
khelper       S c0244b90     0     5      2
kblockd/0     S c0244b90     0    51      2
ksuspend_usbd D c0244b90     0    59      2
khubd         D c0244b90     0    64      2
kseriod       D c0244b90     0    67      2
pdflush       D c0244b90     0    90      2
pdflush       D c0244b90     0    91      2
kswapd0       D c0244b90     0    92      2
aio/0         S c0244b90     0    93      2
mtdblockd     S c0244b90     0   192      2
udevd         D c0244b90     0   619      1
jffs2_gcd_mtd R running      0  1533      2
jffs2_gcd_mtd R running      0  1598      2
syslogd       D c0244b90     0  2248      1
klogd         D c0244b90     0  2250      1
hcid          D c0244b90     0  2273      1
sdpd          D c0244b90     0  2277      1
hidd          D c0244b90     0  2281      1
sh            D c0244b90     0  2292      1
getty         D c0244b90     0  2293      1
echo          R running      0  2303   2292
 jffs2_gcd_mtd2
 jffs2_gcd_mtd3

Restarting tasks ... done.
