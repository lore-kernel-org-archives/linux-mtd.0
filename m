Subject: Re: [PATCH] [MTD] m25p80: memory accessor interface for SPI MTD driver
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200908031824.01795.david-b@pacbell.net>
References: <1249333325-16750-1-git-send-email-sudhakar.raj@ti.com>
	<200908031824.01795.david-b@pacbell.net>
Content-Type: text/plain
Date: Sat, 19 Sep 2009 11:36:21 -0700
Message-Id: <1253385381.6317.29.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-08-03 at 18:24 -0700, David Brownell wrote:
> 
> If that's going to be possible, shouldn't it work for any
> MTD device?  And the lack of protection bothers me a bit
> more here than with EEPROMs and NVRAM, since it seems kind
> of easy to clobber UBI (or JFFS2 etc) data.  Maybe there
> should be a way to make jus a specific partition available
> this way?

Hrm, I'm unconvinced by the second version of the patch. I don't really
like adding this to the core MTD code, and I particularly dislike the
extra ->setup() method in struct mtd_partition.

Couldn't this be done as a wrapper round MTD devices, set up by the
board driver? Perhaps we could provide a template mtd_macc_{read,write}
function which board drivers can use, but I don't really like the
patches I've seen.

-- 
dwmw2
