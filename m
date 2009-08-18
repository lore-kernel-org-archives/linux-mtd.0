From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Brownell'" <david-b@pacbell.net>
References: <1249333325-16750-1-git-send-email-sudhakar.raj@ti.com>
	<200908031824.01795.david-b@pacbell.net>
In-Reply-To: <200908031824.01795.david-b@pacbell.net>
Subject: RE: [PATCH] [MTD] m25p80: memory accessor interface for SPI MTD driver
Date: Tue, 18 Aug 2009 12:54:06 +0530
Message-ID: <00d301ca1fd4$df01ded0$9d059c70$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 04, 2009 at 06:54:01, David Brownell wrote:
> On Monday 03 August 2009, Sudhakar Rajashekhara wrote:
> > On TI's da850/omap-l138 EVM, MAC address is stored in SPI flash.
> > This patch implements memory accessor interface for SPI MTD
> > driver which enables the kernel to access flash data.
> 
> If that's going to be possible, shouldn't it work for any
> MTD device?  And the lack of protection bothers me a bit
> more here than with EEPROMs and NVRAM, since it seems kind
> of easy to clobber UBI (or JFFS2 etc) data.  Maybe there
> should be a way to make jus a specific partition available
> this way?
> 

I have submitted the modified version of this patch which
implements the accessor interface in mtdpart.c file so that
it works for any mtd drivers (NAND, NOR, SPI).

Regards, Sudhakar
