Received: from e35.co.us.ibm.com ([32.97.110.153])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZqtN-0001Uk-5a
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 11:30:46 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id k9HFTxhK011828
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 11:29:59 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	k9HFTuHg352946
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 09:29:56 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k9HFTueA015925
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 09:29:56 -0600
Subject: Re: mtd-utils/nandwrite: what if write fails?
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
Content-Type: text/plain
Date: Tue, 17 Oct 2006 10:33:59 -0500
Message-Id: <1161099240.2975.3.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-10-17 at 16:17 +0200, Ricard Wanderlof wrote:
> I have a question regarding writes to NAND flash; for instance, in 
> mtd-utils/nandwrite.c, prior to writing to a block, it is checked so that 
> it isn't bad (using the MEMGETBADBLOCK ioctl). However, what happens if 
> the block goes bad during write? If the pwrite() call which writes out the 
> page data fails, the application says perror() and exits. Shouldn't it 
> mark the block as bad, and re-write the data so far written to the block 
> to the next good block? As I understand it, mtd doesn't mark a block bad, 
> it is up to the application or overlying file system (e.g. JFFS2). So it 
> won't even help to run nandwrite again as the block has not been marked 
> bad.

pwrite can fail because of a transient error.  NAND can get soft bit
flips that can be cleared by erasing the block.  So to mark a block bad
without at least trying to write to it a couple of times seems a bit
drastic.

josh
