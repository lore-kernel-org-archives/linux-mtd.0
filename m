Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136bbA-00082N-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 17:19:00 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136bb8-00082A-00
	for cvs-notify@infradead.org; Mon, 26 Jun 2000 17:18:58 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd cfi.h map.h'
Message-Id: <E136bb8-00082A-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 26 Jun 2000 17:18:58 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv30857/include/linux/mtd

Modified Files:
	cfi.h map.h 
Log Message:
Detect more than one chip in CFI code. Doesn't yet handle aliases - the
alias detection function does 'return 0' but that's not too difficult to
fix. Now we can happily do locking of the chip to avoid concurrent access,
and that means we can do asynchronous erases and stuff safely too,
hopefully tomorrow.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
