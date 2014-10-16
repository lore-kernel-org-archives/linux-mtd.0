Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xef7k-0006rJ-Ex
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 07:05:25 +0000
Received: by mail-ie0-f179.google.com with SMTP id ar1so2851122iec.38
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 00:05:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
Date: Thu, 16 Oct 2014 09:05:01 +0200
Message-ID: <CACna6rw4g1wWPv+VgL8WeA9rz-j8A6k+4bN7D=MQ9OU-BinToA@mail.gmail.com>
Subject: Re: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 October 2014 03:26, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <b=
eanhuo@micron.com> wrote:
> This patch used to modify the method of spi_nor_scan overwrite platform I=
D point.
>
> If type of platform data match with the name of spi_nor_ids set,
> and JEDEC ID also match with INFO ID of spi_nor_ids set,spi device
> ID point(this is before probed according to device name) shouldn't be
> overwrote.Otherwise,this point will be overwrote by new spi_nor_ids
> set point that probed according to JEDEC ID.

There are a lot of changes happening/requested around this code. I
also proposed some patch touching this code, see
https://patchwork.ozlabs.org/patch/377917/

Right now there is a slow ongoing work on fixing some m25p80
regression, which also may touch the code you change. So I'll suggest
postponing this patch until we get a regression fixed and then work on
this hacky code again.
