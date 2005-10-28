Received: from over.ny.us.ibm.com ([32.97.182.150] helo=pokfb.esmtp.ibm.com)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EVc7c-0003Dc-Kq
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 22:50:49 +0100
Received: from e31.co.us.ibm.com (e31.boulder.ibm.com [9.17.249.41])
	by pokfb.esmtp.ibm.com (8.12.11/8.12.11) with ESMTP id j9SLoYp8029949
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 17:50:35 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9SLoM1t000612
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 17:50:22 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9SLpMEf537494
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 15:51:22 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j9SLoLPY019180
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 15:50:21 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 28 Oct 2005 16:50:20 -0500
Message-Id: <1130536220.3901.5.camel@windu.rchland.ibm.com>
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

On Fri, 2005-10-28 at 17:34 -0400, Nicolas Pitre wrote:
> On Fri, 28 Oct 2005, Josh Boyer wrote:
> 
> > I'll preface this with a disclaimer that we saw this on 2.4, however the
> > same general issue still seems to be present in MTD CVS.
> 
> For 2.6.x? Are you sure?

Apparently not.

> 
> In 2.6 there is no schedule_timeout() anywhere in the MTD code.

Yeah, nevermind.  I forgot that cfi_udelay no longer does that.  In our
kernel, cfi_udelay has:

if (current->need_resched)
	schedule_timeout(us);
else
	udelay(us);

Seems current CVS no longer does that in cfi_udelay.

> 
> > For a fix, we added a conditional reschedule in the loop that calls
> > do_write_buffer in the cfi_intelext_write_buffers function.  This made
> > write times of 256KiB go from 20-50 seconds to 1-6 seconds on average.
> 
> I still can't figure out the linear sequence of events that can lead to 
> the behavior you're seeing.
> 
> Mind re-doing your explanation in pseudocode-like form to help my poor 
> brain please?

I could if you'd like, but since I just realized the code doesn't have
the problem it's probably not worth it.  Sorry for the false alarm.

josh
