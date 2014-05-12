Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjwxv-00083j-4C
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 20:36:51 +0000
Received: by mail-pa0-f41.google.com with SMTP id lj1so9431596pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 13:36:29 -0700 (PDT)
Date: Mon, 12 May 2014 13:36:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return
 detected bit-flips in erased-page
Message-ID: <20140512203626.GS28907@ld-irv-0074>
References: <1395730699-14687-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395730699-14687-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 25, 2014 at 12:28:19PM +0530, Pekon Gupta wrote:
> fixes: commit 62116e5171e00f85a8d53f76e45b84423c89ff34
>        mtd: nand: omap2: Support for hardware BCH error correction.
> 
> In omap_elm_correct_data(), if bitflip_count in an erased-page is within the
> correctable limit (< ecc.strength), then it is not indicated back to the caller
> ecc->read_page().
> This mis-guides upper layers like MTD and UBIFS layer to assume erased-page as
> perfectly clean and use it for writing even if actual bitflip_count was
> dangerously high (bitflip_count > mtd->bitflip_threshold).
> 
> This patch fixes this above issue, by returning 'stats' to caller
> ecc->read_page() under all scenarios.
> 
> Reported-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Pekon Gupta <pekon@ti.com>

Pushed to l2-mtd.git. Thanks!

Brian
