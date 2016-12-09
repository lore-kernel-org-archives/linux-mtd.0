Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFLNA-000830-Az
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 13:38:01 +0000
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 <linux-mtd@lists.infradead.org>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Joel
 Stanley" <joel@jms.id.au>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <08dc9a53-505f-0b79-5bb3-1d9e73166b6c@atmel.com>
Date: Fri, 9 Dec 2016 14:37:36 +0100
MIME-Version: 1.0
In-Reply-To: <1478688149-4554-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cedric,

Le 09/11/2016 à 11:42, Cédric Le Goater a écrit :
> This driver adds mtd support for spi-nor attached to either or both of
> the Firmware Memory Controller or the SPI Flash Controller (AST2400
> only).
> 
> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
> ones found on the AST2400. The differences are on the number of
> supported flash modules and their default mappings in the SoC address
> space.
> 
> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
> for the host firmware. All controllers have now the same set of
> registers compatible with the AST2400 FMC controller and the legacy
> 'SMC' controller is fully gone.
> 
> Each controller has a memory range on which it maps its flash module
> slaves. Each slave is assigned a memory window for its mapping that
> can be changed at bootime with the Segment Address Register.
> 
> Each SPI flash slave can then be accessed in two modes: Command and
> User. When in User mode, accesses to the memory segment of the slaves
> are translated in SPI transfers. When in Command mode, the HW
> generates the SPI commands automatically and the memory segment is
> accessed as if doing a MMIO.
> 
> Currently, only the User mode is supported. Command mode needs a
> little more work to check that the memory window on the AHB bus fits
> the module size.
> 
> Based on previous work from Milton D. Miller II <miltonm@us.ibm.com>
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
[...]
> +static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
> +	aspeed_smc_read_from_ahb(buf, chip->base, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return 0;
> +}
> +
> +static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
> +				int len)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
> +	aspeed_smc_write_to_ahb(chip->base, buf, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return 0;
> +}
> +
[...]
> +static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
> +				    size_t len, u_char *read_buf)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> +	aspeed_smc_read_from_ahb(read_buf, chip->base, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return len;
> +}
> +
> +static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
> +				     const u_char *write_buf)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
> +	aspeed_smc_write_to_ahb(chip->base, write_buf, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return len;
> +}

As I've explained in review of the series v1, the chip->controller->mutex
seems to be used only by aspeed_smc_read_reg(), aspeed_smc_write_reg(),
aspeed_smc_read_user() and aspeed_smc_write_user(), the driver
implementations of nor->read_reg(), nor->write_reg(), nor->read() and
nor->write().

This driver locks the mutex at the very beginning of each of those
functions and unlocks the mutex before returning.

So my understanding is that you use this mutex to prevent
aspeed_smc_[read|write]_[reg|user]() from being called concurrently.

If so, the spi-nor framework already takes care of this issue with the
couple of functions: spi_nor_lock_and_prep() / spi_nor_unlock_and_unprep().

Indeed, spi_nor_lock_and_prep() is called on entering and
spi_nor_unlock_and_unprep() on exiting each of the following functions:
- mtd->_read = spi_nor_read
- mtd->_write = spi_nor_write / sst_write
- mtd->_erase = spi_nor_erase
- mtd->_lock = spi_nor_lock
- mtd->_unlock = spi_nor_unlock
- mtd->_is_lock = spi_nor_is_locked

Except for spi_nor_scan(), which is called once for all during the probe
and before registering the mtd_info structure, only the above
mtd->_<handlers> call the nor->read_reg, nor->write_reg, nor->read,
nor->erase and nor->write spi-nor handlers.
So your spi-nor / aspeed_smc_<handlers> are always protected from
concurrent access by the mutex locked in spi_nor_lock_and_prep().

So don't worry about concurrent access issue, the spi-nor framework takes
care of you :)

Best regards,

Cyrille
