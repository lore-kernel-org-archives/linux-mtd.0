Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Nyiy-0004I1-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 17:08:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0212161215550.25780-100000@xanadu.home> 
References: <Pine.LNX.4.44.0212161215550.25780-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: Wolfgang Denk <wd@denx.de>, Paul Nash <paulnash@wildseed.com>,
    "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Dec 2002 17:38:49 +0000
Message-ID: <3806.1040060329@passion.cambridge.redhat.com>
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

nico@cam.org said:
>  On ARM this has no value since the kernel takes up at most 1 or 2
> page table  entries (1MB section descriptors that is).

But you could still start up quickly from flash without having to memcpy 
the entire kernel into RAM first, then once you're running copy the kernel 
text into RAM and alter the page tables so you're running from the RAM copy 
instead of the flash.

This gives you the fast startup of XIP without the runtime pain of XIP. But 
it's probably overkill.

--
dwmw2
