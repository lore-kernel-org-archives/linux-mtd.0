Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D17OB-0005Pl-U2
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 13:25:36 -0500
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR007.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IBY007WUTUEO2@VL-MO-MR007.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 13:25:26 -0500 (EST)
Date: Tue, 15 Feb 2005 13:25:23 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20050215180809.GA15503@synertronixx3>
To: Konstantin Kletschke <lists@ku-gbr.de>
Message-id: <Pine.LNX.4.61.0502151322230.27338@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20050215154819.GB831@synertronixx3>
	<Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
	<20050215165048.GE831@synertronixx3>
	<Pine.LNX.4.61.0502151210270.27338@localhost.localdomain>
	<20050215180809.GA15503@synertronixx3>
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 Feb 2005, Konstantin Kletschke wrote:

> Am 2005-02-15 12:12 -0500 schrieb Nicolas Pitre:
> 
> > Where does that 112/4 come from?
> 
> OSCR: 3.6MHz
> i.MX Timer: 32kHz
> 
> 3.6/0.032~112
> 
> OSCR/4 == i.MX Timer*(112/4)
> 
> There I got my 28 from :)

Please re-read my previous email discussing implementation of 
xip_elapsed_since() again, and re-read it until it's obvious to you why 
I'm so insisting.

The SA11x0/PXA2xx implementation is an _example_ not a _reference_.


Nicolas
