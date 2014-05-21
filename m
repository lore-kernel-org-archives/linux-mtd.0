Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnG4K-0000ue-Gz
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 23:37:09 +0000
Received: by mail-pa0-f52.google.com with SMTP id fa1so1858990pad.25
 for <linux-mtd@lists.infradead.org>; Wed, 21 May 2014 16:36:47 -0700 (PDT)
Date: Wed, 21 May 2014 16:36:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ted Juan <ted.juan@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop
 error
Message-ID: <20140521233644.GJ22233@ld-irv-0074>
References: <CAE94FHH66=h0Px23dw8LX9_Hu+GtA1c6qVOqwo6U4uHq+d1zUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE94FHH66=h0Px23dw8LX9_Hu+GtA1c6qVOqwo6U4uHq+d1zUw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 16, 2014 at 05:38:51PM +0800, Ted Juan wrote:
> The patch is mirror issue that the for-loop use the same variable.
> 
> 
> Signed-off-by: ted.juan <ted.juan@gmail.com>

Please fix your whitespace and line wrapping. I cannot apply your patch:

Applying: mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop error
fatal: corrupt patch at line 10
Patch failed at 0001 mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop error
The copy of the patch that failed is found in:
   /home/norris/git/l2-mtd/.git/rebase-apply/patch
When you have resolved this problem, run "git am --resolved".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Brian
