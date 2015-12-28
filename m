Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDh6a-00079Z-Sk
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 23:21:33 +0000
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann
 <arnd@arndb.de>, Brian Norris <computersforpeace@gmail.com>
From: Scott Branden <sbranden@broadcom.com>
Subject: Adding OTP-only device to MTD or CHAR subsystem?
Message-ID: <5681C3E4.4090506@broadcom.com>
Date: Mon, 28 Dec 2015 15:21:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greg/Brian/Arnd,

We have OTP device drivers for accessing OTP memory in our SoCs.

I looking for the right place and model to place such OTP device drivers.

1) Should we follow the bfin-otp model in drivers/char?  This doesn't 
seem like the right place to put it although following the bfin example 
is quite simple to implement.  We actually had a custom set of Ioctl's 
that I changed to use the standard file access model used by the bfin 
driver.  But a custom util is still needed to issue an OTPLOCK command. 
  I'm guess mtd-utils has such abilities (or should).

2) Instead, should we start adding OTP-only drivers into the MTD 
subsystem?  Onenand and CFI based MTD devices already have OTP 
programmable regions.  If we created a new OTP device type in the MTD 
subsystem this looks like a good thing to do.  mtd-utils could/should be 
used to access the OTP device then along with standard fileio operations.

3) Or some other suggestion of where to place OTP device drivers?

Regards,
  Scott
