Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5jYx-00086K-7D
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 01:58:44 +0000
Received: by mail-pg0-x242.google.com with SMTP id s62so13958517pgc.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 18:58:22 -0700 (PDT)
Date: Tue, 2 May 2017 18:58:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-oxnas@lists.tuxfamily.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: oxnas_nand: Allocating more than necessary in probe()
Message-ID: <20170503015819.GA32111@google.com>
References: <20170425091949.uindhaxmbtsksqc7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170425091949.uindhaxmbtsksqc7@mwanda>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 25, 2017 at 12:19:49PM +0300, Dan Carpenter wrote:
> We only need to allocate sizeof(struct oxnas_nand_ctrl) which is 192
> bytes and not sizeof(struct nand_chip) which is a much larger 3056
> bytes.
> 
> Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to l2-mtd.git
