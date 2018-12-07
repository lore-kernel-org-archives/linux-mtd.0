Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVHse-0008DG-1n
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 15:17:30 +0000
Date: Fri, 7 Dec 2018 16:17:03 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: James Tomasetta <James.Tomasetta@cypress.com>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Yong Qin
 <Yong.Qin@cypress.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, Jimmy Zhao
 <jimmy.zhao@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value
Message-ID: <20181207161703.25efabc5@bbrezillon>
In-Reply-To: <BN6PR06MB32974DB116D27B9939A23090F6AA0@BN6PR06MB3297.namprd06.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181204100330.28acbecd@bbrezillon>
 <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181205202753.47ebe911@bbrezillon>
 <CY4PR06MB33041BF7999EA076D429DB66F6A90@CY4PR06MB3304.namprd06.prod.outlook.com>
 <VI1PR04MB5726B1366A2F09F304406AEA99AA0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <BN6PR06MB32974DB116D27B9939A23090F6AA0@BN6PR06MB3297.namprd06.prod.outlook.com>
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

On Fri, 7 Dec 2018 15:02:09 +0000
James Tomasetta <James.Tomasetta@cypress.com> wrote:

> Yogesh,
> 
> Attached is the latest CY driver for linux which might help.  It does
> not use the SFDP.

Yes, and that's exactly what we are trying to address. SFDP was
designed to provide a generic way to expose various information (memory
organization, supported cmdset/features, ...). If manufacturers don't
take care when populating these tables, we're back to the current
situation where everything has to be described on a per-chip basis (far
from ideal).

> We are working to see if we can update the default
> value of the device to 1.

I think it's too late for this part (we'll find a way to fixup the SMPT
table at runtime). But please be careful next time you design a chip.
