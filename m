Received: from smtp5-g21.free.fr ([212.27.42.5])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NY3vv-0007w7-BC
	for linux-mtd@lists.infradead.org; Thu, 21 Jan 2010 20:47:19 +0000
Message-ID: <4B58BD42.7050301@eukrea.com>
Date: Thu, 21 Jan 2010 21:46:58 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mxc_nand : add RESET command support
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>	<1257925792.21596.858.camel@localhost>	<20091112073630.GV30179@pengutronix.de>	<1258101131.21596.1189.camel@localhost>	<1259580031.19465.378.camel@macbook.infradead.org>	<20091130122903.GO27548@pengutronix.de>	<4B1A394F.3060904@eukrea.com>
	<4B1D7B67.5010900@eukrea.com>
In-Reply-To: <4B1D7B67.5010900@eukrea.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

is it possible to get this patch merged to fix the RESET command on 
mxc_nand ?

Thanks,
Eric

Le 07/12/2009 23:02, Eric Bénard a écrit :
> mxc_nand driver must support the RESET Command in order to support
> Micron NAND which need a reset before any other command.
>
> Signed-off-by: Eric Benard <eric@eukrea.com>
> --
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index d5445cd..0207525 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -638,6 +638,7 @@ static void mxc_nand_command(struct mtd_info *mtd,
> unsigned command
>
> case NAND_CMD_ERASE1:
> case NAND_CMD_ERASE2:
> + case NAND_CMD_RESET:
> send_cmd(host, command, false);
> mxc_do_addr_cycle(mtd, column, page_addr);
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
