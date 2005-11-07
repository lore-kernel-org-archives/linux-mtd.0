Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZENj-0006wB-3S
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 21:18:24 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id jA7LIFCv031330
	for <linux-mtd@lists.infradead.org>; Mon, 7 Nov 2005 16:18:15 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	jA7LIFqu098056
	for <linux-mtd@lists.infradead.org>; Mon, 7 Nov 2005 16:18:15 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id jA7LIFaE014546
	for <linux-mtd@lists.infradead.org>; Mon, 7 Nov 2005 16:18:15 -0500
Received: from windu.rchland.ibm.com (windu.rchland.ibm.com [9.10.78.29])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id jA7LIFdb014534
	for <linux-mtd@lists.infradead.org>; Mon, 7 Nov 2005 16:18:15 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 07 Nov 2005 15:18:05 -0600
Message-Id: <1131398285.23658.11.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: JFFS2 gc deadlock
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, around line 1210 of gc.c, this comment is present (formatted for
better read-ability):

	/* First, use readpage() to read the appropriate page into the page cache */
	/* Q: What happens if we actually try to GC the _same_ page for which commit_write()
	 *    triggered garbage collection in the first place?
	 * A: I _think_ it's OK. read_cache_page shouldn't deadlock, we'll write out the
	 *    page OK. We'll actually write it out again in commit_write, which is a little
	 *    suboptimal, but at least we're correct.
	 */

Can someone explain to me how read_cache_page won't deadlock in that
case?  From what I can see, it will deadlock quite easily.  Shouldn't
jffs2_garbage_collect_dnode or an above function check if the page is
being written to already?

I believe I'm currently looking at a failure where this exact thing has
happened.  Basically, it seems to require the filesystem being quite low
on space (as in right on the -ENOSPC threshold) and the writing process
to have invoked a gc pass during it's jffs2_reserve_space call.

josh
