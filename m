Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D857F-00013m-SU
	for linux-mtd@lists.infradead.org; Sun, 06 Mar 2005 18:24:54 -0500
Received: from custom-daemon.mailout2.samsung.com by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	id <0ICY00001EDE7C@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 08:24:50 +0900 (KST)
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ICY006AHEDD3P@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 08:24:50 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPSA id <0ICY00IO5EDAZC@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 08:24:49 +0900 (KST)
Date: Mon, 07 Mar 2005 08:24:47 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <1110009521.4032.195.camel@tglx.tec.linutronix.de>
To: tglx@linutronix.de
Message-id: <0ICY00IOAEDDZC@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: Trying to get 1Gb Samsung nand flash working
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Can you please tell me the CVS $Id string from 
> drivers/mtd/nand/nand_bbt.c ?
> 

I just use default mtd in linux 2.6.11 kernel inside

* $Id: nand_bbt.c,v 1.28 2004/11/13 10:19:09 gleixner Exp $

Kyungmin Park
