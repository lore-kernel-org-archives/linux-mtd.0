Date: Thu, 19 Jun 2008 04:04:18 -0700
From: Greg KH <greg@kroah.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [stable] [PATCH] jedec_probe: Fix SST 16-bit chip detection
Message-ID: <20080619110418.GB27196@kroah.com>
References: <20080619.163648.262833678.nemoto@toshiba-tops.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080619.163648.262833678.nemoto@toshiba-tops.co.jp>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 19, 2008 at 04:36:48PM +0900, Atsushi Nemoto wrote:
> The unlock_addr rework in kernel 2.6.25 breaks 16-bit SST chips.  SST
> 39LF160 and SST 39VF1601 are both 16-bit only chip and new uaddr value
> is not correct for them.  Add MTD_UADDR_0xAAAA_0x5555 for those chips.
> Tested with SST 39VF1601 chip.
> 
> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

In the future, if you want something to go into the stable tree, just
add:
	cc: stable <stable@kernel.org>
to the signed-off-by area of the patch and we will be automatically
notifed when it goes into Linus's tree and will then add it to the
-stable tree.

Otherwise it's a pain to try to track when a patch goes into mainline.

Can you notify us when this patch is accepted?

thanks,

greg k-h
