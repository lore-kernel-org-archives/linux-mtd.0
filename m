Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMWN3-0004mM-Gq
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 21:30:02 +0000
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1SLTbdq006801
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 16:29:37 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1SLTbvt513576
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 14:29:37 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1SLTbA1004856
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 14:29:37 -0700
Subject: Re: JFFS2 Max Flash Size?
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F17845EFDA5B@orsmsx413.amr.corp.intel.com>
References: <B1EDF20A6EAAD74EA65E46F774F17845EFDA5B@orsmsx413.amr.corp.intel.com>
Content-Type: text/plain
Date: Wed, 28 Feb 2007 15:29:36 -0600
Message-Id: <1172698176.17795.4.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-28 at 13:17 -0800, Johnson, Charles F wrote:
> I've heard there is scalability issues with JFFS2 with large flash
> sizes.   So my question on this list is for a NAND flash design, is
> there a maximum size that JFFS2 can handle ??  4GB, 8GB, ????

4GiB is the maximum that JFFS2 can address given that it uses uint32_t
variables for offsets, etc.

You'll likely hit scaling issues long before that though.  Depending on
various factors, a 1GiB image can be slow.

josh
