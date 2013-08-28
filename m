Received: from mail-ve0-x234.google.com ([2607:f8b0:400c:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEkbm-0006M4-HL
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 18:36:47 +0000
Received: by mail-ve0-f180.google.com with SMTP id pb11so4371536veb.25
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 11:36:23 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 28 Aug 2013 11:36:22 -0700
Message-ID: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com>
Subject: m68k: io{read,write} accessors
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-m68k@lists.linux-m68k.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It appears that m68k doesn't properly define the io{read,write}
functions. I get complaints like this from my compile testing:

drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
function 'iowrite8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
function 'ioread8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
function 'iowrite16_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
function 'ioread16_rep' [-Werror=implicit-function-declaration]

Brian
