Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACls6-0002u3-V1
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 21:15:52 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9NKEcH28816
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 09:14:38 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9NKEb228810
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 09:14:37 +1300
Received: from tait.co.nz ([172.25.110.7])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HN800E7O88B2V@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Fri, 24 Oct 2003 09:14:35 +1300 (NZDT)
Date: Fri, 24 Oct 2003 09:14:12 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3F983694.1060005@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Building jffs2 utils?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings

Can someone give a clue as to the correct way to cross compile the utils 
directory? Its find just running make using my existing (Mandrake 9.1 
based) i386 system but a cross compile to powerpc-uclibc fails miserably 
on any jffs2 tools due to the zlib stuff not being found.

All contributions to my knowledge gratefully received :-))

-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
