Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12qc9b-0004qK-00
	for mtd-list@infradead.org; Sat, 13 May 2000 14:40:27 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12qc9a-0004qE-00
	for cvs-notify@infradead.org; Sat, 13 May 2000 14:40:26 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd mtd.h'
Message-Id: <E12qc9a-0004qE-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 13 May 2000 14:40:26 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv18606

Modified Files:
	mtd.h 
Log Message:
Patches from Lineo to fix some of my more stupid mistakes. I'd inverted
the return value of try_inc_mod_count() - which in 2.2 was fine because
I was emulating it, but it wouldn't have worked in 2.3.
Grrr. Whichever I develop on, it just doesn't work in the other :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
