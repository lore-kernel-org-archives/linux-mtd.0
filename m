Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJtuZ-0003Gi-Mf
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 16:01:48 +0000
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1LG1W85032703
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 11:01:32 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1LG1W53548942
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 09:01:32 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1LG1WCK013850
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 09:01:32 -0700
Subject: RE: Typical bad block counts
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Dave Kelly <dkelly@eoncc.com>
In-Reply-To: <B569801144262942AF60C398F8520878E66CF6@ken-exchange.EONCC.COM>
References: <B569801144262942AF60C398F8520878E66CF6@ken-exchange.EONCC.COM>
Content-Type: text/plain
Date: Wed, 21 Feb 2007 10:02:34 -0600
Message-Id: <1172073754.24204.175.camel@zod.rchland.ibm.com>
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

On Wed, 2007-02-21 at 10:44 -0500, Dave Kelly wrote:
> >The datasheet for those chips says up to 20 blocks can be bad.  That
> >includes both Bad blocks at MFG time, and bad blocks that can develop
> >later on.
> 
> No, this is the small block devices for which the max number
> of bad blocks is 160, per the datasheet (NAND01G-A).

Ah, sorry.  Was looking at the large block datasheet.

> My question though is the typical number of initial bad blocks,
> not the max. allowed. No MFG seams to discuss this.

Probably because 1) there isn't a typical number as it varies from
product lot to product lot and 2) nobody has bothered to try and track
it anywhere for the devices they've received.

josh
