Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUoJ1-0004ij-Tx
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 07:10:29 +0000
From: Richard Weinberger <richard@nod.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 2/3] mtd: rawnand: denali_dt: use dev as a shorthand of
 &pdev->dev
Date: Mon, 18 Jun 2018 09:10:15 +0200
Message-ID: <14871321.rQUvYYuQe4@blindfold>
In-Reply-To: <1529025532-22087-3-git-send-email-yamada.masahiro@socionext.com>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
 <1529025532-22087-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 15. Juni 2018, 03:18:51 CEST schrieb Masahiro Yamada:
> The probe function references &pdev->dev many times.  Add 'dev' as
> a shorthand.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
