Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU6cN-0003yw-Jr
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 09:03:49 +0000
Date: Tue, 4 Dec 2018 10:03:30 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yong Qin <Yong.Qin@cypress.com>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, James Tomasetta
 <James.Tomasetta@cypress.com>, Jimmy Zhao <jimmy.zhao@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value
Message-ID: <20181204100330.28acbecd@bbrezillon>
In-Reply-To: <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
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

Hi Yong,

On Tue, 4 Dec 2018 01:37:14 +0000
Yong Qin <Yong.Qin@cypress.com> wrote:

> Hi Boris,
> 
> Do you mean the SFDP table?

Sorry, I meant the SMPT (Sector Map Parameter Table) section of
the SFDP table. See page 130 of this datasheet [1].

> Can you please share me more detail of what is wrong, i.e., which
> parameter, what is expect value and what you get?

See "Table 70. Sector Map Parameter", CR3NV[1] is always set to one,
and when we retrieve this value at runtime we get a 0. Which means
we won't find a matching mapid when iterating over the map table, hence
the bug reported by Yogesh.

If CR3NV[1] is always 0, then the SMPT should be fixed accordingly:

CR3NV[3]  CR1NV[2]  CR3NV[1]  Index  Value Description
0         0         0         00h    4 kB sectors at bottom with remainder 256 kB sectors
0         1         0         02h    4 kB sectors at top with remainder 256 kB sectors
1         0         0         04h    Uniform 256 kB sectors

Regards,

Boris

[1]http://www.cypress.com/file/216376/download
