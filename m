Received: from [62.254.213.145] (helo=cambridgebroadband.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rbI7-0007ZG-SV
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 11:43:11 +0100
From: Dave Pegler <dwp@cambridgebroadband.com>
MIME-Version: 1.0
Message-ID: <16203.14760.225110.350862@localhost.localdomain>
Date: Tue, 26 Aug 2003 11:42:48 +0100
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: dwp@cambridgebroadband.com
Subject: jffs file duplication 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Has anyone seen files duplication (like system.conf shown below) 
when using the jffs filing system ?

sh-2.04# ls -la
drwxr-xr-x   1 root     4001            0 Apr 30  2003 .
drwxr-sr-x   1 root     root            0 Apr 30  2003 ..
-rw-r--r--   1 root     4001           15 Jan  1 00:23 bridge.conf
-rw-rw-rw-   1 root     root          145 Jan  1 00:02 ces.conf
-rw-r--r--   1 root     4001           31 Jan  1 00:23 e1.conf
-rw-r-----   1 root     root          111 Jan  1 00:23 ifcfg-eth0
drwxr-x---   1 root     root            0 Jan  1 00:05 sunet-scripts
-rw-rw-rw-   1 root     root            0 Jan  1 00:00 system.conf
-rw-rw-rw-   1 root     root            0 Jan  1 00:00 system.conf
-rw-rw-rw-   1 root     root            0 Jan  1 00:00 system.conf
-rw-rw-rw-   1 root     root            0 Jan  1 00:00 system.conf
sh-2.04# 

Dave.
