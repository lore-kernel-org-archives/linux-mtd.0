Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW87G-0000M5-7T
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 18:13:38 +0000
Date: Mon, 22 Sep 2014 20:13:15 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: support ONFI timing mode retrieval
 for non-ONFI NANDs
Message-ID: <20140922201315.022fefea@bbrezillon>
In-Reply-To: <20140922175834.GM1193@ld-irv-0074>
References: <1411395911-30365-1-git-send-email-boris.brezillon@free-electrons.com>
 <1411395911-30365-2-git-send-email-boris.brezillon@free-electrons.com>
 <20140922175834.GM1193@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Yassin Jaffer <yassinjaffer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 Sep 2014 10:58:34 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Mon, Sep 22, 2014 at 04:25:10PM +0200, Boris BREZILLON wrote:
> > Add an onfi_timing_mode_default field to nand_chip and nand_flash_dev in
> > order to support NAND timings definition for non-ONFI NAND.
> > 
> > NAND that support better timings mode than the default one have to define
> > a new entry in the nand_ids table.
> > 
> > The default timing mode should be deduced from timings description from
> > the datasheet and the ONFI specification
> > (www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf, chapter 4.15
> > "Timing Parameters").
> > You should choose the closest mode that fit the timings requirements of
> > your NAND chip.
> > 
> > Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> 
> You have some (new?) checkpatch warnings:
> 

Sorry for that. I just sent a new version fixing those warnings.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
