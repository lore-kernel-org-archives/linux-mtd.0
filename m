Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL7xU-00051Q-RA
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 14:08:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 22 May 2018 19:38:01 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/14] dt-bindings: qcom_nandc: make nand-ecc-strength
 optional
In-Reply-To: <20180521163254.71ade105@xps13>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-4-git-send-email-absahu@codeaurora.org>
 <20180521163254.71ade105@xps13>
Message-ID: <66498b23730297c67604f274419931bf@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-05-21 20:02, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Thu,  3 May 2018 17:50:30 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> Now, nand-ecc-strength is optional. If specified in DT, then
>> controller will use this ECC strength otherwise ECC strength will
>> be calculated according to chip requirement and available OOB size.
> 
> Same comment as before: don't start the commit log with "now,".
> 
> Thanks,
> Miquèl

  Thanks Miquel.
  I will change the commit message.

  Regards,
  Abhishek
