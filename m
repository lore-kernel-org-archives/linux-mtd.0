Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182DAZ-0003bm-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2002 17:06:43 +0100
Date: Thu, 17 Oct 2002 18:06:35 +0200
From: Frank Neuber <neuber@convergence.de>
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: Virtual MTD-Device
Message-ID: <20021017160635.GA8927@jupiter>
References: <20021014092738.GA21251@jupiter> <200210141051.g9EApbs20276@dagobert.svc.sysgo.de> <20021014152819.GA2482@jupiter>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20021014152819.GA2482@jupiter>
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

On Mon, Oct 14, 2002 at 05:28:19PM +0200, Frank Neuber wrote:
> > > Has anyone thought about this problem, maybe there is a ready to run
> > > solution :-))
> > 
> > Yep. Have a look at the MTD concat layer (mtdconcat.c). See the map drivers 
> > for the DIL/NetPC (dilnetpc.c) and the SC520 CDP (sc520cdp.c) for examples on 
> > how to use this layer. On these two reference platforms, the chips that are 
> It seems that is exactly that what I want :-)
> 
> > being concatenated happen to have uniform sector sizes, but I did test this 
> > stuff in at least one configuration with varying sector sizes. So, this 
> > _should_ work out ot the box.
> Ahh, interresting. I will check this out and let you know when it works.
And it works well, thanks ... great work!
I did a mix between dilnetpc.c and sc520cdp.c because I have two chips
with partitioning information.
It was easy to collect the free space to one mtd into the kernel.

> Additionally I will add the exact flash configuration to the kernel
> command line, so that I can use the same kernel for different flash
> placements on the target platform.
This is the thing I will do next.

Regards,
  Frank
-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
