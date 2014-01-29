Date: Tue, 28 Jan 2014 16:23:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH fix] mtd: nand: kill the the
 NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE for nand_buffers{}
Message-ID: <20140129002307.GD8919@ld-irv-0074>
References: <20140111233937.GF1992@norris-Latitude-E6410>
 <1389594432-23482-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389594432-23482-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 02:27:12PM +0800, Huang Shijie wrote:
> The patch converts the arrays to buffer pointers for nand_buffers{}.
> 
> The cafe_nand.c is the only NAND_OWN_BUFFERS user which allocates
> a nand_buffers{} itself.
> 
> This patch disables the DMA for nand_scan_ident, and restore the DMA
> status after we finish the nand_scan_ident. By this way, we can get the
> mtd->writesize and mtd->oobsize, and then allocates the cafe->dmabuf
> with them.
> 
> Since the cafe_nand.c uses the NAND_ECC_HW_SYNDROME ECC mode, we do not
> allocate the buffers for @ecccalc and @ecccode.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> 
> fix: Setup the DMA address after we have allocated the DMA buffer.

Thanks, looks OK. Pushed to l2-mtd.git/next.

Brian
