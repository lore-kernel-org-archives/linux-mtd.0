Received: from taku.hut.fi ([130.233.228.87])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15dtZb-0007Pq-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 14:15:31 +0100
Received: from kosh.hut.fi (jlavi@kosh.hut.fi [130.233.228.10])
	by taku.hut.fi (8.9.3/8.9.3) with ESMTP id QAA14686
	for <linux-mtd@lists.infradead.org>; Mon, 3 Sep 2001 16:21:33 +0300 (EET DST)
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id QAA12453
	for linux-mtd@lists.infradead.org; Mon, 3 Sep 2001 16:21:33 +0300 (EET DST)
Date: Mon, 3 Sep 2001 15:58:42 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: linux-mtd@lists.infradead.org
Subject: complete_and_exit() problem
Message-ID: <20010903155842.A19349@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The garbage collection thread crashes when I unmount JFFS2. The filesystem
is empry and I only mount it and then unmount it. I am using kernel 
2.4.8ac12 with rmk1 patch for ARM cpu.

I traced the exeution to complete_and_exit(), then to complete(), then 
to __wake_up_common(). In __wake_up_common() there is a loop

        list_for_each(tmp,&q->task_list) {
                unsigned int state;
                wait_queue_t *curr = list_entry(tmp, wait_queue_t, task_list);

                CHECK_MAGIC(curr->__magic);
                p = curr->task;
                state = p->state;
                if (state & mode) {
                        WQ_NOTE_WAKER(curr);
                        if (try_to_wake_up(p, sync) && (curr->flags&WQ_FLAG_EXCL
USIVE) && !--nr_exclusive)
                                break;
                }
        }

When entering the loop, the list q->task_list contains no task.
q->task_list.next and q->task_lis.prev are null pointers. 
list_for_each() checks the end of list by comparing against the 
list head (q->task_list), not NULL.

I tried replacing 

-       if (comp)
+	if (comp && comp->wait.task_list.next)

in complete_and_exit(). I don't know if it is the right way to do it,
but at least the garbage gollection thread stopped crashing.

Jarkko Lavinen
