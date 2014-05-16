Received: from mail-by2lp0240.outbound.protection.outlook.com
 ([207.46.163.240] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlDXm-0007eU-1V
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 08:31:06 +0000
Message-ID: <5375CD40.6060903@freescale.com>
Date: Fri, 16 May 2014 16:33:04 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Mingkai.Hu@freescale.com" <Mingkai.Hu@freescale.com>
Subject: Re: Support of Micron SPI flash (size > 16MB)
References: <92977332ffca4669b5c1987b42b0d0c5@BY2PR03MB508.namprd03.prod.outlook.com>
 <20140509104404.GK12304@sirena.org.uk>
 <20140516061856.GD2413@norris-Latitude-E6410>
 <86bc6bed6ec74c8c8fc3d0e929baee48@BY2PR03MB508.namprd03.prod.outlook.com>
In-Reply-To: <86bc6bed6ec74c8c8fc3d0e929baee48@BY2PR03MB508.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
Cc: "vivien.didelot@savoirfairelinux.com"
 <vivien.didelot@savoirfairelinux.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2014年05月16日 16:15, Mingkai.Hu@freescale.com 写道:
> Another question is for erase and program command. From the datasheet, not only the WTITE
> ENABLE command need to be issued before the command can be executed, but also a special
> READ FLAG STATUS RESISTER command need to be issued after the erase/program command which
> is not implemented in the upstream code. We implement the READ flag operation and erase
> can work, but write still fail.
>
> I saw somebody has added the Micron larger SPI flash (>16Mb) support, so I'd like to know
> if they run into such issue.
Yes, we have noticed this issue:

Please see this patch:
http://lists.infradead.org/pipermail/linux-mtd/2014-April/053571.html

thanks
Huang Shijie
