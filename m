Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QX8Ng-0003wB-Uj
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2011 08:56:54 +0000
Received: by vxd2 with SMTP id 2so1200364vxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Jun 2011 01:56:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
Date: Thu, 16 Jun 2011 12:56:50 +0400
Message-ID: <BANLkTi=DAYYsB0SqhsXtdY_KN4ACVh0qKg@mail.gmail.com>
Subject: Re: [PATCH V2 00/18] last part of big cleanup of partition handling
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 6/12/11, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> Hello,
>
> Changes in V2 of this serie:
> * Introduce special struct mtd_parts_parser_data structure to hold data args
>   passed to parsers
> * small cleanups
>
> The following changes since commit 3e1643b282542cf524d30cfab4cfe38f6b2afa99:
>
>   mtd: edb7312: correctly pass MTD name to parsers (2011-06-09 15:30:44
> +0300)
>
> are available in the git repository at:
>   git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-big-cleanup
>
> Dmitry Eremin-Solenikov (18):
>       mtd: abstract last MTD partition parser argument
>       mtd: prepare to convert of_mtd_parse_partitions to partition parser
>       mtd: physmap_of: use ofpart through generic parsing
>       mtd: m25p80: use ofpart through generic parsing
>       mtd: fsl_elbc_nand: use ofpart through generic parsing
>       mtd: fsl_upm: use ofpart through generic parsing
>       mtd: mpc5121_nfc: use ofpart through generic parsing
>       mtd: ndfc: use ofpart through generic parsing
>       mtd: socrates_nand: use ofpart through generic parsing
>       mtd: drop of_mtd_parse_partitions()
>       mtd: physmap_of: move parse_obsolete_partitions to become separate
> parser
>       mtd: physmap_of.c: use mtd_device_parse_register
>       mtd: m25p80.c: use mtd_device_parse_register
>       mtd: fsl_elbc_nand.c: use mtd_device_parse_register
>       mtd: fsl_upm.c: use mtd_device_parse_register
>       mtd: mpc5121_nfc.c: use mtd_device_parse_register
>       mtd: ndfc.c: use mtd_device_parse_register
>       mtd: socrates_nand.c: use mtd_device_parse_register
>
>  drivers/mtd/cmdlinepart.c        |    2 +-
>  drivers/mtd/devices/m25p80.c     |   37 ++------------
>  drivers/mtd/maps/physmap_of.c    |   80 +++--------------------------
>  drivers/mtd/mtdcore.c            |    6 +-
>  drivers/mtd/mtdpart.c            |   15 ++++--
>  drivers/mtd/nand/fsl_elbc_nand.c |   17 ++-----
>  drivers/mtd/nand/fsl_upm.c       |   13 +----
>  drivers/mtd/nand/mpc5121_nfc.c   |   17 +-----
>  drivers/mtd/nand/ndfc.c          |   16 +-----
>  drivers/mtd/nand/socrates_nand.c |   23 +-------
>  drivers/mtd/ofpart.c             |  104
> ++++++++++++++++++++++++++++++++++++--
>  drivers/mtd/redboot.c            |    6 +-
>  include/linux/mtd/mtd.h          |    3 +-
>  include/linux/mtd/partitions.h   |   32 +++++-------
>  14 files changed, 160 insertions(+), 211 deletions(-)

What about this patchset?

-- 
With best wishes
Dmitry
