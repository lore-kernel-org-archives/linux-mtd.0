Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLj8l-000536-Pg
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 00:27:40 +0000
Received: by mail-oa0-f52.google.com with SMTP id k18so663314oag.11
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 17:27:18 -0700 (PDT)
Date: Mon, 16 Sep 2013 17:27:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 09/10] mtd: add a helper to detect the nand type
Message-ID: <20130917002715.GI4550@ld-irv-0074.broadcom.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-10-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1377509808-29363-10-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 26, 2013 at 05:36:47PM +0800, Huang Shijie wrote:
> This helper detects that whether the mtd's type is nand type.
> 
> Now, it's clear that the MTD_NANDFLASH stands for SLC nand only.
> So use the mtd_type_is_nand() to replace the old check method
> to do the nand type (include the SLC and MLC) check.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

This patch also needs to be placed ahead of the patch that allows
nand_base.c to use MTD_MLCNANDFLASH. Otherwise there's a (temporary)
breakage between the time nand_base.c uses MLCNANDFLASH and the time
this patch is introduced.

Brian
