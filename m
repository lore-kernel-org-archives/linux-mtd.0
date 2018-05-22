Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL7yS-0005LE-Vv
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 14:09:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 22 May 2018 19:39:00 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>, Masahiro Yamada
 <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 02/14] mtd: rawnand: denali: use helper function for
 ecc setup
In-Reply-To: <20180521163014.355318d6@xps13>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-3-git-send-email-absahu@codeaurora.org>
 <20180521163014.355318d6@xps13>
Message-ID: <952e3cf1756dc5b5aa8b85b142eb7750@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-05-21 20:00, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Thu,  3 May 2018 17:50:29 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> Now, the NAND base layer has helper function for ecc
>> parameters setup which does the same thing.
> 
> Even if this message has a meaning in the series, I would prefer
> something more generic like:
> 
> "Use the NAND core helper function xxx() to tune the ECC parameters
> instead of the function locally defined."
> 

  Sure Miquel. I will change the commit message.

  Thanks,
  Abhishek

> With this change:
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Thanks,
> Miquèl
