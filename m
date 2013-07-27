Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V39pU-0001cE-1B
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 19:07:00 +0000
Received: by mail-vc0-f176.google.com with SMTP id ha11so1259153vcb.35
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 12:06:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1374934193-21236-1-git-send-email-akinobu.mita@gmail.com>
References: <1374934193-21236-1-git-send-email-akinobu.mita@gmail.com>
Date: Sat, 27 Jul 2013 12:06:38 -0700
Message-ID: <CAN8TOE_89DZ0yJkOPU3ehVuL3vUr9w=C=bskt3DtAoEqJ4d=mA@mail.gmail.com>
Subject: Re: [PATCH] mtd: denali: use NAND_CI_CELLTYPE_MSK instead of
 hardcoded constant
From: Brian Norris <computersforpeace@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 27, 2013 at 7:09 AM, Akinobu Mita <akinobu.mita@gmail.com> wrote:
> Use NAND_CI_CELLTYPE_MSK to extract the cell type from nand_chip.cellinfo
> instead of hardcoded constant.
>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org

Acked-by: Brian Norris <computersforpeace@gmail.com>

A comment not necessarily pertinent to this change: we don't set the
'cellinfo' field for ONFI chips, so this test for MLC won't be correct
for ONFI NAND.

Brian
