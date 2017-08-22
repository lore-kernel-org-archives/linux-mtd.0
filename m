Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dk2kC-0003NG-Gj
 for linux-mtd@lists.infradead.org; Tue, 22 Aug 2017 06:32:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 22 Aug 2017 12:02:35 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Archit Taneja <architt@codeaurora.org>, Richard Weinberger
 <richard@nod.at>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Andy Gross <andy.gross@linaro.org>, Sricharan R <sricharan@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH v5 00/16] Add QCOM QPIC NAND support
In-Reply-To: <20170821221504.0d4d8d00@bbrezillon>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
 <20170821221504.0d4d8d00@bbrezillon>
Message-ID: <067bcd2f3a653427be0b31fc1425a047@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-08-22 01:45, Boris Brezillon wrote:
> Le Thu, 17 Aug 2017 17:37:38 +0530,
> Abhishek Sahu <absahu@codeaurora.org> a écrit :
> 
>> * v5:
>> 
>> 1. Removed the patches already applied to linux-next and rebased the
>>    remaining patches on [3]
>> 2. Addressed the review comments in v4 and Added Archit Reviewed
>>    by tag.
>> 
>> [3] http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next
>> 

  <snip>

>> 
>> Abhishek Sahu (16):
>>   mtd: nand: qcom: DMA mapping support for register read buffer
>>   mtd: nand: qcom: allocate BAM transaction
>>   mtd: nand: qcom: add BAM DMA descriptor handling
>>   mtd: nand: qcom: support for passing flags in DMA helper functions
>>   mtd: nand: qcom: support for read location registers
>>   mtd: nand: qcom: erased codeword detection configuration
>>   mtd: nand: qcom: enable BAM or ADM mode
>>   mtd: nand: qcom: QPIC data descriptors handling
>>   mtd: nand: qcom: support for different DEV_CMD register offsets
>>   mtd: nand: qcom: add command elements in BAM transaction
>>   mtd: nand: qcom: support for command descriptor formation
>>   dt-bindings: qcom_nandc: fix the ipq806x device tree example
>>   dt-bindings: qcom_nandc: IPQ4019 QPIC NAND documentation
>>   dt-bindings: qcom_nandc: IPQ8074 QPIC NAND documentation
>>   mtd: nand: qcom: support for IPQ4019 QPIC NAND controller
>>   mtd: nand: qcom: Support for IPQ8074 QPIC NAND controller
> 
> Applied everything to nand/next except patch 10 and 11. Let me know
> when the dmaengine dependency is merged and I'll take the remaining
> patches.
> 

  Thanks Boris for your great help and reviewing this long patch series 
:-)

  I will update you when DMA dependency is merged.

  Thanks,
  Abhishek

> 
>> 
>>  .../devicetree/bindings/mtd/qcom_nandc.txt         |  63 +-
>>  drivers/mtd/nand/qcom_nandc.c                      | 746 
>> ++++++++++++++++++---
>>  2 files changed, 722 insertions(+), 87 deletions(-)
>> 
