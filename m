Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GB5vI-000734-FO
	for linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 04:29:56 -0400
Received: from ep_mmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J3R00600WXGY2@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 17:29:40 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0J3R00F23WXGIM@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 17:29:40 +0900 (KST)
Date: Thu, 10 Aug 2006 17:29:57 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: JFFS2 problem
To: linux-mtd@lists.infradead.org
Message-id: <003d01c6bc57$29ba2700$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

I am looking for JFFS2 stable version for kernel 2.4, Can u help me because
I am facing strange problem. My device size is 187M and JFFS2 creating 2G
file on my device. But when I checked same device partition on 2.6 kernel it
also show file size 2G "it can not be possible because MTD partition is 187M
" SO I run same test program on 2.6 kernel. it stops after creating 187M
file size. SO I wonder may it is a problem of JFFS2 version I am using with
mvl 2.4.20 kernel.

Rgs
Amit
