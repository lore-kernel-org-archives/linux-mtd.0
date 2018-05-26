Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMUnk-0007Ru-6S
 for linux-mtd@lists.infradead.org; Sat, 26 May 2018 08:45:06 +0000
Date: Sat, 26 May 2018 10:43:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 12/16] mtd: rawnand: qcom: fix return value for raw
 page read
Message-ID: <20180526104324.5284594c@xps13>
In-Reply-To: <1527250904-21988-13-git-send-email-absahu@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-13-git-send-email-absahu@codeaurora.org>
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

Hi Abhishek,

On Fri, 25 May 2018 17:51:40 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Fix value returned by ->read_page_raw() to be the
> actual operation status, instead of always 0.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
