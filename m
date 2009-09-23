Subject: Re: [PATCH v3] mtd/maps: gpio-addr-flash: new driver for GPIO
	assisted flash addressing
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1253681321-24600-1-git-send-email-vapier@gentoo.org>
References: <1244033509-31586-1-git-send-email-vapier@gentoo.org>
	<1253681321-24600-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain
Date: Wed, 23 Sep 2009 00:16:50 -0700
Message-Id: <1253690210.4170.618.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-09-23 at 00:48 -0400, Mike Frysinger wrote:
> 
> +       depends on GENERIC_GPIO || GPIOLIB

That still isn't right -- the failing case for me was when GENERIC_GPIO
was set but _not_ GPIOLIB.

I'll accept an answer of "that's because x86 gpio support is broken",
but you do have to handle the whining from the 'make randconfig' folks
for me :)

And please can you make it an incremental patch against what's in the
mtd-2.6.git tree (which I've already asked Linus to pull).

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
