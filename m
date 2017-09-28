Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxTz9-0001xf-Tq
 for linux-mtd@lists.infradead.org; Thu, 28 Sep 2017 08:16:01 +0000
Received: by mail-wr0-x243.google.com with SMTP id u48so1145266wrf.4
 for <linux-mtd@lists.infradead.org>; Thu, 28 Sep 2017 01:15:32 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Issue with Micron QSPI flash in 4.14-rc1
From: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <51b9af85-1712-7386-293d-1cfb69510f4f@wedev4u.fr>
Date: Thu, 28 Sep 2017 10:15:29 +0200
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, Richard Weinberger <richard@nod.at>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8281B818-C30A-4ABE-992F-0F04AF5E4B8B@gmail.com>
References: <E36A7C66-EC4D-46FF-A6E1-835E1C466E55@gmail.com>
 <51b9af85-1712-7386-293d-1cfb69510f4f@wedev4u.fr>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> On 2017. Sep 26., at 1:00, Cyrille Pitchen =
<cyrille.pitchen@wedev4u.fr> wrote:
>=20
> thanks for your report, I'll try to study it more closely and propose =
a
> fixup withing the next few days (thinking about invert the logic of
> SKIP_SFDP to disable the parsing by default and enable it memory by
> memory when needed) but here some comments:
>=20

Summarizing my testings:

- my 'old' bootloader code was working fine prior the SFDP table =
patches, and uses quad mode 4_4_4.
- with =E2=80=98old=E2=80=99 bootloader the SFDP table patched spi-nor =
was not working.
- as I replaced my bloader with new driver, which also use SFDP parsing =
and using mode 1_4_4,
it works fine with/without SFDP patched spi-nor.

I=E2=80=99m still not sure what is going on exactly, but it seems this =
is my problem only, and the SFDP patch is OK.

Sorry for generating noise...

Regards,
Andras
