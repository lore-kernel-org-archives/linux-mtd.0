Subject: Re: [PATCH] [2.6.23] nand_flash_dev - add manufacturer ID
From: David Woodhouse <dwmw2@infradead.org>
To: "Egor N. Martovetsky" <egor@pasemi.com>
In-Reply-To: <468D2DF8.4050609@pasemi.com>
References: <200707032354.l63Ns7gh010492@escobita.pasemi.com>
	<1183507424.29081.73.camel@shinybook.infradead.org>
	<1183528554.3291.60.camel@chaos>  <468D2DF8.4050609@pasemi.com>
Content-Type: text/plain
Date: Thu, 05 Jul 2007 14:03:57 -0400
Message-Id: <1183658637.2756.9.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: olof@lixom.net, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-07-05 at 10:44 -0700, Egor N. Martovetsky wrote:
> Right now, there is no way to uniquely identify the device and assign
> options to it.  I saw that as a potential future problem.  Instead of
> adding code to nand_get_flash_type() to special treat our device, I
> thought it would be better to provide a general mechanism, which can
> be used to prevent this in the future.  This only affects the flashes
> that need to be special cased.  For the rest of them, manufacturer ID
> is not specified and the match occurs purely on Device ID - as
> before. 

Yeah, I can see the sense in what you're saying. I'm dubious about
having to duplicate various chip idents just to give separate options
though, when a single entry in the table along with some
manufacturer-specific code to mask out/in certain features would do the
same thing.

-- 
dwmw2
