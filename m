Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EU5q3-0002Sg-F6
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 18:10:24 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9OHA9KS032046
	for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2005 13:10:09 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9OHA9fw110004
	for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2005 13:10:09 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j9OH9w9L020989
	for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2005 13:09:59 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
	<6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 24 Oct 2005 12:09:49 -0500
Message-Id: <1130173789.15275.1.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-10-20 at 10:38 -0700, Jared Hulbert wrote:
> > Could you double check with other flash model docs please?
> >
> > I don't have the Intel M18/M30 documentation handy but I think the
> > current code is right in that case.
> 
> P and M do differ in this spec.  Sigh.  We'll get a patch out today or tomorrow.

Any updates on this?  I'm assuming a cfi fixup function will be needed,
but I'm not sure exactly how to do it.

thx,
josh
