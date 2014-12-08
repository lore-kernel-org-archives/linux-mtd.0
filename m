Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxuCg-0002wZ-Ca
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 09:02:02 +0000
Received: by mail-ie0-f180.google.com with SMTP id rp18so3984554iec.25
 for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2014 01:01:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315F03C4@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315EF2C5@NTXXIAMBX02.xacn.micron.com>
 <A765B125120D1346A63912DDE6D8B6315F03C4@NTXXIAMBX02.xacn.micron.com>
Date: Mon, 8 Dec 2014 10:01:40 +0100
Message-ID: <CACna6rz8K1PcfPXCogbWtGd=zS9cRCEZVZ=wC_dUYHO1S5S28w@mail.gmail.com>
Subject: Re: [V6 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
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

On 8 December 2014 at 09:50, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo)=
 <beanhuo@micron.com> wrote:
> This patch is based on the latest l2-mtd,I don't know if can pass?
> I have one question is that about following code.
> I have added our Mciron quad flag into spi_nor_ids[] table,but line over =
80 characters,
> If I divided one line into two lines,this will make spi_nor_ids[] table l=
ook ugly.I also find that
> There are other venders configure line that also over 80 characters,such =
as Spansion,Catalyst.
> So I don't divide my following configure line into two two lines,I don't =
know if this can
> Be accepted?
>
> +       { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI=
_NOR_QUAD_READ) },
> +       { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ) },
> +       { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ) },
> +       { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ) },

Even the CodingStyle says exceeding 80 columns can be accepted:

> Statements longer than 80 columns will be broken into sensible chunks, un=
less
> exceeding 80 columns significantly increases readability and does not hid=
e
> information.

Various hardware tables often happen to use more chars/line.
