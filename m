Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEyKT-00055y-6T
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 09:15:50 +0000
Received: by mail-pa0-f53.google.com with SMTP id lb1so670536pab.12
 for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2013 02:15:27 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 29 Aug 2013 11:15:26 +0200
Message-ID: <CAGWqfijpGuwqEh5oW8F=DFoQ=hG72ErMZge2cDsSjJZ=iD--kA@mail.gmail.com>
Subject: 4byte addressing mode on Micron n25q256a vs write enable
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: computersforpeace@gmail.com, marex@denx.de
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I pulled a the " m25p80: Micron SPI uses Macronix-style 4-byte
addressing" from Linux-next (see (1) and (2) ) and applied it on my
3.9 tree in order to get a Micron n25q256a (N25Q256A13ESF40F to be
complete) functional on custom board with an i.mx28.  The patch came
close to get this combination functional but it lacked something. If
we look at the n25q256a datasheet (3) page 68 contains in paragraph
"ENTER or EXIT 4-BYTE ADDRESS MODE Command" the following:

<quote>
To enter or exit the 4-byte address mode, the WRITE ENABLE command
must be executed to set the write enable latch bit to 1. (Note: The
WRITE ENABLE command must NOT be executed on the N25Q256A83ESF40x and
N25Q256A83E1240x devices.) S# must be driven LOW. The effect of the
command is immediate; after the command has been executed, the write
enable latch bit is cleared to 0.
</quote>

So with just your patch (1), (2) applied:

  switch (JEDEC_MFR(jedec_id)) {
  case CFI_MFR_MACRONIX:
+ case CFI_MFR_ST: /* Micron, actually */
  case 0xEF /* winbond */:

The result is that the SPI flash does not enter 4byte mode. If I
however rework this patch as:

  switch (JEDEC_MFR(jedec_id)) {
+ case CFI_MFR_ST: /* Micron, actually */
+ write_enable(flash);
  case CFI_MFR_MACRONIX:
  case 0xEF /* winbond */:

It just-seems-to-work, but I have no idea how general this patch is
for other Micron devices which support the 4byte mode.

my 2 cents.
E.

References:
(1) https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/mtd/devices/m25p80.c?id=7b9497fcaaceb84acbb62e80e04eba2e36ee5ed4
(2) http://patchwork.ozlabs.org/patch/266130/
(3) http://www.micron.com/~/media/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_256mb_3v_65nm.pdf

-- 
Elie De Brauwer
