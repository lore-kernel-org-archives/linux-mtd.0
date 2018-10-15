Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBxxH-0000CW-QD
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2018 08:12:24 +0000
Subject: Re: [PATCH v2 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND
 flash controller driver
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <1538732520-2800-1-git-send-email-christophe.kerello@st.com>
 <1538732520-2800-3-git-send-email-christophe.kerello@st.com>
 <20181005115809.55356782@bbrezillon>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <b10a3919-7b86-c177-2254-30d32ac6f25e@st.com>
Date: Mon, 15 Oct 2018 10:09:49 +0200
MIME-Version: 1.0
In-Reply-To: <20181005115809.55356782@bbrezillon>
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



On 10/05/2018 11:58 AM, Boris Brezillon wrote:
> On Fri, 5 Oct 2018 11:41:59 +0200
> <christophe.kerello@st.com> wrote:
> 
>> +struct stm32_fmc2 {
> 
> You should inherit from nand_controller even if the nand_chip already
> embeds a dummy nand controller object.
> 
> 	struct nand_controller base;
> 

Hi Boris,

Ok, i will add and handle the nand controller structure.

Regards,
Christophe Kerello.

>> +	struct stm32_fmc2_nand nand;
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
>> +	u8 cs_assigned;
>> +	int cs_sel;
>> +};
