Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZPfl-0001qm-5u
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 18:30:17 +0000
Received: by mail-ob0-f173.google.com with SMTP id gq1so2744879obb.18
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 11:29:56 -0700 (PDT)
Date: Thu, 24 Oct 2013 11:29:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2] flash_erase: check the nand type
Message-ID: <20131024182951.GD20061@ld-irv-0074.broadcom.com>
References: <1382612391-13036-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382612391-13036-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 24, 2013 at 06:59:51PM +0800, Huang Shijie wrote:
> Now, the MTD_NANDFLASH stands for SLC nand, and the MTD_MLCNANDFLASH
> stands for the MLC nand.
> 
> This patch includes the stdbool.h, and changes the "isNAND" to boolean type,
> and checks the right nand type for the MLC and SLC nand.
> 
> If the user wants to format a MLC nand for JFFS2, we will print out a message
> to warn him, and exit right now.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Thanks for the update. Pushed to mtd-utils.git.

BTW, this is not a problem with your patch, but MLC typically have large
OOB sizes which have outgrown the outdated ioctl(MEMGETOOBSEL), so
--jffs2 would have broken for them anyway. I just tested this on my
system. On an old kernel (where MLC is still detected as MTD_NANDFLASH)
I get:

  # flash_erase -j /dev/mtd1 0 1 
  flash_erase: error!: /dev/mtd1: unable to get NAND oobinfo
               error 22 (Invalid argument)

There's not much we can do about this.

Brian
