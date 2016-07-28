Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSZt4-0002m9-6L
 for linux-mtd@lists.infradead.org; Thu, 28 Jul 2016 01:13:22 +0000
Received: by mail-wm0-x230.google.com with SMTP id q128so232399762wma.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jul 2016 18:13:01 -0700 (PDT)
MIME-Version: 1.0
From: Alison Chaiken <alison@peloton-tech.com>
Date: Wed, 27 Jul 2016 18:12:59 -0700
Message-ID: <CAOuSAjewVko+eLcYutzFgsarCPBsWS_AbwLnTmo-hAW9HYVPzg@mail.gmail.com>
Subject: 4KB LEB's on QSPI and ubifs
To: beanhuo@micron.com, linux-mtd@lists.infradead.org
Cc: bsistani@micron.com, John.Parker@lucyautomation.co.uk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm helping to bring up a board that contains a Micron n25q512ax3 Quad
SPI-NOR.    As discussed previously at linux-mtd,

               http://lists.infradead.org/pipermail/linux-mtd/2013-July/047=
665.html

ubifs won't work with the 4 kB erase sectors like those used by this
chip, as it fails with

              UBIFS error (ubi0:0 pid 3289): init_constants_early: too
small LEBs (3968 bytes), min. is 15360 bytes

We are using a 4.1 PREEMPT_RT_FULL kernel, but as far as I can tell,
the relevant code in spi-nor.c and ubifs/super.c is unchanged in
recent 4.7.    Therefore, with SECT_4K  as a configuration for this
device, ubifs still will not work.

What is the best alternative?

0. Create a UBI volume, but mount a different kind of flash filesystem
on it.   Perhaps a different filesystem is a better choice for QSPI?
ubiattach and ubimkvol work fine with the device.  Our use case
involves a set of files that will likely only ever be written at
system installation time.

1. Remove SECT_4K from the entry in spi_nor_ids[] for the device and
use ubifs.   As I understand 548cd3a "mtd: spi-nor: Add quad I/O
support for Micron SPI NOR" that added SECT_4K, this removal will make
the device slower, but not otherwise cause problems.    The device's
datasheet reads,

                =E2=80=93 Subsector erase 4KB uniform granularity blocks
                =E2=80=93 Sector erase 64KB uniform granularity blocks

which suggests that removing SECT_4K from spi_nor_ids[] will result in
64KB sector erase blocks rather than 4KB subsector ones that ubiattach
detects now.

2. Something else entirely?

Thanks for your suggestions,
Alison Chaiken
Peloton Technology
