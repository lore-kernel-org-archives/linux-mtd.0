Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12uO3f-0005ji-00
	for mtd-list@infradead.org; Wed, 24 May 2000 00:25:55 +0100
Received: from phiggins by infradead.org with local (Exim 3.03 #1)
	id 12uO3e-0005jc-00
	for cvs-notify@infradead.org; Wed, 24 May 2000 00:25:54 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel doc2000.c doc2001.c'
Message-Id: <E12uO3e-0005jc-00@infradead.org>
From: phiggins@infradead.org
Date: Wed, 24 May 2000 00:25:54 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv22044

Modified Files:
	doc2000.c doc2001.c 
Log Message:
Fixed the NULL dereference in the Millenium code.
Also added more thorough checking for aliased disk on chips (a single chip
which appears at multiple addresses).



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
