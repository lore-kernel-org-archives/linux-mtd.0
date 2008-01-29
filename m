Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JK0Xt-0001J8-Ji
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 00:11:23 +0000
Date: Wed, 30 Jan 2008 00:11:04 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Richard Purdie <rpurdie@rpsys.net>
Subject: Re: [RFC PATCH 1/3]] Add mtd panic_write function pointer
Message-ID: <20080129231104.GC32157@lazybastard.org>
References: <1201607964.5017.48.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1201607964.5017.48.camel@localhost.localdomain>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 January 2008 11:59:24 +0000, Richard Purdie wrote:
> 
> MTDs are well suited for logging critical data and the mtdoops driver
> allows kernel panics/oops to be written to flash in a blackbox flight
> recorder fashion allowing better debugging and analysis of crashes.
> 
> Any kernel oops in user context can be easily handled since the kernel
> continues as normal and any queued mtd writes are scheduled. Any kernel
> oops in interrupt context results in a panic and the delayed writes will
> not be scheduled however. The existing mtd->write function cannot be
> called in interrupt context so these messages can never be written to
> flash.
> 
> This patch adds a panic_write function pointer that drivers can
> optionally implement which can be called in interrupt context. It is
> only intended to be called when its known the kernel is about to panic
> and we need to write to succeed. Since the kernel is not going to be
> running for much longer, this function can break locks and delay to
> ensure the write succeeds (but not sleep).

I like the description.  So why is it not part of the patch proper?


Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
