Received: from tomts25-srv.bellnexxia.net ([209.226.175.188])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HqTg-0008Fi-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 19:34:48 +0100
Date: Tue, 11 Jun 2002 14:34:45 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Matt Vestal <vestal@activmedia.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
In-Reply-To: <Pine.LNX.4.21.0206111354560.31856-100000@server.activmedia.com>
Message-ID: <Pine.LNX.4.44.0206111430260.509-100000@server.superbt.com>
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

Thanks, Matt.  It seems the stripped down version of MTD/DOC2000/NFTL
drivers bdev_diskonchip.c was unable to find an NFTL header in the flash
memory.  The diagnostics from bdev_diskonchip.c should appear earlier when
GRUB is starting.  Unfortunately, those messages are not currently routed
to the serial port.  Does your oard have a video chip?

If not, I think GRUB could be modified to switch to serial port earlier 
based on hard coded menu options.

Ilguiz

On Tue, 11 Jun 2002, Matt Vestal wrote:

> Now, with DOC_DEBUG defined -
> [...]
> open_device(): errnum 21
