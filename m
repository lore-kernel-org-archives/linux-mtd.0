Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDhNN-0003ow-Uz
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 23:38:54 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Scott Branden <sbranden@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Adding OTP-only device to MTD or CHAR subsystem?
Date: Tue, 29 Dec 2015 00:38:21 +0100
Message-ID: <3668194.4jROlECW6L@wuerfel>
In-Reply-To: <5681C3E4.4090506@broadcom.com>
References: <5681C3E4.4090506@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 28 December 2015 15:21:08 Scott Branden wrote:
> Greg/Brian/Arnd,
> 
> We have OTP device drivers for accessing OTP memory in our SoCs.
> 
> I looking for the right place and model to place such OTP device drivers.
> 
> 1) Should we follow the bfin-otp model in drivers/char?  This doesn't 
> seem like the right place to put it although following the bfin example 
> is quite simple to implement.  We actually had a custom set of Ioctl's 
> that I changed to use the standard file access model used by the bfin 
> driver.  But a custom util is still needed to issue an OTPLOCK command. 
>   I'm guess mtd-utils has such abilities (or should).
> 
> 2) Instead, should we start adding OTP-only drivers into the MTD 
> subsystem?  Onenand and CFI based MTD devices already have OTP 
> programmable regions.  If we created a new OTP device type in the MTD 
> subsystem this looks like a good thing to do.  mtd-utils could/should be 
> used to access the OTP device then along with standard fileio operations.
> 
> 3) Or some other suggestion of where to place OTP device drivers?

I think drivers/nvmem is now the right place for this.

	Arnd
