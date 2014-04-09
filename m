Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpOr-0004BT-H9
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 10:06:35 +0000
Received: by mail-ig0-f171.google.com with SMTP id c1so6250407igq.10
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 03:06:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
Date: Wed, 9 Apr 2014 12:06:12 +0200
Message-ID: <CAGXE3d8H=y3LeW54kwZg04-Edm-KkNbqXLCduNuPfAOrLymO+A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 9, 2014 at 11:38 AM, Gupta, Pekon <pekon@ti.com> wrote:
>>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>>index 9715a7b..2298289 100644
>>--- a/drivers/mtd/nand/nand_base.c
>>+++ b/drivers/mtd/nand/nand_base.c
>>@@ -3768,7 +3768,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>>                       ecc->write_oob = nand_write_oob_std;
>>               if (!ecc->read_subpage)
>>                       ecc->read_subpage = nand_read_subpage;
>>-              if (!ecc->write_subpage)
>>+              if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
>
> I don't think this is correct because nand_write_subpage_hwecc() is a
> replaceable function (default generic implementation). So
>
> (1) if chip->ecc.hwctl() and chip->ecc.calculate are not implemented but you
>  still want to use subpage write feature, then you need to provide custom
>  implementation for chip->ecc.write_subpage().
>  that's same for other interfaces of nand_chip like chip->ecc.write_page().

But these don't cause panics :)

> (2) If you don't want to use subpage write feature then just disable it using
>         chip->options |= NAND_NO_SUBPAGE_WRITE;
>
> Can you please tell which NAND controller driver is causing this ?
> We need to fix that..

This happens with fsl_elbc_nand (while trying to run ubiformat on a
mtd dev) but the
crash was caused by the introduction of nand_write_subpage_hwecc. So, in this
case I think instead of trying to fix every possible driver we should
let the nand core
code handle this issue gracefully. Maybe we could add a WARN_ON_ONCE to
notice which drivers require adjustments.

Regards,
Helmut
