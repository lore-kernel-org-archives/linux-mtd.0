Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlrtE-0002l5-HD
	for linux-mtd@lists.infradead.org; Wed, 28 Jan 2004 15:46:04 +0000
To: Shawn Jin <shawnxtech@yahoo.com>
References: <20040128034734.77883.qmail@web20725.mail.yahoo.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 28 Jan 2004 08:48:18 -0700
In-Reply-To: <20040128034734.77883.qmail@web20725.mail.yahoo.com>
Message-ID: <m3u12g8471.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: 64 bit bus access on a customed MPC8245 board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shawn Jin <shawnxtech@yahoo.com> writes:

> Hi,
> 
> I'm working on a customed MPC8245 board with flash
> chip Am29LV320 and trying to enable MTD driver
> support.

The MPC8245 is an embedded ppc processor.
?? 

I looked and I can't find documentation for that chip.
Is it an atmel one?

Chips with similar part numbers are 8 bit flash.  Atmel
does make a few 16bit flash parts.  And I don't know
if Atmel does cfi?  You may need jedec_probe.
 
> The configuration is 32 bit bus width in each chip
> with 2 chips interleaved. So CONFIG_MTD_CFI_B8 and
> CONFIG_MTD_CFI_I2 are defined.

Ok so you have configured it for 2 8bit chips that are
interleaved to form a 16bit path.

> MPC8245 requires the following memory mapping:
> bank 0: 0xFF800000 - 0xFFFFFFFF
> bank 1: 0xFF000000 - 0xFF7FFFFF
> 
> I noticed that FPU must be enabled for 64-bit
> read/write from/to flash.

But that is not even interesting if you are only 16bits wide.

> I use read64() and write64() functions in the
> attachment, which are copied from sbc8240.c. However
> no chip can be found. Any suggestions? Thank you very
> much.

I suggest you focus on read16()/write16().

Eric
