Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198GKh-0002sy-Fb
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 10:14:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Sid Gluckman <sgluckman@omnitech.com>
In-Reply-To: <OOEOKBMECIFAEPIMFOGIIEEBCBAA.sgluckman@omnitech.com>
References: <OOEOKBMECIFAEPIMFOGIIEEBCBAA.sgluckman@omnitech.com>
Message-Id: <1051089275.1989.25.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 23 Apr 2003 10:14:35 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD on a USB SmartMedai Reader
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-04-21 at 18:00, Sid Gluckman wrote:
> Hello,
> 
> I want to access a SmartMedia card on a USB adapter with JFFS2 filesystem.
> The USB reader is recognized fine and seems to detect the card correctly.
> My question is how can I direct the MTD subsystem to use the USB adapter?

I suspect that you don't. Although SmartMedia is basically just NAND
flash, the USB 'cardreader' will probably be hiding all that from you
and presenting itself USB mass storage device. Turn on CONFIG_SCSI and
CONFIG_USB_STORAGE.


-- 
dwmw2
