Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nkdn2-0004jl-Rl
	for linux-mtd@lists.infradead.org; Thu, 25 Feb 2010 13:30:09 +0000
Date: Thu, 25 Feb 2010 13:25:43 +0000
From: Russell King <rmk@arm.linux.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: mtd/maps/ceiva.c: possibly uninitialised local variable nr
Message-ID: <20100225132543.GA27325@flint.arm.linux.org.uk>
References: <BLU108-W25DE0DC220AD6F99A8C5879C580@phx.gbl>
	<1267102224.30247.6304.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1267102224.30247.6304.camel@macbook.infradead.org>
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, d binderman <dcb314@hotmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 25, 2010 at 12:50:24PM +0000, David Woodhouse wrote:
> On Mon, 2010-02-01 at 10:26 +0000, d binderman wrote:
> > There is no code to cope with the case that function
> > machine_is_ceiva() returns 0 or that CONFIG_ARCH_CEIVA is undefined.
> 
> CONFIG_ARCH_CEIVA can never be undefined -- this driver depends on
> ARCH_CEIVA in Kconfig. I don't quite understand why it's littered with
> the ifdefs. Russell?

Me neither.  Better ask 'Rob Scott' who appears to be the person
who created this in the first place.  Whether he's still interested
in it, or even doing Linux stuff I've no idea.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
