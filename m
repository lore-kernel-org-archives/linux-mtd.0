Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqdVs-0001W5-Hx
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 12:05:58 +0000
Date: Fri, 17 Aug 2018 14:05:43 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: NOR access from ARM-BE toolchain
Message-ID: <20180817140543.44ec1337@bbrezillon>
In-Reply-To: <VI1PR0402MB38542274356BBA43DED30DDC973D0@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <VI1PR0402MB38542274356BBA43DED30DDC973D0@VI1PR0402MB3854.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Aug 2018 10:54:24 +0000
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Hi Boris,
> 
> I am trying to access NOR flash with ARM running in big-endian mode.  But it is causing error as " do_map_probe() failed for type cfi_probe"
> 
> On our platform, The connection between Flash controller and NOR flash is little-endian.
> Here, ARM core running in littler endian mode with MTD_CFI_NOSWAP every things work fine. 
> 
> if we change ARM mode as big-endian, it start showing error as mentioned above. 
> Error is same even with MTD_CFI_BE_BYTE_SWAP option.   
> As per my understanding MTD_CFI_BE_BYTE_SWAP or MTD_CFI_LE_BYTE_SWAP deals with flash controller and flash connection.

If it works in little endian, you should enable MTD_CFI_LE_BYTE_SWAP
(or add the little-endian prop to the flash node in your DT).

> Not sure, if take care of Core endianness also. 
> 
> Please suggest!!
> 
> Regards,
> Prabhakar
> 
