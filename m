Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13hgyl-0006eV-00
	for mtd-list@infradead.org; Sat, 07 Oct 2000 00:32:39 +0100
Message-ID: <39DE61C0.48806B95@mvista.com>
Date: Fri, 06 Oct 2000 16:35:28 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: cfi_amdext_sync, cfi_intelext_sync
References: <E13hCjo-0006JB-00@infradead.org> <6948.970759350@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Found a bug in cfi_cmdset_0001.c and  cfi_cmdset_0002.c in functions
cfi_intelext_sync and cfi_amdext_sync respectively.  The call to
remove_wait_queue is missing after the "add_wait_queue;spin_unlock_bh;
schedule"   sequence in the default case.

The gory details:   Our test caused erase and sync to be called
concurrently.    The sync code sees the chip state as FL_ERASING  and
correctly calls add_wait_queue.  The problem is that remove_wait_queue is
never called after the schedule.  This causes  wait's task_list to be added
to chip->wq's task_list several times which results in an incorrect circular
list.   The final outcome is a hang when the erase logic calls wake_up which
ends up in an infinite loop running through chip->wq's task_list.  A nice
touch is that we are in spin_lock_bh so the system hangs as well.

If you agree, should I check in the fix?

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
