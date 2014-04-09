Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXr92-0007yl-5W
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 11:58:20 +0000
Received: by mail-ie0-f177.google.com with SMTP id rl12so2290820iec.22
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 04:57:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC1D89@DBDE04.ent.ti.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
 <CAGXE3d8H=y3LeW54kwZg04-Edm-KkNbqXLCduNuPfAOrLymO+A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D89@DBDE04.ent.ti.com>
Date: Wed, 9 Apr 2014 13:57:55 +0200
Message-ID: <CAGXE3d-Oj+NaWjQzejiN7_s8kRHaDM8XF_Xc_+p1noETD_u-SQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Scott Wood <scottwood@freescale.com>,
 "Huang Shijie \(b32955@freescale.com\)" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 9, 2014 at 12:33 PM, Gupta, Pekon <pekon@ti.com> wrote:
>>From: Helmut Schaa [mailto:helmut.schaa@googlemail.com]
>>>On Wed, Apr 9, 2014 at 11:38 AM, Gupta, Pekon <pekon@ti.com> wrote:
> [...]
>>>
>>> (1) if chip->ecc.hwctl() and chip->ecc.calculate are not implemented but you
>>>  still want to use subpage write feature, then you need to provide custom
>>>  implementation for chip->ecc.write_subpage().
>>>  that's same for other interfaces of nand_chip like chip->ecc.write_page().
>>
>>But these don't cause panics :)
>>
> because fsl_elbc_nand.c uses custom implementations of chip->ecc.write_page()
>         @@ fsl_elbc_chip_init(...)
>                 chip->ecc.write_page = fsl_elbc_write_page;
>
> Same needs to be done if subpage write is needed. However, as this is
> a regression so please check if following patch solves your problem.[1]

That was my first approach too, seems to work ok for fsl_elbc_nand but some
other drivers might still experience crashes. A quick grep shows that
sh_flctl might
be affected as well.

So, I'd still argue that it would make more sense to keep the driver interface
behavior sane either by setting NAND_NO_SUBPAGE_WRITE as default or
by using some checks as proposed initially.

Thanks,
Helmut
