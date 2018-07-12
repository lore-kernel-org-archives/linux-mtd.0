Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdWhM-0006vE-9k
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 08:11:39 +0000
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v2 04/12] dt-bindings: spi: Move the bindings for the FSL
 QSPI driver
To: Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com,
 linux-spi@vger.kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, miquel.raynal@bootlin.com,
 broonie@kernel.org, david.wolfe@nxp.com, fabio.estevam@nxp.com,
 prabhakar.kushwaha@nxp.com, yogeshnarayan.gaur@nxp.com, han.xu@nxp.com,
 shawnguo@kernel.org, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1530789310-16254-1-git-send-email-frieder.schrempf@exceet.de>
 <1530789310-16254-5-git-send-email-frieder.schrempf@exceet.de>
 <20180711155404.GA15363@rob-hp-laptop>
Message-ID: <6ea89c5c-0a50-fade-7d72-ca5b804da418@exceet.de>
Date: Thu, 12 Jul 2018 10:11:20 +0200
MIME-Version: 1.0
In-Reply-To: <20180711155404.GA15363@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rob,

On 11.07.2018 17:54, Rob Herring wrote:
> On Thu, Jul 05, 2018 at 01:15:00PM +0200, Frieder Schrempf wrote:
>> Move the documentation of the old SPI NOR driver to the place of the new
>> SPI memory interface based driver.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
>> ---
>> Changes in v2:
>> ==============
>> * Split the moving and editing of the dt-bindings in two patches
>>
>>   .../devicetree/bindings/mtd/fsl-quadspi.txt     | 65 --------------------
>>   .../devicetree/bindings/spi/spi-fsl-qspi.txt    | 65 ++++++++++++++++++++
>>   2 files changed, 65 insertions(+), 65 deletions(-)
> 
> Next time, use the -M option so the move shows any real diffs.

Ok, I'll keep that in mind.

Thanks,
Frieder

> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
