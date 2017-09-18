Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtwDN-0007Nn-Dh
 for linux-mtd@lists.infradead.org; Mon, 18 Sep 2017 13:35:59 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Kill check with no effect
Date: Mon, 18 Sep 2017 15:35:58 +0200
Message-ID: <2638808.btubpscyNz@blindfold>
In-Reply-To: <20170918114451.74e6fe68@bbrezillon>
References: <20170917141352.23691-1-richard@nod.at>
 <20170918114451.74e6fe68@bbrezillon>
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

Am Montag, 18. September 2017, 11:44:51 CEST schrieb Boris Brezillon:
> On Sun, 17 Sep 2017 16:13:52 +0200
> 
> Richard Weinberger <richard@nod.at> wrote:
> > header.major is of type u8 and cannot be negative.
> 
> I guess you meant header.minor here.

Correct. :)

Thanks,
//richard
