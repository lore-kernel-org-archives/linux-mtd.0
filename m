Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D16F9-0004c1-Tb
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 12:12:12 -0500
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR010.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IBY00M5UQG9R4@VL-MO-MR010.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 12:12:09 -0500 (EST)
Date: Tue, 15 Feb 2005 12:12:06 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20050215165048.GE831@synertronixx3>
To: Konstantin Kletschke <lists@ku-gbr.de>
Message-id: <Pine.LNX.4.61.0502151210270.27338@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20050215154819.GB831@synertronixx3>
	<Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
	<20050215165048.GE831@synertronixx3>
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

> You got it!
> 
> Finally I considered the OSCR running at 3.6MHz and did
> 
> #define xip_elapsed_since(x)    (signed)((IMX_TCN(IMX_TIM1_BASE) - (x)) * 28)
> 
> i.e. 112/4. And it runs and does xip and I can write to flash.

Where does that 112/4 come from?


Nicolas
