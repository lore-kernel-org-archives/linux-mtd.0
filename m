Received: from kroah.org ([198.145.64.141] helo=coco.kroah.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OFbrn-0003K2-O4
	for linux-mtd@lists.infradead.org; Fri, 21 May 2010 23:43:00 +0000
Date: Fri, 21 May 2010 16:42:32 -0700
From: Greg KH <greg@kroah.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: Re: [PATCH] pcm551.c: use pci_ids.h defines
Message-ID: <20100521234232.GA31672@kroah.com>
References: <0D753D10438DA54287A00B0270842697636F3238A0@AUSP01VMBX24.collaborationhost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0D753D10438DA54287A00B0270842697636F3238A0@AUSP01VMBX24.collaborationhost.net>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jbarnes@virtuousgeek.org" <jbarnes@virtuousgeek.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 21, 2010 at 06:24:01PM -0500, H Hartley Sweeten wrote:
> Move the DEVICE id to pci_ids.h and then use the VENDOR/DEVICE ids provided
> in pci_ids.h instead of creating local ids.

Did you read the comment at the top of the pci_ids.h file saying not to
do this?  Just use the vendor id that is already in the pci_ids.h file
in the driver, but leave the device id in the driver itself.

thanks,

greg k-h
