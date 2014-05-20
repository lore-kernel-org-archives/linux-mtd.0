Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmtgi-0003x3-Ub
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 23:43:17 +0000
Received: by mail-ie0-f176.google.com with SMTP id rl12so1251361iec.21
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 16:42:55 -0700 (PDT)
Date: Tue, 20 May 2014 16:42:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return
 detected bit-flips in erased-page
Message-ID: <20140520234249.GZ28907@ld-irv-0074>
References: <1395730699-14687-1-git-send-email-pekon@ti.com>
 <20140512203626.GS28907@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EACDE66@DBDE04.ent.ti.com>
 <20140519122052.GA698@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EACE4A3@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACE4A3@DBDE04.ent.ti.com>
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

On Tue, May 20, 2014 at 04:43:35AM +0000, Pekon Gupta wrote:
> This fix is really important to be marked as stable, as some users of OMAP
> platforms have spawning out from 3.10 and 3.12 kernel to go for production.
> And quite a few of them might be using NAND for their booting purpose,
> so without this patch any bit-flip on their erased-pages will not be detected.

Well, I don't think it's actually as dire as you say. The erased-page
bitflips won't be flagged as -EUCLEAN, but they will be "corrected." I
expect that this should be fine mostly.

But anyway, tagged for -stable and re-queued to l2-mtd.git.

In the future, I may be less likely to do this kind of rebasing. Note
that there is still a procedure for getting fixes to -stable after their
merging:

<quote>
 - Send the patch, after verifying that it follows the above rules, to
   stable@vger.kernel.org.  You must note the upstream commit ID in the
   changelog of your submission, as well as the kernel version you wish
   it to be applied to.
</quote>

Brian
