Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLhxb-0005ll-TE
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 09:31:16 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DLhte-00018b-Lt
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 15:27:18 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2005 15:27:10 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2005 15:27:10 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 13 Apr 2005 13:25:38 +0000 (UTC)
Message-ID: <loom.20050413T142519-107@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

It looks like there is a long delay before filesystem becomes available 
after mount returns. Test setup: jffs2 on 256 MByte NAND chip, 2.6.10 linux
with recent mtd snapshot. Filesystem contains one 200 MByte file written 
and fsynced in 1 kByte chunks. Checking ps it appears that gcd was the only 
thing running (RWN).
Mount and touch were run immediately one after another. I think it may be
related to the long umount time problem that I reported before. At least
the symptoms are similar: something is still going on after mount completes.
Note negligible user and sys times during touch.

# time mount /mnt/flash/

real    1m33.538s
user    0m0.020s
sys     1m33.421s
# time touch /mnt/flash/junk

real    11m10.058s
user    0m0.010s
sys     0m0.010s
#

Sergei Sharonov
