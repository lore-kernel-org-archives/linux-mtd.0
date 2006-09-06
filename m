Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GL0aH-0001Ti-1E
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 17:49:09 +0100
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J56006PUJVDJKO6@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 12:45:14 -0400 (EDT)
Date: Wed, 06 Sep 2006 12:45:13 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: Static partitions
In-reply-to: <44FEE74B.3040907@redfish-group.com>
To: Justin Clacherty <justin@redfish-group.com>
Message-id: <Pine.LNX.4.64.0609061238340.18635@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <44FA57FD.8070003@redfish-group.com>
	<44FEE74B.3040907@redfish-group.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 7 Sep 2006, Justin Clacherty wrote:

> Justin Clacherty wrote:
> > Hi,
> >
> > I've managed to get mtd working on my PXA270 board.  I've used the 
> > mainstone port as a template for my board port and was wondering why the 
> > static partitions need to be defined twice.  Mainstone has it defined in 
> > arch/arm/mach-pxa/mainstone.c and in drivers/mt d/maps/mainstone-flash.c.
> >
> > Regards,
> > Justin.
> >   
> 
> Asking again due to lack of interest :)
> 
> Nicolas, you wouldn't happen to know the answer to this would you?

There was a patch in the CVS to remove any partition definitions from 
mainstone-flash.c and lubbock-flash.c, merge those two into a generic 
pxa-flash.c and have it get the partition information in a generic way 
from each board specific file.

The board specific file part is in mainline now.  Somehow the other part 
hasn't been carried over to the MTD GIT tree yet.


Nicolas
