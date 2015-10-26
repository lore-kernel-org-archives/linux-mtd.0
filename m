Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqo8p-0007iJ-Lf
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 20:13:16 +0000
Received: by pabla5 with SMTP id la5so4551144pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 13:12:54 -0700 (PDT)
Date: Mon, 26 Oct 2015 13:12:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH] mtd: nand: vf610_nfc: use
 nand_check_erased_ecc_chunk() helper
Message-ID: <20151026201252.GF13239@google.com>
References: <1443561116-139851-1-git-send-email-computersforpeace@gmail.com>
 <20150930185246.6bfdda29@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150930185246.6bfdda29@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 30, 2015 at 06:52:46PM +0200, Boris Brezillon wrote:
> On Tue, 29 Sep 2015 14:11:56 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > I forgot about this feedback. How does this patch look? Just compile tested.
> 
> Looks good to me, but I can't test it either :-).
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Seeing as this came up during review, and I see no objections...

Applied to l2-mtd.git
