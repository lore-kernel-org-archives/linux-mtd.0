Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDiJ4-0005WD-CN
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 08:48:52 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j89CmXGI011126
	for <linux-mtd@lists.infradead.org>; Fri, 9 Sep 2005 08:48:33 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j89CmXP3098394
	for <linux-mtd@lists.infradead.org>; Fri, 9 Sep 2005 08:48:33 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j89CmXdP009827
	for <linux-mtd@lists.infradead.org>; Fri, 9 Sep 2005 08:48:33 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <43217913.106@inf.u-szeged.hu>
References: <43217913.106@inf.u-szeged.hu>
Content-Type: text/plain
Date: Fri, 09 Sep 2005 07:48:30 -0500
Message-Id: <1126270110.4491.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: hardware
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-09-09 at 13:59 +0200, Ferenc Havasi wrote:
> Dear All,
> 
> Until now we was developed JFFS2 without real flash - only using
> emulators (mtdram and nandsim). Now we decided to buy a real stuff.
> 
> Please suggest us some development board (or similar thing) which have
> good linux and mtd support and uses NAND flash.

The Bamboo board from AMCC has support for it in the mainline kernels
now.  It contains a PPC 440EP processor and two different size Samsung
NAND chips.  It also has some NOR chips on it.

There is an MTD driver for both the NAND and the NOR floating around
somewhere.  I asked the author to send it to the list, but I haven't
seen it yet.

Not sure what your price range is though.  These boards are close to
2000 US dollars if I remember correctly.  They're an overall eval board,
so they come with all kinds of other stuff as well (USB, SATA, ethernet,
etc).

josh
