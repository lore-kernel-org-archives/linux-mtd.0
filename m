Received: from mailout2.samsung.com ([203.254.224.25])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ATDA9-0007sf-1w
	for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2003 04:38:25 +0000
Received: from custom-daemon.mailout2.samsung.com by mailout2.samsung.com
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 id <0HPK002017G36X@mailout2.samsung.com> for linux-mtd@lists.infradead.org;
 Mon, 08 Dec 2003 13:36:03 +0900 (KST)
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with ESMTP id <0HPK00FQ37G2W1@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 08 Dec 2003 13:36:03 +0900 (KST)
Received: from leeyoungwoo ([10.251.3.31])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23
 2003)) with ESMTPA id <0HPK00DON7G2MC@mmp2.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 08 Dec 2003 13:36:02 +0900 (KST)
Date: Mon, 08 Dec 2003 13:32:56 +0900
From: =?ks_c_5601-1987?B?wMy/tb/s?= <youngwoo03.lee@partner.samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <LDEIINPDOLNLPBOJHIBMKEIFCAAA.youngwoo03.lee@partner.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: 7BIT
Subject: DOC  formatting/BIOS  recognition problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear sir,
         I  tried to format a DOC (DIskOnChip 2000)using the firmware version 524p(doc524p.exb)and I got this result.
         operation system : redhat 7.2 (kernel : linux-2.4.7-10)

 I formatted the DOC using the firmware version524p
    the

   dformat -WIN:d800 -S:doc524p.exb -Y -NOFORMAT -FIRST

   returns

   formatting
   4096 of 4096
   statuscode is 26(flUnknownMedia)received from
   flmountVolume.
   Format failed

===> how to solutions this problems?
thanks you.
