From: David Woodhouse <dwmw2@infradead.org>
To: Cam <camilo@mesias.co.uk>
In-Reply-To: <402A477D.3020701@mesias.co.uk>
References: <402A477D.3020701@mesias.co.uk>
Content-Type: text/plain
Message-Id: <1076513408.21968.423.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Feb 2004 15:30:08 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Intel 28F640 cfi_cmdset_0001 chip is FL_STATUS after MTD_close
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-02-11 at 15:17 +0000, Cam wrote:
> I would have expected the flash to be left in the read array state when 
> not in use.

Why? If we've just finished writing to the device, and we're about to
write to the device again... why change it into read mode?

> Is there a reason why the chip is not left in the read array state after 
> an MTD_close? My first thought is to modify cfi_intelext_sync, called by 
> MTD_close so that the chip is left in the read array state after the 
> sync command, but being a newcomer to this code I might be missing 
> something important.

Mostly if you're going to need this it's because you forgot to wire up
the RESET line to the flash chips properly, and you're already going to
die if the user hits the RESET button at the wrong time, or reboots or
hits SysRq-B, etc. I prefer not to work around this in the generic code,
since it's actually helpful for some people to realise this problem
early on. 

-- 
dwmw2
