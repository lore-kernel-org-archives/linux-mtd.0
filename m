Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTioJ-0002D0-Bt
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:38:34 +0000
Date: Mon, 3 Dec 2018 08:38:14 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "yong.qin@cypress.com" <yong.qin@cypress.com>, James Tomasetta
 <James.Tomasetta@cypress.com>, Jimmy Zhao <jimmy.zhao@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value
Message-ID: <20181203083814.74662f38@bbrezillon>
In-Reply-To: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
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

On Mon, 3 Dec 2018 04:33:53 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> + Linux MTD mailing list group
> 
> Hi Tudor,
> 
> As confirmed by cypress team, default value of CR3NV[1] is 0 for flash FS512S and this is having the 256KB uniform erase sector option.
> There is discrepancy between FS512s datasheet and the actual shipped chip.

It's not only the datasheet that is wrong, the BFPT section is wrong
too, and this one can't be fixed :-/.
