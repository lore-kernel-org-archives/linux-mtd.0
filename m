Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y35hE-0006Jf-MU
 for linux-mtd@lists.infradead.org; Mon, 22 Dec 2014 16:19:01 +0000
Message-ID: <549843EB.80008@imgtec.com>
Date: Mon, 22 Dec 2014 13:16:43 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: =?gbk?Q?=22Qi_Wang_=CD=F5=C6=F0_=28qiwang=29=22?= <qiwang@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 6/6] mtd: spi-nand: Support common SPI NAND devices
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-7-git-send-email-ezequiel.garcia@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A049EE65@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7713CD3C@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7713CD3C@NTXXIAMBX02.xacn.micron.com>
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



On 12/22/2014 01:34 AM, Qi Wang ÍõÆð (qiwang) wrote:
> Hi Ezequiel,
> 
>> +static struct nand_ecclayout ecc_layout_mt29f = {
>> +	.eccbytes = 32,
>> +	.eccpos = {
>> +		8, 9, 10, 11, 12, 13, 14, 15,
>> +		24, 25, 26, 27, 28, 29, 30, 31,
>> +		40, 41, 42, 43, 44, 45, 46, 47,
>> +		56, 57, 58, 59, 60, 61, 62, 63,
>> +	 },
> 
> Seems "OOB free" variable is missed. As below:
> 
> .oobfree = {
> { .offset = 2, .length = 6 },
> { .offset = 16, .length = 8 },
> { .offset = 32, .length = 8 },
> { .offset = 48, .length = 8 },
> },
> 

OK, great.

Have you tested this and made sure it works for MT29F and allows to
access the OOB?

> 
>> +static int spi_nand_send_command(struct spi_device *spi, int command,
>> +				 struct spi_nand_device_cmd *cmd) {
>> +	struct spi_message message;
>> +	struct spi_transfer x[4];
>> +
>> +	spi_message_init(&message);
>> +	memset(x, 0, sizeof(x));
>> +
>> +	/* Command */
>> +	cmd->cmd = command;
>> +	x[0].len = 1;
>> +	x[0].tx_buf = &cmd->cmd;
>> +	spi_message_add_tail(&x[0], &message);
>> +
>> +	/* Address */
>> +	if (cmd->n_addr) {
>> +		x[1].len = cmd->n_addr;
>> +		x[1].tx_buf = cmd->addr;
>> +		spi_message_add_tail(&x[1], &message);
>> +	}
>> +
>> +	/* Data to be transmitted */
>> +	if (cmd->n_tx) {
>> +		x[3].len = cmd->n_tx;
>> +		x[3].tx_buf = cmd->tx_buf;
>> +		spi_message_add_tail(&x[3], &message);
>> +	}
>> +
>> +	/* Data to be received */
>> +	if (cmd->n_rx) {
>> +		x[3].len = cmd->n_rx;
>> +		x[3].rx_buf = cmd->rx_buf;
>> +		spi_message_add_tail(&x[3], &message);
>> +	}
> 
> Only x[3] is used in above code, I suggest to separate transfer and received 
> For x[2] and x[3], in case some command need to send dummy byte before received any data.
> 

Ah, yes. Good catch.

>> +static int spi_nand_device_block_erase(struct spi_nand *snand,
>> unsigned
>> +int page_addr) {
>> +	struct spi_nand_device *snand_dev = snand->priv;
>> +	struct spi_nand_device_cmd *cmd = &snand_dev->cmd;
>> +
>> +	memset(cmd, 0, sizeof(struct spi_nand_device_cmd));
>> +	cmd->n_addr = 3;
>> +	cmd->addr[0] = 0;
> 
> Page address may beyond 16 bit in large density product. 
> So I don't think addr[0] can be forced to be set 0
> 

Right, this was a bad copy paste from the staging driver.

> 
>> +static int spi_nand_mt29f_read_id(struct spi_nand *snand, u8 *buf) {
>> +	struct spi_nand_device *snand_dev = snand->priv;
>> +	struct spi_nand_device_cmd *cmd = &snand_dev->cmd;
>> +
>> +	memset(cmd, 0, sizeof(struct spi_nand_device_cmd));
>> +	cmd->n_rx = SPI_NAND_MT29F_READID_LEN;
>> +	cmd->rx_buf = buf;
>> +
> 
> Micron SPI NAND need 1 more dummy byte before received ID data.
> Code for mt29f_read_id should be like this:
> 
> static int spi_nand_mt29f_read_id(struct spi_nand *snand, u8 *buf) {
> 	struct spi_nand_device *snand_dev = snand->priv;
> 	struct spi_nand_device_cmd *cmd = &snand_dev->cmd;
> 	u8 dummy = 0;
> 	memset(cmd, 0, sizeof(struct spi_nand_device_cmd));
> "
> 	cmd->n_tx = 1;
> 	cmd->tx_buf = &dummy;
> "
> 	cmd->n_rx = SPI_NAND_MT29F_READID_LEN;
> 	cmd->rx_buf = buf;
> 

That's true. However, notice the staging driver does not use any dummy
byte, and instead fakes it by reading an extra byte.

Maybe you can test this on a MT29F and point at all the required fixes?

Thanks a lot for the feedback!
-- 
Ezequiel
