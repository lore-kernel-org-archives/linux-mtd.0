Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy9tP-00014B-Gs
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 11:01:59 -0400
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR001.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IKC00FQDF2C64@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 11:01:24 -0400 (EDT)
Date: Thu, 28 Jul 2005 11:01:24 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20050728121746.GA28368@zappa>
To: Konstantin Kletschke <lists@ku-gbr.de>
Message-id: <Pine.LNX.4.63.0507281100060.21762@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20050706144545.GA11447@zappa> <20050728121746.GA28368@zappa>
Cc: linux-mtd@lists.infradead.org
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 Jul 2005, Konstantin Kletschke wrote:

> * Konstantin Kletschke <lists@ku-gbr.de> [Wed, Jul 06, 2005 at 04:45:45PM +0200]:
> 
> > I had XIP in linux-2.6.11 running very well.
> 
> Meanwhile I found out a solution.
> I switched off CONFIG_FPE_NWFPE=y which the XIP System seems to depend
> on!

It sure doesn't.

Something else must be going on.


Nicolas
