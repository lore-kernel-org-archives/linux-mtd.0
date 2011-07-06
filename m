Subject: Re: [PATCH V2] MTD: atmel_nand: optimize read/write buffer functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Wed, 06 Jul 2011 09:58:11 +0300
In-Reply-To: <1309789073-14593-1-git-send-email-nicolas.ferre@atmel.com>
References: <1309261856-27402-1-git-send-email-nicolas.ferre@atmel.com>
	<1309789073-14593-1-git-send-email-nicolas.ferre@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309935496.3149.73.camel@sauron>
Mime-Version: 1.0
Cc: hong.xu@atmel.com, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-07-04 at 16:17 +0200, Nicolas Ferre wrote:
> For PIO NAND access functions, we use the features of the SMC:
> - no need to take into account the NAND bus width: SMC will deal with this
> - use of an IO memcpy on the NAND chip-select space is able to generate
>   proper SMC behavior.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
> V2: use of memcpy_fromio/memcpy_toio for proper handling of memory types.

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
