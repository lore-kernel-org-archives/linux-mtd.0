Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DyCnP-0002RZ-HN
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 14:07:55 -0400
Received: from dsl-082-082-158-021.arcor-ip.net ([82.82.158.21]:48043
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1DyCqL-0001iy-9V
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 20:10:54 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1DyCn6-00022g-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 20:07:32 +0200
Date: Thu, 28 Jul 2005 20:07:32 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050728180732.GA7840@zappa>
References: <20050706144545.GA11447@zappa> <20050728121746.GA28368@zappa>
	<Pine.LNX.4.63.0507281100060.21762@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0507281100060.21762@localhost.localdomain>
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Nicolas Pitre <nico@cam.org> [Thu, Jul 28, 2005 at 11:01:24AM -0400]:

> > I switched off CONFIG_FPE_NWFPE=y which the XIP System seems to depend
> > on!
> 
> It sure doesn't.
> 
> Something else must be going on.


Hm.. funny. Beside the trouble with my toolchains the working one
creates definately only a bootable xipuImage if CONFIG_FPE_NWFPE is
enabled.  I wonder myself, why...

I rechecked again now.

Konsti
