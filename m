Received: from nm9.bullet.mail.ne1.yahoo.com ([98.138.90.72])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKWvg-00030v-E0
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 13:59:38 +0000
Subject: Re: [PATCH] Renaming 'struct flash_platform_data' into 'struct
	spi_flash_platform_data' in include/linux/spi/flash.h
From: David Brownell <david-b@pacbell.net>
To: Alexis RODET <alexis.rodet@bvs-tech.com>
In-Reply-To: <4CEA3EAE.4080700@bvs-tech.com>
References: <20101117160514.GA5308@n2100.arm.linux.org.uk>
	<4CE6B27D.2000909@bvs-tech.com> <20101121044720.GA6088@tarshish>
	<4CEA3EAE.4080700@bvs-tech.com>
Content-Type: text/plain; charset="ISO-8859-1"
Date: Mon, 22 Nov 2010 05:59:29 -0800
Message-ID: <1290434369.2529.38.camel@helium>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: spi-devel-general@lists.sourceforge.net, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-11-22 at 10:58 +0100, Alexis RODET wrote:
> Hello,
> 
>  there is a problem with the double
> definition of 'struct flash_platform_data' that are incompatible:
> 
> in arch/arm/include/asm/mach/flash.h:
> in include/linux/spi/flash.h:

> 
> 
> Both headers are included in a number of machines or driver.

And this patch doesn't touch machine or driver code, so it's incomplete.

ISTR the last time this issue was raised, a similar incomplete patch was
proposed.

How about a patch that does the full rename??

- Dave
