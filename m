Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1358A1-00050v-00
	for mtd-list@infradead.org; Thu, 22 Jun 2000 15:40:53 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1358A1-00050p-00
	for cvs-notify@infradead.org; Thu, 22 Jun 2000 15:40:53 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/patches put_module_symbol-2.2.1x.patch'
Message-Id: <E1358A1-00050p-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 22 Jun 2000 15:40:53 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/patches
In directory infradead.org:/tmp/cvs-serv19257

Added Files:
	put_module_symbol-2.2.1x.patch 
Log Message:
Patch to 2.2 kernels to fix up the race in get_module_symbol() and add
put_module_symbol



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
