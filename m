Subject: Re: [PATCH 7/7] MTD : add GPMI driver in the config and Makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
In-Reply-To: <1300240521-4344-8-git-send-email-b32955@freescale.com>
References: <1300240521-4344-1-git-send-email-b32955@freescale.com>
	<1300240521-4344-8-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 12:44:16 +0300
Message-ID: <1301564656.2828.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux@arm.linux.org.uk, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org, David.Woodhouse@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-16 at 09:55 +0800, Huang Shijie wrote:
> +config MTD_NAND_GPMI_NFC
> +        bool "GPMI NAND Flash Controller driver"
> +        depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28)
> +	select MTD_PARTITIONS
> +        help
> +	 Enables NAND Flash support for IMX23 or IMX28.
> +	 The GPMI controller is very powerful, with the help of BCH
> +	 module, it can do the hardware ECC. The GPMI supports several
> +	 NAND flashs at the same time.

Please, fix the indentation here. Look at other entries in this file and
format the same way. Also, a bit write more text. Use word "freescale"
somewhere.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
