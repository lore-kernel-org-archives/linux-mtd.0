Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12azQF-00030s-00
	for mtd-list@infradead.org; Fri, 31 Mar 2000 12:17:03 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12azQE-00030m-00
	for cvs-notify@infradead.org; Fri, 31 Mar 2000 12:17:02 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/html index.html'
Message-Id: <E12azQE-00030m-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 31 Mar 2000 12:17:02 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/html
In directory infradead.org:/tmp/cvs-serv11556

Modified Files:
	index.html 
Log Message:
Change wording of design aims slightly. More an excuse to test the new cvs commit mail.
Now it closes the pipes to 'cvs server' before forking and exec'ing /bin/mail, so 
Exim doesn't keep the cvs server pipe open while it's delivering mail to the whole list.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
