Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7XKv-00031L-RS
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 23:10:38 +0000
Received: by pdbki1 with SMTP id ki1so16689886pdb.1
 for <linux-mtd@lists.infradead.org>; Tue, 23 Jun 2015 16:10:15 -0700 (PDT)
Date: Tue, 23 Jun 2015 16:10:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <b45815@freescale.com>
Subject: Re: [PATCH V3] mtd: fsl-quadspi: Access multiple chips simultaneously
Message-ID: <20150623231006.GQ4917@ld-irv-0074>
References: <1431546057-16596-1-git-send-email-b45815@freescale.com>
 <20150520215250.GP11598@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150520215250.GP11598@ld-irv-0074>
Cc: shijie.huang@intel.com, linux-mtd@lists.infradead.org, han.xu@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 02:52:50PM -0700, Brian Norris wrote:
> On Wed, May 13, 2015 at 02:40:57PM -0500, Han Xu wrote:
> I think it'd be better to have a single error path in this function now.
> 
> Otherwise, I think this is OK. I can push the appended patch instead, if
> that's OK with you.
> 
> Signed-off-by: Han Xu <b45815@freescale.com>
> [Brian: reworked err path in fsl_qspi_prep()]
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
...

Pushed this version to l2-mtd.git/next.
