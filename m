Received: from mail-bn1on0065.outbound.protection.outlook.com ([157.56.110.65]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzQ9t-0007f6-7u
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 13:53:42 +0000
Message-ID: <556C62E2.3030808@opensource.altera.com>
Date: Mon, 1 Jun 2015 08:49:22 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V4 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
References: <1427117782-14764-1-git-send-email-grmoore@opensource.altera.com>
 <1427117782-14764-2-git-send-email-grmoore@opensource.altera.com>
 <20150520222606.GQ11598@ld-irv-0074>
In-Reply-To: <20150520222606.GQ11598@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/20/2015 05:26 PM, Brian Norris wrote:
> On Mon, Mar 23, 2015 at 08:36:22AM -0500, Graham Moore wrote:
...
I'm fixing the sparse, smatch, unused variables, etc.
...
>> +	if (n_tx && opcode == SPINOR_OP_WD_EVCR &&
>> +	    !(txbuf[0] & EVCR_QUAD_EN_MICRON)) {
>> +		struct cqspi_flash_pdata *f_pdata;
>> +
>> +		f_pdata = &cqspi->f_pdata[cqspi->current_cs];
>> +		f_pdata->quad_mode_set = 1;
>
> No, please don't do this. The whole point of the spi-nor layer is that
> we don't want low-level drivers having to snoop every type of flash
> command. We want to have proper feedback between spi-nor.c and your
> driver, so you *know* when you're using a quad-enabled device.
>
> Food for thought: what happens for a non-Micron SPI flash that uses quad
> mode?
>
> Is it sufficient to just check if nor->flash_read == SPI_NOR_QUAD?
>

I *said* it was ugly :)

Here's the deal.  The Cadence controller has its own quad mode setting, 
which must match the setting of the chip (or the quad-mode command.) 
Before the addition of micron_quad_enable(), spi-nor was using a 
quad-mode read command.  That was all good, because we could use 
nor->flash_read == SPI_NOR_QUAD to set the Cadence controller properly.

However, micron_quad_enable() sets quad mode in the Micron chip.  At 
that point, all communication with the chip must be in quad mode, even 
the very next read-status command.  The micron_quad_enable() function 
reads status and EVCR register to see if the quad-mode command 'took'. 
This all happens before nor->flash_read is set to SPI_NOR_QUAD.  If I 
don't set the Cadence controller into quad mode immediately after the 
chip is set into quad mode, then status is garbage and the probe fails.

I agree that any other chip with a quad mode, separate from quad 
commands, will be jacked up too.

So...how can I know when to set the Cadence controller into quad mode?
  Perhaps the micron_quad_enable() should set nor->flash_read = 
SPI_NOR_QUAD as soon as it sends the command to the chip?

...

-Graham
