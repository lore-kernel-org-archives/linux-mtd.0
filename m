Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136bbA-00082O-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 17:19:00 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136bb9-00082G-00
	for cvs-notify@infradead.org; Mon, 26 Jun 2000 17:18:59 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c'
Message-Id: <E136bb9-00082G-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 26 Jun 2000 17:18:59 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv30857/kernel

Modified Files:
	cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c 
Log Message:
Detect more than one chip in CFI code. Doesn't yet handle aliases - the
alias detection function does 'return 0' but that's not too difficult to
fix. Now we can happily do locking of the chip to avoid concurrent access,
and that means we can do asynchronous erases and stuff safely too,
hopefully tomorrow.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
