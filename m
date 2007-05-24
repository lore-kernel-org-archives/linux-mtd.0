Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hr7sf-0006Zi-KD
	for linux-mtd@lists.infradead.org; Thu, 24 May 2007 08:37:06 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hr7sU-0001C8-9i
	for linux-mtd@lists.infradead.org; Thu, 24 May 2007 09:36:54 +0200
Received: from 82-69-61-204.dsl.in-addr.zen.co.uk ([82.69.61.204])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 May 2007 09:36:54 +0200
Received: from mw_phil by 82-69-61-204.dsl.in-addr.zen.co.uk with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 May 2007 09:36:54 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: jffs2/mtd on flash Spansion S29GL064AR4
Date: Thu, 24 May 2007 07:36:42 +0000 (UTC)
Message-ID: <loom.20070524T093136-704@post.gmane.org>
References: <LOEGJDCFIFDBMCDIAOKDGENPCHAA.teun@adesys.nl>
	<LOEGJDCFIFDBMCDIAOKDMEANCIAA.teun@adesys.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Teun Grinwis <teun <at> adesys.nl> writes:

> 
> Hello All,
> 
> After further investigation, the real problem is a NULL ptr function
> call in kernel/sched.c, see below:
>
> ...snip...
>
> I tried a patch in kernel/sched.c, __wake_up_common:
> ...
>         if( curr->func == NULL || (curr->func(curr, mode, sync, key) &&
>                                    (flags & WQ_FLAG_EXCLUSIVE) &&
>                                    !--nr_exclusive) ) {
>             break;
>         }
> ...
> 
> Now jffs2 can be initialized on our flash S29GL064AR4. Also a test file
> remains
> persistent after re-power our system.
> 
> Is this patch right? My feeling is that something should be done in mtd!
> 
> Thanks for your info,
> 
> Regards
> 
> Teun Grinwis

Well, it's right in that it avoids the crunch of a NULL ptr,
but presumably the logic of the code should never permit
this to happen, so something's wrong somewhere else !

Perhaps as a side issue, drivers ought to include a 'checked' build
setting that effectively does an assertion check on things like
pointers about to be dereferenced, to spot issues during testing.

Regards,
MikeW
