Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12qcJ7-0004rH-00
	for mtd-list@infradead.org; Sat, 13 May 2000 14:50:17 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12qcJ6-0004rB-00
	for cvs-notify@infradead.org; Sat, 13 May 2000 14:50:16 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtd.c'
Message-Id: <E12qcJ6-0004rB-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 13 May 2000 14:50:16 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv18640

Modified Files:
	mtd.c 
Log Message:
More patches from Lineo to compensate for my stupidity.
Freeing a data structure before reading the status out of it is generally
a bad thing to do.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
