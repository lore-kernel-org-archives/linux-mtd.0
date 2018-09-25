Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4jRD-0007oR-7v
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2018 09:15:37 +0000
Subject: Re: [PATCH 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
 <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
 <20180924192356.5f2e56fd@bbrezillon>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <3b37bac8-2616-eb7e-b559-2d73b96bfe28@st.com>
Date: Tue, 25 Sep 2018 11:14:30 +0200
MIME-Version: 1.0
In-Reply-To: <20180924192356.5f2e56fd@bbrezillon>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

Hi Boris,

On 09/24/2018 07:23 PM, Boris Brezillon wrote:
> Hi Christophe,
> 
> On Mon, 17 Sep 2018 17:47:39 +0200
> <christophe.kerello@st.com> wrote:
> 
>> +struct stm32_fmc2 {
>> +	struct nand_chip chip;
>> +	struct device *dev;
>> +	void __iomem *io_base;
>> +	void __iomem *data_base[FMC2_MAX_CE];
>> +	void __iomem *cmd_base[FMC2_MAX_CE];
>> +	void __iomem *addr_base[FMC2_MAX_CE];
>> +	phys_addr_t io_phys_addr;
>> +	phys_addr_t data_phys_addr[FMC2_MAX_CE];
>> +	struct clk *clk;
>> +
>> +	struct dma_chan *dma_tx_ch;
>> +	struct dma_chan *dma_rx_ch;
>> +	struct dma_chan *dma_ecc_ch;
>> +	struct sg_table dma_data_sg;
>> +	struct sg_table dma_ecc_sg;
>> +	u8 *ecc_buf;
>> +	int dma_ecc_len;
>> +
>> +	struct completion complete;
>> +	struct completion dma_data_complete;
>> +	struct completion dma_ecc_complete;
>> +
>> +	struct stm32_fmc2_timings timings;
>> +	u8 cs_assigned;
>> +	int cs_sel;
>> +	int ncs;
>> +	int cs_used[FMC2_MAX_CE];
>> +};
> 
> Can we have a clear separation between the NAND controller and NAND
> chip structures. I know you only support a single chip per-controller
> right now, but I prefer to have things clearly separated from the
> beginning.

Yes, I can create 2 structures: one for the controller (stm32_fmc2) and 
one for the NAND chip (stm32_fmc2_nand_chip).

Regards,
Christophe Kerello.

> 
> Regards,
> 
> Boris
> 
