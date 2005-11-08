Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZTqZ-0002IU-GE
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 08:49:17 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id jA8DnATh032703
	for <linux-mtd@lists.infradead.org>; Tue, 8 Nov 2005 08:49:10 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	jA8DnARX118866
	for <linux-mtd@lists.infradead.org>; Tue, 8 Nov 2005 08:49:10 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id jA8DnAJG001061
	for <linux-mtd@lists.infradead.org>; Tue, 8 Nov 2005 08:49:10 -0500
Received: from windu.rchland.ibm.com (windu.rchland.ibm.com [9.10.78.141])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id jA8Dn9di000992
	for <linux-mtd@lists.infradead.org>; Tue, 8 Nov 2005 08:49:10 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1131398285.23658.11.camel@windu.rchland.ibm.com>
References: <1131398285.23658.11.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Tue, 08 Nov 2005 07:48:58 -0600
Message-Id: <1131457738.11283.1.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 gc deadlock
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-11-07 at 15:18 -0600, Josh Boyer wrote:
> Ok, around line 1210 of gc.c, this comment is present (formatted for
> better read-ability):
> 
> 	/* First, use readpage() to read the appropriate page into the page cache */
> 	/* Q: What happens if we actually try to GC the _same_ page for which commit_write()
> 	 *    triggered garbage collection in the first place?
> 	 * A: I _think_ it's OK. read_cache_page shouldn't deadlock, we'll write out the
> 	 *    page OK. We'll actually write it out again in commit_write, which is a little
> 	 *    suboptimal, but at least we're correct.
> 	 */
> 
> Can someone explain to me how read_cache_page won't deadlock in that
> case?  From what I can see, it will deadlock quite easily.  Shouldn't
> jffs2_garbage_collect_dnode or an above function check if the page is
> being written to already?

Nevermind, it seems I have some quite old JFFS2 code.  The current CVS
version sets PageUptodate in jffs2_commit_write, which avoids the
deadlock situation.

Thanks for suffering a fool.

josh
