Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKvvW-0002Js-03
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 08:37:06 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200311150109.39539.joshua@joshuawise.com>
References: <200311150109.39539.joshua@joshuawise.com>
Message-Id: <1068885330.29549.9.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 15 Nov 2003 08:35:30 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-11-15 at 01:09 -0500, Joshua Wise wrote:
> However, HP had to throw a twist in - they shifted the address lines over one. 
> A1 on the CPU is connected to A0 on the flash chip, etcetera, so we have to 
> left-shift the unlock addresses.

Surely this affects more than just the unlock addresses? Doesn't it mean
that when reading, each 16-bit word of flash would appear _twice_?

What if you just add the appropriate shift to your map driver?

-- 
dwmw2
