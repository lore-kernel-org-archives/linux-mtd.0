Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etx2x-0007FT-Ec
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2018 15:01:47 +0000
Message-ID: <1520521275.20980.41.camel@gmail.com>
Subject: Re: [PATCH] ubi: Reject MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>,  Mark Vasut <marek.vasut@gmail.com>, Boris
 BREZILLON <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 tharvey@gateworks.com, stable <stable@vger.kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>
Date: Thu, 08 Mar 2018 17:01:15 +0200
In-Reply-To: <3797589.z8fAhu5iDP@blindfold>
References: <20180303104554.5958-1-richard@nod.at>
 <CACRpkdYOqt4xTqGmbSwd_R84NRD8GA9TsHEk_hJ68hhxwbsL_Q@mail.gmail.com>
 <3797589.z8fAhu5iDP@blindfold>
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

On Thu, 2018-03-08 at 15:43 +0100, Richard Weinberger wrote:
> As stated by David Woodhouse, it was a huge mistake by UBI to not
> reject MLC 
> NAND from the very beginning.

Correction: when we were developing UBI/UBIFS and upstreamed them, MLC
was widely used yet we did not really know about it. So there was
nothing to reject yet.

The mistake is that we did not add the reject timely. When people
started reporting MLC issues we were answering that UBI/UBIFS stack
needs more work to make MLC safe to use, and we hoped someone would do
the work.

Artem.
