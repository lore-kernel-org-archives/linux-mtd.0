Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Sdoy-0004fm-00
	for mtd-list@infradead.org; Sat, 26 Aug 2000 12:08:20 +0100
Message-ID: <39A7A51A.63F2BCBB@auriga.ru>
Date: Sat, 26 Aug 2000 15:08:10 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd <mtd@infradead.org>
Subject: gc_minfree_threshold
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David,
I have just noticed some strange things in the code dealing
with gc_minfree_threshold. I guess you added that code that is
why I am addressing my questions to you.

First, when you initialize c->gc_minfree_threshold to 5%
of the total Flash size, you then make sure that it is not less
than a sector size. Why? Shouldn't it rather be not less than
fmc->min_free_size?

Second, when you evaluate a gc starting criteria in
thread_should_wake(), you compare gc_minfree_threshold with
dirty_size. I guess there should be free_size instead.

Thanks,
Nick



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
