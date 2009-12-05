Received: from smtp5-g21.free.fr ([212.27.42.5])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGs6y-0008OX-HU
	for linux-mtd@lists.infradead.org; Sat, 05 Dec 2009 10:43:41 +0000
Message-ID: <4B1A394F.3060904@eukrea.com>
Date: Sat, 05 Dec 2009 11:43:27 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RFC] mxc nand controller updates
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>	<1257925792.21596.858.camel@localhost>	<20091112073630.GV30179@pengutronix.de>	<1258101131.21596.1189.camel@localhost>	<1259580031.19465.378.camel@macbook.infradead.org>
	<20091130122903.GO27548@pengutronix.de>
In-Reply-To: <20091130122903.GO27548@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: mathieu.berland@eads.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

Sascha Hauer a écrit :
>   git://git.pengutronix.de/git/imx/linux-2.6.git mxc-nand
> 
> Sascha Hauer (18):
>       mxc_nand: cleanup eccoob descriptions
>       mxc_nand: cleanup initialization
>       mxc_nand: merge send_read_page and send_prog_page
>       mxc_nand: introduce mxc_do_addr_cycle
>       mxc nand: remove debug param
>       mxc nand: remove dead code
>       mxc nand: use resource_size()
>       mxc nand: use buffers
>       mxc nand: simplify command processing
>       mxc nand: modify send_page to send all pages, not only one
>       mxc_nand: remove unused defines
>       mxc_nand: Make main/spare areas runtime configurable
>       mxc_nand: Get rid of pagesize_2k flag
>       mxc_nand: Add NFC V2 support
>       mxc_nand: disable sp_en bit only once
>       mxc_nand: Allow flash based bbt
>       mxc_nand: remove TROP_US_DELAY
>       mxc_nand: use DRIVER_NAME where appropriate
> 
Tested-by: Eric Benard <eric@eukrea.com>

it's a bit late but I can confirm this works fine on our i.MX27 platform 
using : NAND device: Manufacturer ID: 0x2c, Chip ID: 0xac (Micron NAND 
512MiB 1,8V 8-bit) (2k page size) with hw ecc & flash bbt.

Eric
