Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjzyG-00057T-Kr
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 23:49:25 +0000
Received: by mail-ie0-f169.google.com with SMTP id lx4so2104579iec.14
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 16:49:03 -0700 (PDT)
Date: Mon, 12 May 2014 16:49:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/1] mtd: eLBC NAND: fixes subpage write support
Message-ID: <20140512234900.GX28907@ld-irv-0074>
References: <1399349492-3006-1-git-send-email-pekon@ti.com>
 <1399504973.15726.356.camel@snotra.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1399504973.15726.356.camel@snotra.buserror.net>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Helmut Schaa <helmut.schaa@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 07, 2014 at 06:22:53PM -0500, Scott Wood wrote:
> On Tue, 2014-05-06 at 09:41 +0530, Pekon Gupta wrote:
> > As subpage write is enabled by default for all drivers, nand_write_subpage_hwecc
> > causes a crash if the driver did not register ecc->hwctl or ecc->calculate.
> > This behavior was introduced in
> >    commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9
> >    "mtd: nand: subpage write support for hardware based ECC schemes".
> > 
> > This fixes a crash by emulating subpage write support by padding sub-page data
> > with 0xff on either sides to make it full page compatible.
> > 
> > CC: <stable@vger.kernel.org> # 3.10.x+
> > 
> > Reported-by: Helmut Schaa <helmut.schaa@googlemail.com>
> > Tested-by: Helmut Schaa <helmut.schaa@googlemail.com>
> > Signed-off-by: Pekon Gupta <pekon@ti.com>
> > ---
> >  drivers/mtd/nand/fsl_elbc_nand.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> 
> Reviewed-by: Scott Wood <scottwood@freescale.com>

Pushed to l2-mtd. Thanks!

Brian
