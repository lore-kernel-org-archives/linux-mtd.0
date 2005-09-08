Received: from c-24-91-108-216.hsd1.ma.comcast.net ([24.91.108.216]
	helo=ahgu.homeunix.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDNaT-0005UV-7l
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 10:41:19 -0400
Received: from maaxiang (fwma1.atitech.com [204.176.13.6])
	(authenticated bits=0)
	by ahgu.homeunix.com (8.12.11/8.12.11) with ESMTP id j88EYLol029384
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Sep 2005 10:34:21 -0400 (EDT)
	(envelope-from ahgu@ahgu.homeunix.com)
Message-ID: <023a01c5b483$acdc2070$1f1a12ac@atitech.com>
From: "ahgu" <ahgu@ahgu.homeunix.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 8 Sep 2005 10:43:22 -0400
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Subject: How many consecutive write failure can JFFS2 handle?
Reply-To: ahgu <ahgu@ahgu.homeunix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I notice in the code that write failure during recover from write error will
call BUG_ON. halts the kernel.
 Is it true that JFFS2 can only handle one write failure, not consecutive
 write failure.

 -Andrew 
