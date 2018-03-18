Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exfg1-0003Bp-JA
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 21:17:15 +0000
Date: Sun, 18 Mar 2018 22:16:51 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 marcel.ziswiler@toradex.com, richard@nod.at, bpringlemeir@gmail.com,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH v7 0/3] mtd: rawnand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180318221651.2fe444cb@bbrezillon>
In-Reply-To: <20180312195818.2f23de04@bbrezillon>
References: <20180309145038.29024-1-stefan@agner.ch>
 <20180312195818.2f23de04@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Mar 2018 19:58:18 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Fri,  9 Mar 2018 15:50:35 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
> > Seventh revision of the rework patchset to use exec_op for NXP
> > Vybrid (and others) NAND Flash Controller.
> > 
> > --
> > Stefan
> > 
> > Changes in v7:
> > - Check NAND status in vf610_nfc_write_page  
> 
> Still no NAND status check in vf610_nfc_write_page(), maybe you forgot
> to squash the changes in patch 1.

Applied v7 after fixing the problem. I also replaced
cpu_to_be32()/be32_to_cpu() calls by swab32() ones to make sparse happy.

Thanks,

Boris

> 
> > 
> > Changes in v6:
> > - Checkpatch style fixes
> > - Subject change
> > 
> > Changes in v5:
> > - Fix COMMAND_NADDR_BYTES macro (fixes oob/page test issues)
> > - Renamed page_access to data_access
> > - Removed unclear debugging messages
> > - Introduce vf610_nfc_fill_row to avoid code dupplication in
> >   vf610_nfc_(read|write)_page
> > - Add patch to enable ONFI SET/GET_FEATURES
> > - Comment/commit message fixes
> > 
> > Changes in v4:
> > - Rebased to nand/next
> > - Simplify filling of address cycles
> > - Use accessors for SRAM (vf610_nfc_rd_from_sram/vf610_nfc_wr_to_sram)
> > - Use two op-parser patterns to avoid a single command reading and writing
> >   in a single operation
> > - Implement (read|write)_(page|oob)[_raw] to set page_access
> > - Set and clear vf610_nfc_ecc_mode in ecc (read|write)_page
> > - Clear/set 16-bit config when 16-bit bus is used and 8-bit access is
> >   requested
> > 
> > Changes in v3:
> > - Separate exec_op() callback addition and removal of old callbacks
> > - Push data into regs in one function
> > - Readd op parser
> > - Implement custom read/write page for hardware ECC
> > - Rely on generic ecc.write_page_raw
> > - Use nand_read_oob_op instead of nand_read_page_op
> > 
> > Stefan Agner (3):
> >   mtd: rawnand: vf610_nfc: make use of ->exec_op()
> >   mtd: rawnand: vf610_nfc: remove old hooks
> >   mtd: rawnand: vf610_nfc: support ONFI SET/GET_FEATURES commands
> > 
> >  drivers/mtd/nand/raw/vf610_nfc.c | 624 +++++++++++++++++++++++----------------
> >  1 file changed, 372 insertions(+), 252 deletions(-)
> >   
> 
> 
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
