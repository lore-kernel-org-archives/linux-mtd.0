Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18178y-0005RJ-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 16:28:32 +0100
Date: Mon, 14 Oct 2002 17:28:19 +0200
From: Frank Neuber <neuber@convergence.de>
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: Virtual MTD-Device
Message-ID: <20021014152819.GA2482@jupiter>
References: <20021014092738.GA21251@jupiter> <200210141051.g9EApbs20276@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200210141051.g9EApbs20276@dagobert.svc.sysgo.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, Oct 14, 2002 at 12:57:48PM +0200, Robert Kaiser wrote:
> Tach auch,
Ebenso ...

> > Has anyone thought about this problem, maybe there is a ready to run
> > solution :-))
> 
> Yep. Have a look at the MTD concat layer (mtdconcat.c). See the map drivers 
> for the DIL/NetPC (dilnetpc.c) and the SC520 CDP (sc520cdp.c) for examples on 
> how to use this layer. On these two reference platforms, the chips that are 
It seems that is exactly that what I want :-)

> being concatenated happen to have uniform sector sizes, but I did test this 
> stuff in at least one configuration with varying sector sizes. So, this 
> _should_ work out ot the box.
Ahh, interresting. I will check this out and let you know when it works.

Additionally I will add the exact flash configuration to the kernel
command line, so that I can use the same kernel for different flash
placements on the target platform.

Bis dann,
 Frank
-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
