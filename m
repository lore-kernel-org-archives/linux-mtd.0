Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRhbP-0001yo-LF
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 07:11:36 +0000
Message-ID: <65072.192.168.10.89.1247814666.squirrel@dbdmail.itg.ti.com>
Date: Fri, 17 Jul 2009 12:41:06 +0530 (IST)
Subject: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
	read_page/read_page_raw APIs
From: "vimal singh" <vimalsingh@ti.com>
To: nsnehaprabha@ti.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	Sandeep Paulraj <s-paulraj@ti.com>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 17, 2009 at 3:29 AM, <nsnehaprabha@ti.com> wrote:
> From: Sneha Narnakaje <nsnehaprabha@ti.com>
>
> This patch new "page" parameter to all NAND read_page/read_page_raw APIs.
> The read_page API for the new mode ECC_HW_OOB_FIRST requires the page
> information to send the READOOB command and read the OOB area before the
> data area.
>
> This patch series applies to linux-mtd next (mmotm) GIT tree.
> This patch is the same as v2 version of this patch.
>
> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
> ---
>  drivers/mtd/nand/atmel_nand.c    |    2 +-
>  drivers/mtd/nand/cafe_nand.c     |    2 +-
>  drivers/mtd/nand/fsl_elbc_nand.c |    3 ++-
>  drivers/mtd/nand/nand_base.c     |   18 ++++++++++--------
>  drivers/mtd/nand/sh_flctl.c      |    2 +-
>  include/linux/mtd/nand.h         |    4 ++--
>  6 files changed, 17 insertions(+), 14 deletions(-)
>

Why not just adding 'page' or 'cur_page' parameter to 'mtd_info' structure and
populate the same in 'nand_do_read_ops' and 'nand_do_write_ops' as soon as you
calculate 'page' for every read and write access respectivily. And then this
info can be used by any one who has knowledge of 'mtd_info'.

-vimal
