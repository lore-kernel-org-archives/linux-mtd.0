Subject: Re: [PATCH] mtd/nand: s3c6400 support for s3c2410 driver
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <1244379863-23581-2-git-send-email-jacmet@sunsite.dk>
References: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
	<1244379863-23581-2-git-send-email-jacmet@sunsite.dk>
Content-Type: text/plain
Date: Mon, 08 Jun 2009 12:41:59 +0100
Message-Id: <1244461319.30939.264.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "wookey@wookware.org" <wookey@wookware.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	"ben-linux@fluff.org" <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-06-07 at 06:04 -0700, Peter Korsgaard wrote:
> Add s3c6400 support to the s3c2410 driver. The nand controller in
> the s3c64xx devices is compatible with the one in the s3c2412, so
> simply reuse that code.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  drivers/mtd/nand/Kconfig   |   18 +++++++++---------
>  drivers/mtd/nand/s3c2410.c |    3 +++
>  2 files changed, 12 insertions(+), 9 deletions(-)

Applied; thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
