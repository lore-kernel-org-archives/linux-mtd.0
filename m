Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3dl9-0000QM-4K
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 16:19:11 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUQ008VMA5Z69@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 17:08:24 +0100 (MET)
Date: Wed, 17 Mar 2004 17:05:28 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
To: llandre <r&d@wawnet.biz>, linux-mtd@lists.infradead.org
Message-id: <200403171705.28040.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
cc: Andrea Scian <andrea.scian@wawnet.biz>
cc: Matteo Bortolin <matteo.bortolin@wawnet.biz>
Subject: Re: Bug in nand_select_chip?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 17 March 2004 16:44, llandre wrote:
> Hi,

The calling functions were changed, so there is no problem at all.

> The new function, with chip==0, sets the nCE pin high:

Wrong. SETNCE means set nCE active, which sets the physical pin low.
Therefor it is called _n_CE and SET_N_CE.

> 1) Why did the code change this way?

To handle multiple chips.

> 2) I think the best way to overcome the problem is to define a proprietary
> nand_select_chip function
> in the low-level driver and to make the select_chip pointer in the struct
> nand_chip to point to it. Correct?

You need only a seperate select function, if you have non standard hardware. 
The hwcontrol function should be enough adjustment for most boards, where you 
have 1 NAND chip to select.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
