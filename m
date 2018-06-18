Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUsjw-00045z-Er
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 11:54:34 +0000
Date: Mon, 18 Jun 2018 13:54:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@sigma-star.at>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>, Rob Herring
 <robh@kernel.org>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: rawnand: denali_dt: use dev as a shorthand of
 &pdev->dev
Message-ID: <20180618135410.5a480ccd@xps13>
In-Reply-To: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com>
References: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com>
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

Hi Masahiro,

On Tue, 12 Jun 2018 19:31:54 +0900, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Add 'dev' as a shorthand before adding more code that takes a
> pointer to struce device.

s/struce/a struct/?

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

With this fixed:

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks
