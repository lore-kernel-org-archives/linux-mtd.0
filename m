Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwRy4-0005vb-Ne
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 20:18:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xiaogeng_jin@agilent.com
In-Reply-To: <3236F92B82933347807DFF6A8BA632802133BA@wcosmb04.cos.agilent.com>
References: 
	 <3236F92B82933347807DFF6A8BA632802133BA@wcosmb04.cos.agilent.com>
Content-Type: text/plain
Message-Id: <1077826725.11584.1071.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 26 Feb 2004 20:18:45 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Can the current mtd suport two different types of flash on one
	board?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-26 at 12:38 -0700, xiaogeng_jin@agilent.com wrote:
> Hi,
> 
> I'd like to know if the current mtd is capable of handling different
> types of flash devices on a single board, for example, device with
> different buswidth, device width and interleave?

Yes, it's capable of this.

> I'm just browsing the source of cfi_cmdset_0002.c and getting some
> preliminary impression that it cannot support such configuration. Am I
> right?

All the details about bus/device width and interleave are abstracted out
in order to prevent us from having to write the same read/write/erase
routines 17 times. It's convoluted, but it works.

See the implementation, for example, of cfi_gen_send_cmd() and how it
works according to the variables you named -- and how if you enabled
advanced configuration and only one interleave/devsize/bussize all the
conditionals go away and you're left with optimal code.

We have Nico to thank for that. It makes my head hurt at times, but it's
very clever.

-- 
dwmw2
