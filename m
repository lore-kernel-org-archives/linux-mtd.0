Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DGNmi-00054z-HC
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2005 15:58:01 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DGNlQ-0000Kr-JG
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2005 22:56:44 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 22:56:40 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 22:56:40 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Tue, 29 Mar 2005 20:55:06 +0000 (UTC)
Message-ID: <loom.20050329T223730-617@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: try_to_freeze() missing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

compiling linux 2.6.10 with mtd snapshot from yesterday (2/28/2005) fails with 
undefined reference to try_to_freeze(). According to linux cross-reference
try_to_freeze first appears in 2.6.11
mtd is uses in jffs2/background.c
I understand that we do not want to support ancient kernels but that seems
a bit extreme ;-)

Sergei Sharonov
