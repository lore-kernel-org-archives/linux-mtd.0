Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E5t74-0007EI-ET
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 18:43:56 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j7IMhcwh542206
	for <linux-mtd@lists.infradead.org>; Thu, 18 Aug 2005 18:43:38 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j7IMhEJ7493218
	for <linux-mtd@lists.infradead.org>; Thu, 18 Aug 2005 16:43:14 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j7IMhc37018129
	for <linux-mtd@lists.infradead.org>; Thu, 18 Aug 2005 16:43:38 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <4302572E.1070202@mvista.com>
References: <200508161441.KAA07341@www21.ureach.com>
	<43020232.60908@ru.mvista.com>
	<20050816155703.GA21462@wohnheim.fh-wedel.de>
	<4302173F.10303@mvista.com>
	<430236BF.1050004@netwinder.org>  <4302572E.1070202@mvista.com>
Content-Type: text/plain
Date: Thu, 18 Aug 2005 17:43:21 -0500
Message-Id: <1124405001.17578.1.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel NOR flash(P30) query
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-08-16 at 14:14 -0700, Todd Poynor wrote:
> Ralph Siemsen wrote:
> > Todd Poynor wrote:
> > 
> >> By the way, if anybody has mtd working on the new P30 chips it would 
> >> be good to know; I haven't seen a system with these chips yet.  They 
> >> are CFI 1.4, and some changes for 1.4 were added by Nicolas recently 
> >> to support M18 "Sibley" chips, but not sure if those changes are 
> >> required for P-series chips.  Thankis,
> > 
> > 
> > Are these changes merged into mainline kernel, or only in MTD CVS?  I 
> > may be in a position to test this soon-ish, as we are looking for a 
> > replacement for the now obsoleted J/K strataflash parts and seem to be 
> > headed towards the P30's...
> 
> Pretty sure linux-mtd-only, these came in during the settle down period 
> for 2.6.13 rc's.  The CFI 1.3-based code probably works after a quick 
> adjustment of a revision level check (to ignore new fields at end of 
> vendor-specific extended query table), if you want to try kernel.org, 
> but testing linux-mtd is always better for us here.  Thanks,

For what it's worth, I just changed the checks for version 3 of the
query table to allow a version 4 in the cfi_cmdset_0001.c driver and it
seemed to be working.  I haven't had a chance to test out Nicolas'
changes, but it should work just fine.

josh
