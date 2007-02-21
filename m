Received: from e31.co.us.ibm.com ([32.97.110.149])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJtPa-0005ga-Ba
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 10:29:47 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1LFTbhV003879
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 10:29:37 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1LFTbmI510906
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 08:29:37 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1LFTbkB019567
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 08:29:37 -0700
Subject: Re: Typical bad block counts
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Dave Kelly <dkelly@eoncc.com>
In-Reply-To: <B569801144262942AF60C398F8520878E66CD4@ken-exchange.EONCC.COM>
References: <B569801144262942AF60C398F8520878E66CD4@ken-exchange.EONCC.COM>
Content-Type: text/plain
Date: Wed, 21 Feb 2007 09:30:40 -0600
Message-Id: <1172071840.24204.171.camel@zod.rchland.ibm.com>
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

On Wed, 2007-02-21 at 10:15 -0500, Dave Kelly wrote:
> On a 1Gbit single level nand (ST-micro), I have 10 chips all with less
> than 6 blocks that are bad originally, a few with none. 
> 
> The chips all bit flip excessively in a few blocks.
> 
> I am suspicious that somebody erased the original marks. The few blocks
> with 0 for the bad block mark all are stuck on 0 for the entire block,
> so could never have been erased anyway.
> 
> What is a reasonable number for bad blocks on this size chip as it 
> arrives from the mfg?

The datasheet for those chips says up to 20 blocks can be bad.  That
includes both Bad blocks at MFG time, and bad blocks that can develop
later on.

josh
