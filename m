Received: from mtiwmhc12.worldnet.att.net ([204.127.131.116])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KbkGr-0003Yq-Kr
	for linux-mtd@lists.infradead.org; Fri, 05 Sep 2008 22:59:17 +0000
From: Jeff Sutherland <jeffs@fomsystems.com>
To: Vernon Sauder <vernoninhand@gmail.com>
Subject: Re: mtd concatenate support for pxa2xx-flash mapping driver
Date: Fri, 5 Sep 2008 18:59:02 -0400
References: <200809041359.33626.jeffs@fomsystems.com>
	<48C0B79E.2020909@gmail.com>
In-Reply-To: <48C0B79E.2020909@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200809051859.03206.jeffs@fomsystems.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 05 September 2008, apparently Vernon Sauder wrote:
> Jeff Sutherland wrote:
> > I'm working currently in 2.6.25.  Is anyone working on mtd concatenation
> > support for this particular driver?  $customer selected 64Mbyte NOR flash
> > chip for root filesystem, but in reality it is two 32Mb die in one
> > package, and I need one mtd partition > 32mb after taking care of
> > bootloader, environment, and kernel.
>
> Is this the P30 strataflash 48F4400 variety? I created a custom patch
> for that but converted to using the phymap-flash support from 2.6.25.1
> and backported it to 2.6.24.4. I use the command line parsing.

I got this sorted out today.  It turns out the physmap-flash driver will fail 
silently if you specify a command line partition that spans twom chips.  In 
other words, I had specified in the kernel config the total size of installed 
flash, but had left unchecked config_mtd_concat.  On startup physmap-flash 
would correctly identify both chips inside the 48F4400 part, and even let me 
make a partition (passed in from the kernel command line) that spanned the 
boundary between chips.  But jffs2 had a cow with the smaller erase blocks at 
the 32m boundary.  Simply turning on CONFIG_MTD_CONCAT solved all the 
problems, sigh...

Regards,
-Jeff
