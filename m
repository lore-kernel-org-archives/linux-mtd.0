Message-ID: <501AB2F1.6060101@broadcom.com>
Date: Thu, 2 Aug 2012 10:03:45 -0700
From: "Jiandong Zheng" <jdzheng@broadcom.com>
MIME-Version: 1.0
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] mtd: use %*ph[CN] to dump small buffers
References: <1343912807-29355-1-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1343912807-29355-1-git-send-email-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-samsung-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/2/2012 6:06 AM, Andy Shevchenko wrote:
> There is new format specified that helps to dump small buffers. It makes the
> code simplier and nicer.
>
> Signed-off-by: Andy Shevchenko<andriy.shevchenko@linux.intel.com>
> Cc: David Woodhouse<dwmw2@infradead.org>
> Cc: Jiandong Zheng<jdzheng@broadcom.com>
> Cc: Ben Dooks<ben-linux@fluff.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---

>   drivers/mtd/nand/bcm_umi_bch.c    |   17 ++++-------------
>
Acked-by: Jiandong Zheng <jdzheng@broadcom.com>
