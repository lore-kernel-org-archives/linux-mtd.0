Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fOQI-0003UL-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 16:56:22 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202251744570.12881-200000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202251744570.12881-200000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: Adam Wozniak <awozniak@comdev.cc>, linux-mtd@lists.infradead.org,
    Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Feb 2002 17:07:37 +0000
Message-ID: <22009.1014656857@redhat.com>
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

rob@sysgo.de said:
>  [David, OK to apply this ?] 

I'd rather it was done in the map driver's set_vpp function itself. 
Sometimes you have more than one map driver, because you have different 
regions of flash - but they all share the same Vpp control. In which case 
you need to do the counting in the map driver anyway. 


>  I looked into this a little further: it seems that the erase
> functions in cfi_cmdset_000?.c and amd_flash.c temporarily release the
> chip->mutex while VPP is on. Won't that allow other threads to get
> hold of the mutex and fiddle with VPP, possibly turning it off ? 

I see the possibility, but surely that would only _actually_ happen if we 
started to support writes during erase suspend? Otherwise, the only thing 
that should happen during an erase is a _read_, which doesn't set and clear 
vpp.


--
dwmw2
