Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xnAv-00043d-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 May 2001 10:56:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <006a01c0d935$338c9840$223975cb@softdqxcunjyu6> 
References: <006a01c0d935$338c9840$223975cb@softdqxcunjyu6> 
To: "Jimmy Brian Christanthio" <jimmy@soft-v.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: nftl 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 May 2001 10:56:14 +0100
Message-ID: <11739.989488574@redhat.com>
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

jimmy@soft-v.com said:
> Our system is the VR4121 using the Intel Strata Flash. If we use your code
> to establish a sector of 1MB as a drive, can we also have XIP on it? 
> That is, can we execute on the flash instead of from the SDRAM?

You cannot use NFTL on that. Technically, you could use FTL, but in some 
countries patents may prevent you from doing so. If you want a writable 
filesystem, JFFS is probably the best bet. 

We don't yet have support for XIP. It would require a special filesystem 
which aligns pages of the files at page-aligned addresses in the flash 
chips. In general, compression is far more useful than XIP, because RAM is 
cheaper than flash, so nobody's yet implemented this.

I started hacking on such an xipfs once. I don't recall how far I got with 
it - you're welcome to a copy of that if you want it, although I suspect 
you'd to better to start with a clean copy of romfs and do it again.

If you require a _writable_ filesystem, it's going to be extremely 
difficult to do XIP.

--
dwmw2
