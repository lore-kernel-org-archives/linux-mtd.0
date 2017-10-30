Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9ArY-0000Sd-Eb
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 14:16:30 +0000
Received: by mail-qt0-x231.google.com with SMTP id j58so16531905qtj.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2017 07:16:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ae3620ec-293e-458e-76b1-5c13e0cdc992@wedev4u.fr>
References: <20171029195809.GH29656@lahna.fi.intel.com>
 <77788f0c0cf55ee9fc0087364827da28c6951180.1509315023.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20171030073241.GI29656@lahna.fi.intel.com>
 <ae3620ec-293e-458e-76b1-5c13e0cdc992@wedev4u.fr>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Oct 2017 16:16:02 +0200
Message-ID: <CAHp75Vcz5wk5ReOTKtYRxPu0aBTWF2OS2tVLqwcikefh0bV__g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: intel-spi: Add Intel Lewisburg PCH SPI super
 SKU PCI ID
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 30, 2017 at 12:58 PM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
> Le 30/10/2017 =C3=A0 08:32, Mika Westerberg a =C3=A9crit :
>> On Sun, Oct 29, 2017 at 03:17:35PM -0700, sathyanarayanan.kuppuswamy@lin=
ux.intel.com wrote:

> Just for info, this patch didn't apply directly, it misses a line in the =
list of
> PCI IDS:
>
>         { PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },

Just in case, you might use
git am -C1 which will ignore such context mistake.
Though it requires to look at the result to be sure it's correct.

--=20
With Best Regards,
Andy Shevchenko
