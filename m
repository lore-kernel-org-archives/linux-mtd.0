Received: from e36.co.us.ibm.com ([32.97.110.154])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GY1Yd-0005ko-3v
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 10:29:21 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e36.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id k9CET8os001277
	for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2006 10:29:08 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	k9CET8dJ295224
	for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2006 08:29:08 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k9CET8Cs019058
	for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2006 08:29:08 -0600
Subject: Re: Slow JFFS2 as root file system
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: z l <zql@glomationinc.com>
In-Reply-To: <20061012141726.19158.qmail@web202.biz.mail.re2.yahoo.com>
References: <20061012141726.19158.qmail@web202.biz.mail.re2.yahoo.com>
Content-Type: text/plain
Date: Thu, 12 Oct 2006 09:33:06 -0500
Message-Id: <1160663586.4043.18.camel@zod.rchland.ibm.com>
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

On Thu, 2006-10-12 at 07:17 -0700, z l wrote:
> Linux 2.6.18 running on EP9302 ARM processor based
> board booting with JFFS2 128MB NAND FLASH as root file
> system takes 3 - 4 minutes to get root file system
> mounted.  Is this typical for JFFS2?  Anyway to
> shorten the time?

Perhaps take a look at the CONFIG_JFFS2_SUMMARY option in the kernel,
and the corresponding sumtool in mtd-utils.  That will help speed up
mount times at least.

josh
