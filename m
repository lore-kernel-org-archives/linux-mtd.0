Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uZIY-0005BF-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 13:30:36 +0100
Received: from cad2.me.ccu.edu.tw ([140.123.121.3])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uZIS-0004tS-00
	for linux-mtd@lists.infradead.org; Tue, 01 May 2001 13:30:41 +0100
Received: from cs.ccu.edu.tw ([211.23.94.162]) by cad2.me.ccu.edu.tw (8.7.5/8.7.5) with ESMTP id IAA24530 for <mtd@infradead.org>; Tue, 1 May 2001 08:41:36 +0800 (CST)
Message-ID: <3AEEAE8F.4C2BB285@cs.ccu.edu.tw>
Date: Tue, 01 May 2001 20:39:43 +0800
From: lmc83 <lmc83@cs.ccu.edu.tw>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD driver module for SmartMedia
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hi,
    Is there MTD driver module for SmartMedia?
    In the cvs I got (2001/05/01), there is a generic MTD driver for NAND flash
devices (nand.c),
    Can I use nand.c to drive SmartMedia ?
    In the source code tree structure, "mtd/devices" means MTD driver module
    what does "mtd/maps" means for? 
    (In my view, it seems put some on-board MTD driver module, is it?)

    Thanks.
    Liang Ming-Chung
