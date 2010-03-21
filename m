Subject: Re: [PATCH 01/24] mtd/maps/pismo: remove dangling pointer and a leak
From: David Woodhouse <dwmw2@infradead.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
In-Reply-To: <20100320154113.GB14470@flint.arm.linux.org.uk>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
	<1269094385-16114-2-git-send-email-w.sang@pengutronix.de>
	<20100320145729.GA5399@flint.arm.linux.org.uk>
	<20100320153146.GB5515@pengutronix.de>
	<20100320154113.GB14470@flint.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 21 Mar 2010 08:30:41 +0000
Message-ID: <1269160241.4028.9777.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-03-20 at 15:41 +0000, Russell King wrote:
> 
> Thanks.
> 
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> 
> David, are you going to pick this up? 

http://git.infradead.org/mtd-2.6.git/commitdiff/395b2288

Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
