Received: from de01egw02.freescale.net ([192.88.165.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JqZzN-00069r-A3
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 20:30:17 +0000
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by de01egw02.freescale.net (8.12.11/de01egw02) with ESMTP id
	m3SKU5Fe001141 for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 13:30:06 -0700 (MST)
Received: from ld0162-tx32.am.freescale.net (ld0162-tx32.am.freescale.net
	[10.82.19.112])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id m3SKU4Io028164
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 15:30:05 -0500 (CDT)
Date: Mon, 28 Apr 2008 15:30:04 -0500
From: Scott Wood <scottwood@freescale.com>
To: Rune Torgersen <runet@innovsys.com>
Subject: Re: [PATCH 1/2] [MTD] Add support for RAM & ROMmappings in the
	physmap_of MTD driver.
Message-ID: <20080428203004.GC15223@ld0162-tx32.am.freescale.net>
References: <200804251353.13698.laurentp@cse-semaphore.com>
	<DCEAAC0833DD314AB0B58112AD99B93B04512785@ismail.innsys.innovsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCEAAC0833DD314AB0B58112AD99B93B04512785@ismail.innsys.innovsys.com>
Cc: ben@simtec.co.uk, Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	Laurent Pinchart <laurentp@cse-semaphore.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 28, 2008 at 11:26:15AM -0500, Rune Torgersen wrote:
> Examples would be the FCC's on a Freescale PQ2 chip, where they are
> encoded as ethernet controllers. (Thsy could be used as high-speed HDLC
> controllers, ATM controllers and other usages), the SCC ports (as
> serial, they can be used for syncronous serial and HDLC)

But that choice is made by board-level hardware, not purely by software.

-Scott
