Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15A4IS-0002UC-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 07:38:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B26DF7F.F9EE6185@sun.com> 
References: <3B26DF7F.F9EE6185@sun.com> 
To: Tim Hockin <thockin@sun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: how to get MTD support - need expert input 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 07:43:52 +0100
Message-ID: <25883.992414632@redhat.com>
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

thockin@sun.com said:
>  What is the best way for me get full support?  Apparently all the
> JEDEC support in 2.4.5 is broken.

Don't even look at the MTD support in 2.4.5. Use 2.4.6-pre3 or later.
There should be something in that which should drive the chip - out of the 
jedec.c code, the amd_flash.c code and the hack which detects such flash 
chips and uses the CFI driver backend.

If the chips are different you'll need to register them in separate 'map' 
drivers - we don't currently support having different chips in the same 
mapping, although that's relatively easily fixable if it's absolutely 
necessary.

Take a look a drivers/mtd/octagon-5066.c for inspiration. Get your mapping 
driver working with the map_rom chip driver first and then we can worry 
about the flash in it.

What flash chips are you likely to be using?

--
dwmw2
