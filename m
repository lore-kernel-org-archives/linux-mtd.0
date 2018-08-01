Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkygt-0003Gq-A1
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 21:29:56 +0000
Received: by mail-oi0-x234.google.com with SMTP id d189-v6so123175oib.6
 for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2018 14:29:44 -0700 (PDT)
MIME-Version: 1.0
From: Raphael Pereira <raphaelpereira@gmail.com>
Date: Wed, 1 Aug 2018 18:29:32 -0300
Message-ID: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
Subject: Suport for gf_len 14 in gpmi-nand for i.MX23 using Software BCH ECC
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I would like to know if it is possible to use the Software BCH ECC
implementation to support a GF14 (ECC size == 1024) 40 bit ECC strengh
flash (MT29F32G08CBADA) on a GF13 (ECC size == 512) 20 bit ECC strengh
only i.MX23 processor.

I know this processor uses gpmi-nand driver and it seems this driver
doesn't support software ECC implementation. What I want to know is if
it is possible to change the driver to use the current Software BCH
ECC implementation available on Linux when it detects the
configuration above which is not hardware supported and switch it to a
software implementation. Considering most flashes has a 1-bit ECC on
block 0 that would allow me to boot then switch to software ECC after
kernel load.

Best Regards,
-- 
Raphael Derosso Pereira
