Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EVTGN-0004do-VE
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 08:23:22 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9SCNDMH021815
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 08:23:13 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9SCNDVd047650
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 08:23:13 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j9SCNCj8007325
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 08:23:13 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0510251629060.5288@localhost.localdomain>
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
	<6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
	<1130173789.15275.1.camel@windu.rchland.ibm.com>
	<6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
	<Pine.LNX.4.64.0510251436590.5288@localhost.localdomain>
	<6934efce0510251302k5621409dt863efdc8f3d36eb1@mail.gmail.com>
	<Pine.LNX.4.64.0510251629060.5288@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 28 Oct 2005 07:23:14 -0500
Message-Id: <1130502194.3775.0.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-10-25 at 16:30 -0400, Nicolas Pitre wrote:
> On Tue, 25 Oct 2005, Jared Hulbert wrote:
> 
> > How's this look?
> 
> Great.  I pushed it to CVS.

You probably don't really care, but the patch is working for me on my
setups.  Thanks for the quick response.

josh
