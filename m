Received: from mail-qa0-x22c.google.com ([2607:f8b0:400d:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYlSs-0008FG-Jk
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 23:34:19 +0000
Received: by mail-qa0-f44.google.com with SMTP id cm18so3778099qab.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 16:33:56 -0700 (PDT)
Date: Tue, 22 Oct 2013 16:33:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH for mtd-utils 0/4] about the SLC/MLC
Message-ID: <20131022233349.GR23337@ld-irv-0074.broadcom.com>
References: <1376978317-28010-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376978317-28010-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 20, 2013 at 01:58:33PM +0800, Huang Shijie wrote:
> This patch set is just following the kernel changes about the SLC/MLC,
> Please see:
>   http://lists.infradead.org/pipermail/linux-mtd/2013-August/048160.html
> 
> This patch set tries to make the mtd-utils still runs in the _old_ logic
> after we changed the code in kernel.
> 
> (The maillist blocks my email for the suspicious header, so i changed the
>  title and resend it.)
> 
> 
> Huang Shijie (4):
>   add the MTD_MLCNANDFLASH case
>   mtd: mtd-abi: add a helper to detect the nand type
>   Use the mtd_type_is_nand_user() to check the nand
>   check the MLC nand type
> 
>  flash_otp_write.c     |    4 ++--
>  include/mtd/mtd-abi.h |    5 +++++
>  lib/libmtd.c          |    5 ++++-
>  lib/libmtd_legacy.c   |    3 +++
>  mtd_debug.c           |    3 +++
>  ubi-utils/mtdinfo.c   |    2 +-
>  6 files changed, 18 insertions(+), 4 deletions(-)

Pushed to mtd-utils.git. Thanks!

You're missing flash_erase.c, which still has:

	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;

Maybe you want a helper for struct mtd_dev_info too? Or maybe just a
helper that looks at type 'int', so it applies to both mtd_dev_info.type
and mtd_info_user.type?

Brian
