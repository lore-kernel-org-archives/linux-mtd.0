Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E3K64-0002Ze-A4
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 21:56:17 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j7BKu4R8025236
	for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2005 16:56:04 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j7BKu4rR224604
	for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2005 16:56:04 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j7BKu4iu021658
	for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2005 16:56:04 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: tglx@linutronix.de
In-Reply-To: <1123793610.23647.73.camel@tglx.tec.linutronix.de>
References: <42FB5E72.2010402@ru.mvista.com> <42FBB3B1.2080609@mvista.com>
	<1123792307.23647.71.camel@tglx.tec.linutronix.de>
	<42FBB9DD.2020907@ru.mvista.com>
	<1123793610.23647.73.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 15:55:44 -0500
Message-Id: <1123793744.4289.0.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 20:53 +0000, Thomas Gleixner wrote:
> On Fri, 2005-08-12 at 00:49 +0400, Vitaly Wool wrote:
> > That will require some extensions to nand_base.c. I'm planning to 
> > provide the corresponding patch shortly, if you don't mind.
> 
> I never have a problem with work which I dont have to do :)

Unless it's broken and you wind up having to support it ;)

josh
