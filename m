Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFKbz-0003Zb-0A
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 21:45:47 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9ULiVH21321
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 10:44:31 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9ULiV221315
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 10:44:31 +1300
Received: from tait.co.nz ([172.25.107.17])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HNL00K1MB2548@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Fri, 31 Oct 2003 10:44:29 +1300 (NZDT)
Date: Fri, 31 Oct 2003 10:43:50 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3FA18616.6090201@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Has anyone managed to compile jffs2reader lately?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I note that its commented out in the makefile and despite various hacks 
and trials I'm unable to compile it since it seems to suffer rather a 
lot of typedef problems (inherited from zlib I think).

I'll not include the whole list (too big) but this is an example of the 
errors I'm seeing.

jffs2reader.c: In function `putblock':
jffs2reader.c:139: incompatible types in initialization
jffs2reader.c:141: invalid operands to binary >
jffs2reader.c:141: invalid operands to binary +
jffs2reader.c:146: invalid operands to binary <
jffs2reader.c:147: invalid operands to binary -
jffs2reader.c:151: invalid operands to binary +

This lack of an analysis tool means I'm unable to debug the device file 
problems I reports yesterday.

-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
