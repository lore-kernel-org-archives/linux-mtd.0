Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1ImgFE-0000GN-6y
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 21:50:22 -0400
Date: Tue, 30 Oct 2007 02:49:34 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Valentine Barshak <vbarshak@ru.mvista.com>
Subject: Re: [PATCH 0/3] Add device-tree aware NDFC driver
In-Reply-To: <20071029201738.GA2022@ru.mvista.com>
Message-ID: <alpine.LFD.0.9999.0710300235580.3186@localhost.localdomain>
References: <20071029201738.GA2022@ru.mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linuxppc-dev@ozlabs.org, sr@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 Oct 2007, Valentine Barshak wrote:

> This adds a device-tree aware PowerPC 44x NanD Flash Controller driver
> The code is based on the original NDFC driver by Thomas Gleixner, but
> since it's been changed much and has initialization/clean-up completely
> reworked it's been put into a separate ndfc_of.c file. This version
> supports both separate mtd devices on each chip attached to NDFC banks and
> single mtd device spread across identical chips (not using mtdconcat) as well.
> The choice is selected with device tree settings. This has been tested
> on PowerPC 440EPx Sequoia board.
> Any comments are greatly appreciated.

Did I express myself not clear enough in my first reply or is this
just a repeated epiphany in my inbox ? 

You got plenty of comments to your patches, but you decided to ignore
them silently.

Darn, fix it the right way once and forever and please don't try to
tell me another heartrending "why I did it my way" story.

This all can be done with a nice series of incremental patches
including a fixup to the existing users.

We have enough dump and run shit in the kernel already.

No thanks,

   tglx
