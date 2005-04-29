Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DRWhP-00016M-14
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2005 10:42:35 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DRWZG-0001tM-Cm
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2005 16:34:17 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2005 16:34:10 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2005 16:34:10 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Fri, 29 Apr 2005 14:30:27 +0000 (UTC)
Message-ID: <loom.20050429T162520-770@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: summary patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

after applying summary patch I start getting messages like:

JFFS2: not enough space for summary, padsize = -530
JFFS2: not enough space for summary, padsize = -199
JFFS2: not enough space for summary, padsize = -992
JFFS2: not enough space for summary, padsize = -127

Is that a note, a warning or an error?
kernel 2.6.10 with March 28th 2005 mtd snapshot.

Sergei Sharonov
