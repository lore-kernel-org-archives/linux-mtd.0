Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 126NIB-0005it-00
	for mtd-list@infradead.org; Fri, 07 Jan 2000 00:30:11 +0000
Received: from out4.prserv.net ([165.87.194.239] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 126NI7-0005in-00
	for mtd@infradead.org; Fri, 07 Jan 2000 00:30:07 +0000
From: Dvir Oren <dviro@lucidvon.com>
To: MTD <mtd@infradead.org>
Subject: Hardware RO & delays [DOC2000]
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8BIT
Date: Tue, 4 Jan 2000 23:45:42 +0200
Sender: owner-mtd@imladris.demon.co.uk
Message-Id: <E126NIB-0005it-00@infradead.org>
List-ID: <linux-mtd.lists.infradead.org>

Two questions this time:

1.  Is there a way to tell the flash (DoC2000) to mark a certain part 
of it as read only?  I know I can mount a certain partition as read 
only, but can I protect it at a lower level?

2.  Does the driver block the system?  I'm experience delays in 
sending udp packets over ethernet for periods of 50-300 
miliseconds.  I have a function that is supposed to send every 
several miliseconds a packets, and when going over the logs, I 
once in a while see a packet that is delayed for several tens of 
miliseconds, which is not acceptable by me.  Any ideas?

David, does the driver block the system?




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
