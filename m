Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fftnc-0005Z9-Jg
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 21:15:54 +0000
Date: Wed, 18 Jul 2018 23:15:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 4/5] mtd: rawnand: qcom: update BBT related flags
Message-ID: <20180718231526.38046099@xps13>
In-Reply-To: <1530863519-5564-5-git-send-email-absahu@codeaurora.org>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
 <1530863519-5564-5-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Abhishek,

Abhishek Sahu <absahu@codeaurora.org> wrote on Fri,  6 Jul 2018
13:21:58 +0530:

> Remove the NAND_SKIP_BBTSCAN to use RAM based BBT.

Unless I am understanding it the wrong way, NAND_SKIP_BBTSCAN will skip
the scan of the on-chip BBT and will scan every block to construct a
RAM, based BBT thanks to the BBM.

So flash based BBT is already unused and removing this flag is a
mistake, right?

> Flash based BBT is not used since bootloaders
> doesn't have support for the same.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Thanks,
Miqu=C3=A8l
