Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LmcZ-0001cY-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 13:39:27 +0000
Received: from [62.47.35.149] (helo=nis.hofr.at)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LmcX-0001cS-00
	for mtd@infradead.org; Thu, 25 Jan 2001 13:39:25 +0000
Received: (from root@localhost)
	by nis.hofr.at (8.9.3/8.9.3/SuSE Linux 8.9.3-0.1) id QAA18181
	for mtd@infradead.org; Thu, 25 Jan 2001 16:21:34 -0700
From: Nicholas Mc Guire <der.herr@hofr.at>
Message-Id: <200101252321.QAA18181@nis.hofr.at>
Subject: mtd from cvs and 2.2.18
To: mtd@infradead.org
Date: Thu, 25 Jan 2001 16:21:33 -0700 (MST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi !

 someone ask about how to get mtd from cvs to work with 2.2.X .

 patchin.sh puts the links into the linux
 tree ok , but it does not make the changes
 to arch/i386/config.in, one must add the line

source drivers/mtd/config.in

 then everything goes fine with make config/menuconfig/xconfig


hofrat


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
