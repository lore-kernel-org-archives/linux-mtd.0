Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etxZ5-0001q9-Oa
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2018 15:34:53 +0000
Message-ID: <1520523268.20980.43.camel@gmail.com>
Subject: Re: [PATCH] ubi: Reject MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>,  Mark Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 tharvey@gateworks.com, stable <stable@vger.kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>
Date: Thu, 08 Mar 2018 17:34:28 +0200
In-Reply-To: <10429741.dU3vzh71GH@blindfold>
References: <20180303104554.5958-1-richard@nod.at>
 <3797589.z8fAhu5iDP@blindfold> <1520521275.20980.41.camel@gmail.com>
 <10429741.dU3vzh71GH@blindfold>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-03-08 at 16:28 +0100, Richard Weinberger wrote:
> You mean *not* widely used?

Yes, indeed, thanks for correction. MLC just wasn't there yet when
UBI/UBIFS were upstreamed.
