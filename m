Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XegBJ-0003jt-Rv
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 08:13:10 +0000
Received: by mail-ig0-f179.google.com with SMTP id h18so3024529igc.0
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 01:12:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E6F6F@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
 <CACna6rw4g1wWPv+VgL8WeA9rz-j8A6k+4bN7D=MQ9OU-BinToA@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6315E6F6F@NTXXIAMBX02.xacn.micron.com>
Date: Thu, 16 Oct 2014 10:12:47 +0200
Message-ID: <CACna6rxNbPzSYbe9GjQCSAeB8FgVi6ZpgKo=AB=6nYc4QcqN1g@mail.gmail.com>
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

On 16 October 2014 10:00, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <b=
eanhuo@micron.com> wrote:
>>There are a lot of changes happening/requested around this code. I also p=
roposed some patch touching this code, see https://patchwork.ozlabs.org/pat=
ch/377917/
>
>>Right now there is a slow ongoing work on fixing some m25p80 regression, =
which also may touch the code you change. So I'll suggest postponing this p=
atch until we get a regression fixed and then work on this hacky code again=
.
>
>
> Thanks for your concerns.But for the same deivce id with the different ex=
tended id and
> the same device name with the different device id issue, in your patch,th=
is doesn't take
> into account. I have encountered this situation. for example:

I really wasn't looking into details yet and I'm aware my patch does
something else. I just say we should first fix the regression and then
base next patches on top of that regression fix. I'm not NACKing your
changes :)
