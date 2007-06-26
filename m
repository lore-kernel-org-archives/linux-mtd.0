Received: from e32.co.us.ibm.com ([32.97.110.150])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3AxK-0007sT-0C
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2007 09:19:43 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.12.11.20060308/8.13.8) with ESMTP id
	l5QDEfe7025444
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2007 09:14:41 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l5QDJdZs171012
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2007 07:19:39 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l5QDJdiL004143
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2007 07:19:39 -0600
Subject: Re: [PATCH] jffs2_gcd_mtd3, Stopping kernel threads timed out
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <200706261506.28737.u.luckas@road.de>
References: <200706141509.50621.u.luckas@road.de>
	<200706191149.44820.u.luckas@road.de>
	<200706261506.28737.u.luckas@road.de>
Content-Type: text/plain
Date: Tue, 26 Jun 2007 08:19:37 -0500
Message-Id: <1182863977.19501.4.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-26 at 15:06 +0200, Uli Luckas wrote:
> On Tuesday, 19. June 2007, Uli Luckas wrote:
> > Hi,
> > is there anything in the way of apllying this patch?
> >
> Please, can someone tell me what it takes to get a jffs2 bug fix into the 
> kernel? Or even reviewed? This patch should even get into 2.6.22. Am I doing 
> something wrong here?

You aren't doing anything wrong.  David is away on business.

The one thing I would hesitate with about your patch is that you've now
broken the existing behavior of the thread in regards to SIGHUP.  You
used to be able to send the threads a SIGHUP and it would do a single
pass.  With your patch, it won't do that unless the thresholds are
right.  Being able to send SIGHUP to force a GC pass is a pretty useful
thing for debugging, etc.

josh
