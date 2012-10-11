Message-ID: <507649FA.1060308@st.com>
Date: Thu, 11 Oct 2012 09:54:26 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 02/11] fsmc/nand: Rearrange the fsmc_nand_data structure
 and update comments
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2aa2a9c00bcfa62605edfab8fb4c29448612ced3.1349778820.git.vipin.kumar@st.com>
 <20121009115245.GL12801@game.jcrosoft.org>
In-Reply-To: <20121009115245.GL12801@game.jcrosoft.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/9/2012 5:22 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 16:14 Tue 09 Oct     , Vipin Kumar wrote:
>> Signed-off-by: Vipin Kumar<vipin.kumar@st.com>
>> ---
>>   drivers/mtd/nand/fsmc_nand.c | 51 ++++++++++++++++++++++++++------------------
>>   1 file changed, 30 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
>> index e96d7d1..bd89580 100644
>> --- a/drivers/mtd/nand/fsmc_nand.c
>> +++ b/drivers/mtd/nand/fsmc_nand.c
>> @@ -278,52 +278,61 @@ static struct fsmc_eccplace fsmc_ecc4_sp_place = {
>>    * struct fsmc_nand_data - structure for FSMC NAND device state
>>    *
>>    * @pid:		Part ID on the AMBA PrimeCell format
>> - * @mtd:		MTD info for a NAND flash.
>> - * @nand:		Chip related info for a NAND flash.
>> - * @partitions:		Partition info for a NAND Flash.
>> - * @nr_partitions:	Total number of partition of a NAND flash.
>> - *
>> - * @ecc_place:		ECC placing locations in oobfree type format.
>> - * @bank:		Bank number for probed device.
>> - * @clk:		Clock structure for FSMC.
>> + * @mtd:		MTD info for a NAND flash
>> + * @nand:		Chip related info for a NAND flash
>> + * @dev:		Device structure pointer
>> + * @clk:		Clock structure for FSMC
>> + * @ecc_place:		ECC placing locations in oobfree type format
>> + * @bank:		Bank number for probed device
>>    *
>>    * @read_dma_chan:	DMA channel for read access
>>    * @write_dma_chan:	DMA channel for write access to NAND
>>    * @dma_access_complete: Completion structure
>>    *
>> - * @data_pa:		NAND Physical port for Data.
>> - * @data_va:		NAND port for Data.
>> - * @cmd_va:		NAND port for Command.
>> - * @addr_va:		NAND port for Address.
>> - * @regs_va:		FSMC regs base address.
>> + * @dev_timings:	Timings to be programmed in controller
>> + * @partitions:		Partition info for a NAND Flash
>> + * @nr_partitions:	Total number of partition of a NAND flash
>> + * @mode:		Defines the NAND device access mode
>> + *			Can be one of:
>> + *			- DMA access
>> + *			- Word access (CPU)
>> + *			- None (Use driver default ie bus width specific
>> + *			  CPU access)
>> + * @select_chip:	Select a particular bank
>> + *
>> + * @data_pa:		NAND Physical port for Data
>> + * @data_va:		NAND port for Data
>> + * @cmd_va:		NAND port for Command
>> + * @addr_va:		NAND port for Address
>> + * @regs_va:		FSMC regs base address
>>    */
>>   struct fsmc_nand_data {
>>   	u32			pid;
>>   	struct mtd_info		mtd;
>>   	struct nand_chip	nand;
>> -	struct mtd_partition	*partitions;
>> -	unsigned int		nr_partitions;
>> -
>> -	struct fsmc_eccplace	*ecc_place;
>> -	unsigned int		bank;
>>   	struct device		*dev;
>> -	enum access_mode	mode;
>>   	struct clk		*clk;
>> +	struct fsmc_eccplace	*ecc_place;
>> +	unsigned int		bank;
>>
>>   	/* DMA related objects */
>>   	struct dma_chan		*read_dma_chan;
>>   	struct dma_chan		*write_dma_chan;
>>   	struct completion	dma_access_complete;
>>
>> +	/* Recieved from plat data */
>>   	struct fsmc_nand_timings *dev_timings;
>> +	struct mtd_partition	*partitions;
>> +	unsigned int		nr_partitions;
> where do you use those execpt at probe time

Yes, I can remove it completely. Thanks for that
