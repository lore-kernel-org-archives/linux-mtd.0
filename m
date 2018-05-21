Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fKlpT-0001kv-2T
 for linux-mtd@lists.infradead.org; Mon, 21 May 2018 14:30:28 +0000
Date: Mon, 21 May 2018 16:30:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>, Masahiro Yamada
 <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 02/14] mtd: rawnand: denali: use helper function for
 ecc setup
Message-ID: <20180521163014.355318d6@xps13>
In-Reply-To: <1525350041-22995-3-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-3-git-send-email-absahu@codeaurora.org>
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

On Thu,  3 May 2018 17:50:29 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Now, the NAND base layer has helper function for ecc
> parameters setup which does the same thing.

Even if this message has a meaning in the series, I would prefer
something more generic like:

"Use the NAND core helper function xxx() to tune the ECC parameters
instead of the function locally defined."

With this change:

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
