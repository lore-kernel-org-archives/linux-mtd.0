Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DqReC-0006Xr-0V
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2005 04:22:22 -0400
Received: from dsl-082-082-155-079.arcor-ip.net ([82.82.155.79]:3097
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1DqRhi-0006sO-KD
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2005 10:25:54 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1DqRe4-0003hK-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2005 10:22:08 +0200
Date: Thu, 7 Jul 2005 10:22:08 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050707082208.GA13211@zappa>
References: <20050706144545.GA11447@zappa> <42CC0A6E.9090704@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42CC0A6E.9090704@mvista.com>
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Todd Poynor <tpoynor@mvista.com> [Wed, Jul 06, 2005 at 09:44:30AM -0700]:

> Do you have a diff of drivers/mtd/chips/cfi_cmdset_0001.c between the 
> two versions?  I'll guess a change was made that didn't wrap something 
> in the xip disable/check for pending interrupts stuff.

Stupid stupid me! In order to integrate the intel K3 unlocking I
inserted a dozen of printk commands which of couse broke XIP!

*ARGH* How stupid, I simply forgot.

Now I removed them and XIP seems to be fine again.
Now I have to fix sync burst again and then the intel K3 unlocking is
scheduled :)

Regards, Konsti
