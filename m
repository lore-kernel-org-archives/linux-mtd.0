Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1431lQ-0004xs-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 19:59:04 +0000
Received: from itidev1.wte.net ([206.98.206.71] helo=itidev1.cachier.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1431lO-0004xa-00
	for mtd@infradead.org; Mon, 04 Dec 2000 19:59:02 +0000
From: Levi Khatskevitch <LKhatskevitch@cachier.com>
Reply-To: LKhatskevitch@cachier.com
To: mtd@infradead.org, linuxbios@lanl.gov
Subject: nftl/DoC Mill. root fs question
Date: Mon, 4 Dec 2000 14:52:34 -0500
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <00120414560502.15102@itidev1>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

My kernel mounts /dev/nftla1 as root with no problems however when I do

# mount

it reports that / is /dev/root device and not /dev/nftla1 what did I miss?
- Levi

-- 
Levi Khatskevitch
CTO
Cachier, Corp.
575 Grand St., Suite E306
New York, NY 10002


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
