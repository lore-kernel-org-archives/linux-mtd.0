Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg6KI-0001eo-32
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 09:01:39 +0000
Received: by mail-wr0-x242.google.com with SMTP id 89so7782281wrr.1
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 01:01:17 -0800 (PST)
Subject: Re: [PATCH 03/11] nand: spi: Abstract SPI NAND cmd set to functions
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com, linux-mtd@lists.infradead.org
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-4-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <93b3dd4d-426e-3165-8316-73108847d123@gmail.com>
Date: Tue, 21 Feb 2017 10:01:13 +0100
MIME-Version: 1.0
In-Reply-To: <1487664010-25926-4-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Peter.
First thank you for this effort to finally bring the spinand framework 
back on stage.

On 21/02/2017 09:00, Peter Pan wrote:
> This commit abstracts basic SPI NAND commands to
> functions in spi-nand-base.c. Because command sets
> have difference by vendors, we create spi-nand-cmd.c
> to define this difference by command config table.
>
> [...]
> +
> +/**
> + * spi_nand_read_page_to_cache - send command 13h to read data from Nand
> + * to cache
> + * @chip: SPI-NAND device structure
> + * @page_addr: page to read
> + */
> +static int spi_nand_read_page_to_cache(struct spi_nand_chip *chip,
> +					u32 page_addr)
> +{
> +	struct spi_nand_cmd cmd;
> +
> +	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
> +	cmd.cmd = SPINAND_CMD_PAGE_READ;
> +	cmd.n_addr = 3;
> +	cmd.addr[0] = (u8)(page_addr >> 16);
> +	cmd.addr[1] = (u8)(page_addr >> 8);
> +	cmd.addr[2] = (u8)page_addr;
> +
> +	return spi_nand_issue_cmd(chip, &cmd);
> +}

Just a question. Don't you try to map too exactly the spi_nand_cmd to 
the internal micron SPI command ?
Why "cmd.addr" should be a byte array, and not a u32, leaving each chip 
to details to handle the u32 to SPI byte stream mapping.


> +
> +/**
> + * spi_nand_read_from_cache - read data out from cache register
> + * @chip: SPI-NAND device structure
> + * @page_addr: page to read
> + * @column: the location to read from the cache
> + * @len: number of bytes to read
> + * @rbuf: buffer held @len bytes
> + * Description:
> + *   Command can be 03h, 0Bh, 3Bh, 6Bh, BBh, EBh
> + *   The read can specify 1 to (page size + spare size) bytes of data read at
> + *   the corresponding locations.
> + *   No tRd delay.
> + */
> +static int spi_nand_read_from_cache(struct spi_nand_chip *chip,
> +		u32 page_addr, u32 column, size_t len, u8 *rbuf)
> +{
> +	struct nand_device *nand = &chip->base;
> +	struct spi_nand_cmd cmd;
> +
> +	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
> +	cmd.cmd = chip->read_cache_op;
> +	cmd.n_addr = 2;
> +	cmd.addr[0] = (u8)(column >> 8);
> +	if (chip->options & SPINAND_NEED_PLANE_SELECT)
> +		cmd.addr[0] |= (u8)((nand_page_to_eraseblock(nand, page_addr)
> +				& 0x1) << 4);
> +	cmd.addr[1] = (u8)column;
> +	cmd.n_rx = len;
> +	cmd.rx_buf = rbuf;
> +
> +	return spi_nand_issue_cmd(chip, &cmd);
> +}
> +
Some reasons to handle the plane concept (Micron specific), and even 
move the fact that it touch the bit 4 of cdm.addr[0], in common code ?

Regards,
Arnaud
