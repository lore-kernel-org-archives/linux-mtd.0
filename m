Received: from [208.178.55.66] (helo=server.activmedia.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HsVL-0008OF-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 21:44:39 +0100
Date: Tue, 11 Jun 2002 16:44:08 -0400 (EDT)
From: Matt Vestal <vestal@activmedia.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
In-Reply-To: <Pine.LNX.4.44.0206111430260.509-100000@server.superbt.com>
Message-ID: <Pine.LNX.4.21.0206111548140.31856-100000@server.activmedia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Ilguiz, it turns out that BDEV_DISKONCHIP was never getting defined!  
I thought the DOC stuff was enabled because root (dc0) started returning
"Selected disk does not exist", rather than the previous string "Error
23: Error while parsing number".  Anyways, I added -DBDEV_DISKONCHIP to
stage2/shared.h and voila!

I think I'm all set now.  Thanks for the help,

Matt


On Tue, 11 Jun 2002, Ilguiz Latypov wrote:

> 
> Thanks, Matt.  It seems the stripped down version of MTD/DOC2000/NFTL
> drivers bdev_diskonchip.c was unable to find an NFTL header in the flash
> memory.  The diagnostics from bdev_diskonchip.c should appear earlier when
> GRUB is starting.  Unfortunately, those messages are not currently routed
> to the serial port.  Does your oard have a video chip?
> 
> If not, I think GRUB could be modified to switch to serial port earlier 
> based on hard coded menu options.
> 
> Ilguiz
> 
> On Tue, 11 Jun 2002, Matt Vestal wrote:
> 
> > Now, with DOC_DEBUG defined -
> > [...]
> > open_device(): errnum 21
> 
> 
