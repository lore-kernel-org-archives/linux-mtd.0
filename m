Received: from over.ny.us.ibm.com ([32.97.182.150] helo=pokfb.esmtp.ibm.com)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EVuBz-0007qL-OP
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2005 18:08:33 +0100
Received: from e31.co.us.ibm.com (e31.boulder.ibm.com [9.17.249.41])
	by pokfb.esmtp.ibm.com (8.12.11/8.12.11) with ESMTP id j9TH8QBQ016646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Sat, 29 Oct 2005 13:08:26 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9TH8BvX001409
	for <linux-mtd@lists.infradead.org>; Sat, 29 Oct 2005 13:08:11 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9TH9BlV531506
	for <linux-mtd@lists.infradead.org>; Sat, 29 Oct 2005 11:09:11 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j9TH89Wl006546
	for <linux-mtd@lists.infradead.org>; Sat, 29 Oct 2005 11:08:10 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
	<1130536220.3901.5.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
Content-Type: text/plain
Date: Sat, 29 Oct 2005 12:08:06 -0500
Message-Id: <1130605687.15940.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-10-28 at 18:04 -0400, Nicolas Pitre wrote:
> On Fri, 28 Oct 2005, Josh Boyer wrote:
> 
> > On Fri, 2005-10-28 at 17:34 -0400, Nicolas Pitre wrote:
> > > On Fri, 28 Oct 2005, Josh Boyer wrote:
> > > 
> > > > I'll preface this with a disclaimer that we saw this on 2.4, however the
> > > > same general issue still seems to be present in MTD CVS.
> > > 
> > > For 2.6.x? Are you sure?
> > 
> > Apparently not.
> > 
> > > 
> > > In 2.6 there is no schedule_timeout() anywhere in the MTD code.
> > 
> > Yeah, nevermind.  I forgot that cfi_udelay no longer does that.  In our
> > kernel, cfi_udelay has:
> > 
> > if (current->need_resched)
> > 	schedule_timeout(us);
> > else
> > 	udelay(us);
> 
> But current code has almost same behavior:
> 
>         if (us >= 1000) {
>                 msleep((us+999)/1000);
>         } else {
>                 udelay(us);
>                 cond_resched();
>         }
> 
> And therefore I wonder if what you saw could occur with that version as 
> well.
> 

Hm.. probably.  I need more coffee and time to dig into stuff.  I'll
post a more detailed evaluation on Monday.

josh
