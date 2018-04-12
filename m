Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6WNF-0006gb-3Q
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2018 07:10:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 12 Apr 2018 12:40:13 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 5/9] mtd: nand: qcom: parse read errors for read oob also
In-Reply-To: <20180410120338.663d5925@xps13>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-6-git-send-email-absahu@codeaurora.org>
 <20180410120338.663d5925@xps13>
Message-ID: <8342d92074d94d98106f29ea40f779f4@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-04-10 15:33, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Wed,  4 Apr 2018 18:12:21 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> read_page and read_oob both calls the read_page_ecc function.
>> The QCOM NAND controller protect the OOB available bytes with
>> ECC so read errors should be checked for read_oob also. Now
>> this patch moves the error checking code inside read_page_ecc
>> so caller does not have to check explicitly for read errors.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> 
> Nitpick: the prefix should be "mtd: rawnand: qcom: " now as this driver
> has been moved to drivers/mtd/nand/raw/.
> 
> Otherwise:
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

  Thanks Miquel for your review.

  I will update the same in this patch and other patches.
  and rebase my patches over 4.17-rc1 once its available.

  Thanks,
  Abhishek
