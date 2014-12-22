Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y35Bz-0000Ds-5T
 for linux-mtd@lists.infradead.org; Mon, 22 Dec 2014 15:46:43 +0000
Message-ID: <54983C57.6070403@imgtec.com>
Date: Mon, 22 Dec 2014 12:44:23 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: =?gbk?Q?=22Qi_Wang_=CD=F5=C6=F0_=28qiwang=29=22?= <qiwang@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 4/6] mtd: Introduce SPI NAND framework
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-5-git-send-email-ezequiel.garcia@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A049EE77@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7713CD34@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7713CD34@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 James Hartley <james.hartley@imgtec.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 =?gbk?Q?=22Pe?= =?gbk?Q?ter_Pan_=C5=CB=B6=B0_=28peterpandong=29=22?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Qi Wang,

Thanks for the review,

On 12/22/2014 01:34 AM, Qi Wang ÍõÆð (qiwang) wrote:
> Hi Ezequiel,
> 
>> +/*
>> + * Wait until the status register busy bit is cleared.
>> + * Returns a negatie errno on error or time out, and a non-negative
>> +status
>> + * value if the device is ready.
>> + */
>> +static int spi_nand_wait_till_ready(struct spi_nand *snand) {
>> +	unsigned long deadline = jiffies + msecs_to_jiffies(100);
> 
> 100ms will be applied to all operation, but I think it would be more
> make sense to use different timeout value for different operation, 
> just like Parallel NAND as below:
> "

Yes, indeed. You are right. Now we need to find out the appropriate
value in each case. Any suggestions?

> static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
> {
> 
> 	int status, state = chip->state;
> 	unsigned long timeo = (state == FL_ERASING ? 400 : 20);
> "	
> 
> 
>> +static int spi_nand_write(struct spi_nand *snand) {
>> +	int ret;
>> +
>> +	/* Store the page to cache */
>> +	ret = snand->store_cache(snand, 0, snand->buf_size, snand-
>>> data_buf);
>> +	if (ret < 0) {
>> +		dev_err(snand->dev, "error %d storing page 0x%x to cache\n",
>> +			ret, snand->page_addr);
>> +		return ret;
>> +	}
>> +
>> +	ret = spi_nand_wait_till_ready(snand);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = snand->write_enable(snand);
>> +	if (ret < 0) {
>> +		dev_err(snand->dev, "write enable command failed\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Get page from the device cache into our internal buffer */
>> +	ret = snand->write_page(snand, snand->page_addr);
> 
> 
> The page program sequence in datasheet is write_enable->program_load->
> program_execute->read_status. Seems different with the procedure in 
> your code.
> 	

Right. I thought calling write_enable() before actually programming the
page would be enough. Do you think we should do it before the cache
programming instead?

And what happens if it fails, will we need to call write_disable explicitly?

-- 
Ezequiel
