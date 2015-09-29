Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgist-0002aD-Ib
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 00:35:08 +0000
Received: by pacex6 with SMTP id ex6so188412446pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 17:34:47 -0700 (PDT)
Date: Mon, 28 Sep 2015 17:34:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 REBASED] mtd: nand: pxa3xx-nand: prevent DFI bus
 lockup on removal
Message-ID: <20150929003444.GS31505@google.com>
References: <1443473811-14285-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443473811-14285-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 28, 2015 at 10:56:51PM +0200, Robert Jarzmik wrote:
> After the conversion of pxa architecture to common clock framework, the
> NAND clock can be disabled on driver exit.
> 
> In this case, it happens that if the driver used the NAND and set the
> DFI arbitration bit, the next access to a static memory controller area,
> such as an ethernet card, will stall the system bus, and the core will
> be stalled forever.
> 
> This is especially true on pxa31x SoCs, where the NDCR was augmented
> with a new bit to prevent this lockups by giving full ownership of the
> DFI arbiter to the SMC, in change SCr#6.
> 
> Fix this by clearing the DFI arbritration bit in driver exit. This
> effectively prevents a lockup on zylonite when removing pxa3xx-nand
> module, and using ethernet afterwards.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> 
> ---
> Since v1: add comment, switch to NFCV1/NCFV2 registers naming
> Since v2: rebase on top of Brian's tree

Applied to l2-mtd.git. Thanks.
