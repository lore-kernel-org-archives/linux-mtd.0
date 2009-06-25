Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MJjxw-00067S-78
	for linux-mtd@lists.infradead.org; Thu, 25 Jun 2009 08:06:05 +0000
Date: Thu, 25 Jun 2009 10:05:42 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH 2/2] Fix typo s/parititions/partitions/
Message-ID: <20090625080542.GB2995@pengutronix.de>
References: <1245879646-10338-1-git-send-email-cascardo@holoscopio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1245879646-10338-1-git-send-email-cascardo@holoscopio.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org, linux@maxim.org.za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wed, Jun 24, 2009 at 06:40:46PM -0300, Thadeu Lima de Souza Cascardo wrote:
> -		printk(KERN_ERR "atmel_nand: No parititions defined, or unsupported device.\n");
> +		printk(KERN_ERR "atmel_nand: No partitions defined, or unsupported device.\n");
It's a nice idea to Cc: trivial@kernel.org for such patches.

Best regards
Uwe

-- 
Pengutronix e.K.                              | Uwe Kleine-König            |
Industrial Linux Solutions                    | http://www.pengutronix.de/  |
