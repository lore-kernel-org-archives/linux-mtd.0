Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NqkK-0003KI-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 08:37:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <43CB1396676FD4119F03001083FD299401A1C8CB@neptune.kirkland.local> 
References: <43CB1396676FD4119F03001083FD299401A1C8CB@neptune.kirkland.local> 
To: Paul Nash <paulnash@wildseed.com>
Cc: "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Dec 2002 09:07:42 +0000
Message-ID: <1914.1040029662@passion.cambridge.redhat.com>
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

paulnash@wildseed.com said:
> so to really get the RAM reduction benefits of XIP, you'd have to not
> use compression, which means you'd probably need twice as much flash.
> Is that a reasonable conclusion? 

Yep. Especially so for those who sell flash chips, by an amazing coincidence
:)

The power saving point is fair -- flash does take less power than RAM. But
if you're _that_ short of power, you're likely to be using expensive (but
low-power) SRAM, and have the rest of the system so tightly specified that
you'll be more likely to be using something like eCos on it, not Linux.

With the chips available today and in the near future, XIP, at least for a
writable flash chip, makes virtually zero sense on Linux. Anyone who tries
to tell you otherwise is either on crack, trying to sell you something, or
both.

--
dwmw2
