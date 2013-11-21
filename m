Received: from mail-qe0-x232.google.com ([2607:f8b0:400d:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjZNj-0003nC-CK
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 18:53:40 +0000
Received: by mail-qe0-f50.google.com with SMTP id 1so130523qee.37
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2013 10:53:17 -0800 (PST)
Date: Thu, 21 Nov 2013 10:53:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: Add NAND device drivers to MAINTAINERS
Message-ID: <20131121185314.GK9468@ld-irv-0074.broadcom.com>
References: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1384950009-13767-2-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384950009-13767-2-git-send-email-ezequiel.garcia@free-electrons.com>
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

On Wed, Nov 20, 2013 at 09:20:08AM -0300, Ezequiel Garcia wrote:
> Add drivers/mtd/nand/ to MAINTAINERS file with Brian Norris
> as the subsystem maintainer.
> 
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 167e188..d4145f7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5554,6 +5554,18 @@ F:	drivers/mtd/
>  F:	include/linux/mtd/
>  F:	include/uapi/mtd/
>  
> +NAND DEVICE DRIVERS

While it would be nice for MTD and NAND to be listed together, I think
this file is in alphabetical order ("NAND" doesn't come between "MTD"
and "MEN").

Also, I might recommend including "FLASH" in the title: NAND FLASH
DEVICE DRIVERS.

> +M:	Brian Norris <computersforpeace@gmail.com>
> +L:	linux-mtd@lists.infradead.org
> +W:	http://www.linux-mtd.infradead.org/
> +Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> +T:	git http://git.infradead.org/l2-mtd.git

The git tree is an interesting case. l2-mtd.git was really only set up
as a secondary tree, not as the official tree. It has moved to being the
primary place for development, though, so your entry does reflect
reality...

> +S:	Maintained
> +F:	drivers/mtd/nand/
> +F:	include/linux/mtd/nand.h
> +F:	include/linux/mtd/nand_ecc.h
> +F:	include/linux/mtd/nand_bch.h

include/linux/mtd/nand*.h?
include/linux/mtd/bbm.h?

> +
>  MEN A21 WATCHDOG DRIVER
>  M:  	Johannes Thumshirn <johannes.thumshirn@men.de>
>  L:	linux-watchdog@vger.kernel.org

Brian
