Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAi65-0001MK-4X
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 09:44:41 +0000
Received: by wa-out-1112.google.com with SMTP id v33so419537wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Dec 2008 01:44:39 -0800 (PST)
Message-ID: <7ccead5b0812110144p7b149335t985ac2cc0d965082@mail.gmail.com>
Date: Thu, 11 Dec 2008 17:44:39 +0800
From: "Du Zhongdong" <axdududu@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [NAND] Need suggestions for writing a driver for 32G-bit NAND
	FLASH(4K-byte page)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all.

I'm trying to write a driver for 32G-bit NAND FLASH(4K-byte page,
Named K9LBG08U0M ), kernel version being 2.6.20.21.

          ~~~~~~~~~~~

After skimming through the files in the directory
linux/drivers/mtd/nand,  I think I should:
1. add "struct nand_ecclayout nand_oob_128" to the file nand_base.c
2. add  "{"NAND 4GiB 3,3V 8-bit",
         	0xD7, /* the device code*/
                0,  /* pagesize field.     I  follow the "16 Gigabit"
example, would somebody give an explanation? */
                8192,/*there's 8192 blocks in the chip*/
                0, /*  erasesize field.    I  follow the "16 Gigabit"
example, would somebody give an explanation? */
                LP_OPTIONS},
  to the file nand_ids.c


Is there anything else I should notice to driver the NAND FLASH?   I'm
a newbie to this field.


Best regards,
Du Zhongdong
