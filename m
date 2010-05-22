Subject: Re: [PATCH 3/3] MTD: Kconfig cleanups
From: David Woodhouse <dwmw2@infradead.org>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1274490476-16057-3-git-send-email-maximlevitsky@gmail.com>
References: <1274490185.15285.22.camel@maxim-laptop>
	<1274490476-16057-3-git-send-email-maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 May 2010 08:47:10 +0100
Message-ID: <1274514430.11551.13808.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-05-22 at 04:07 +0300, Maxim Levitsky wrote:
> 
> @@ -129,6 +131,7 @@ config MTD_NAND_RICOH
>         default n
>         depends on PCI
>         select MTD_SM_COMMON
> +       select MTD_NAND_ECC_SMC 

I thought we had a better solution than this -- weren't we going to make
it a runtime thing? And default to the 'correct' order?

Then, only the legacy devices which need to retain the 'wrong' byteorder
for compatibility reasons will need to do it.

-- 
dwmw2
