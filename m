Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUcqG-0006xJ-RL
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 19:28:18 +0000
Date: Wed, 5 Dec 2018 20:27:53 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yong Qin <Yong.Qin@cypress.com>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, James Tomasetta
 <James.Tomasetta@cypress.com>, Jimmy Zhao <jimmy.zhao@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value
Message-ID: <20181205202753.47ebe911@bbrezillon>
In-Reply-To: <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181204100330.28acbecd@bbrezillon>
 <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
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

On Wed, 5 Dec 2018 19:21:51 +0000
Yong Qin <Yong.Qin@cypress.com> wrote:

> Hi Boris,
> 
> Thanks for pointing this out.
> 
> Confirmed with our product team, this is the part of datasheet
> discrepancy. Since FS512S only has 256KB sector size option, CR3NV[1]
> is don't care in FS512S and default value is set as 0 in factory.
> 
> Column 3 (CR3NV[1]) of table 70 in datasheet will be removed.
> 
> For software implementation, if identified the device is FS512S, then
> checking the combination of CR3NV[3]  & CR1NV[2] is sufficient to
> decide if the device has top/bottom 4KB sectors, or uniform 256KB
> sectors.

Again, fixing the datasheet is not enough, the SMPT section on the flash
needs to be fixed too.
