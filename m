Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZtYN-0003A1-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 11:48:55 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZtYM-00039v-00
	for mtd@infradead.org; Tue, 28 Mar 2000 11:48:54 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12ZtYV-0007P2-00
	for mtd@infradead.org; Tue, 28 Mar 2000 11:49:03 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12ZtYV-0004jZ-00; Tue, 28 Mar 2000 11:49:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Preliminary documentation.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Mar 2000 11:49:03 +0100
Message-ID: <18200.954240543@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I've now put written up the documentation I wrote out by hand last night.
It's at http://www.linux-mtd.infradead.org/tech/

Comments, please. I haven't yet filled in my suggested restrictions on the 
read/write functions, but I have removed the retlen arguments.

As I said, I'm changing the notifier stuff to make it cleaner. I have yet to 
actually change the code to fit in with my new documentation. 

Also, a couple of questions on the decisions I've made:

1. Is mtd->sync() enough, or could users want more access to the erase queue?

	We could add 
		struct erase_info *mtd->eraseq;
		spin_lock_t	mtd->eraseq_lock;
	... and allow users to use that.

2. Is the callback in the erase_info OK or would we be better off having a 
wait_queue_head_t instead (or as well)?






--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
