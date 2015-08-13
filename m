Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPwg7-00011K-RI
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 17:52:36 +0000
Received: by labd1 with SMTP id d1so30590000lab.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 10:52:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF447C2@NTXXIAMBX02.xacn.micron.com>
References: <1437479828-30826-1-git-send-email-B48286@freescale.com>
 <CY1PR0301MB0780E3F6E2A1170A7A56A8538B8A0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CY1PR0301MB0780204E22E93D42F596043D8B7D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <A765B125120D1346A63912DDE6D8B6310BF447C2@NTXXIAMBX02.xacn.micron.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 13 Aug 2015 19:51:33 +0200
Message-ID: <CAOMqctQKqG4dVOSMs8xOvBDus+womjC4Lo8DCK-Xi5QU=wd+Kg@mail.gmail.com>
Subject: Re: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Cc: Hou Zhiqiang <B48286@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "jonatas.rech@datacom.ind.br" <jonatas.rech@datacom.ind.br>,
 "Jane.Wan@gainspeed.com" <Jane.Wan@gainspeed.com>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>,
 "valentin.longchamp@keymile.com" <valentin.longchamp@keymile.com>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
 Hu Vincent <Mingkai.Hu@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 August 2015 at 17:38, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) =
<beanhuo@micron.com> wrote:
>
> Hi,
> Is it convenient to tell me that which vendor's spi nor?
> For current spi nor structure, write operation has been already split tra=
nsaction length
> By page size(256 Bytes). But seems "retlen" not reasonable.
>

I was working with SPI controller which had limit of 63 bytes per
transfer which is smaller than the page size.

This limitation was due to driver deficiency. Adding the limit to
m25p80 allowed full access to the flash content, though.

Thanks

Michal
