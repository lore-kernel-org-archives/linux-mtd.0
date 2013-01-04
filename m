Received: from b.relay.invitel.net ([62.77.203.4])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tr0xO-0004Gb-Ux
 for linux-mtd@lists.infradead.org; Fri, 04 Jan 2013 06:40:44 +0000
Date: Fri, 04 Jan 2013 07:40:09 +0100
From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v2] davinci_nand: fix modular build with CONFIG_OF=y
In-reply-to: <201301032127.34467.sshtylyov@ru.mvista.com>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Message-id: <50E67949.6010302@denx.de>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7BIT
References: <201301032127.34467.sshtylyov@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org,
 davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org,
 nsekhar@ti.com
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Sergei

On 03.01.2013 19:27, Sergei Shtylyov wrote:
> Commit cdeadd712f52b16a9285386d61ee26fd14eb4085 (mtd: nand: davinci: add OF
> support for davinci nand controller) has never been really build tested with
> the driver as a module.  When the driver is built-in, the missing semicolon
> after structure initializer is "compensated" by MODULE_DEVICE_TABLE() macro
> being empty and so the initializer using the trailing semicolon on the next
> line; when the driver is built as a module, compilation error ensues, and as
> the 'davinci_all_defconfig' has the NAND driver modular, this error prevents
> DaVinci family kernel from building...
>
> Signed-off-by: Sergei Shtylyov<sshtylyov@ru.mvista.com>
> Cc: stable@vger.kernel.org # 3.7
>
> ---
> The patch is atop of the recent Linus' tree.
> Sekhar, have you build tested at least 3.8-rc1?
>
>   drivers/mtd/nand/davinci_nand.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: linux/drivers/mtd/nand/davinci_nand.c
> ===================================================================
> --- linux.orig/drivers/mtd/nand/davinci_nand.c
> +++ linux/drivers/mtd/nand/davinci_nand.c
> @@ -523,7 +523,7 @@ static struct nand_ecclayout hwecc4_2048
>   static const struct of_device_id davinci_nand_of_match[] = {
>   	{.compatible = "ti,davinci-nand", },
>   	{},
> -}
> +};
>   MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
>
>   static struct davinci_nand_pdata

Acked-by: Heiko Schocher <hs@denx.de>

Thanks for detecting this!

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
