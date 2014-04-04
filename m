Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW4p7-0003Ap-Ix
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 14:10:36 +0000
Date: Fri, 4 Apr 2014 11:09:34 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH v2] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Message-ID: <20140404140933.GA25772@arch.cereza>
References: <1396597089-1081-1-git-send-email-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1396597089-1081-1-git-send-email-abrodkin@synopsys.com>
Cc: devicetree@vger.kernel.org, Francois Bedard <Francois.Bedard@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 04, Alexey Brodkin wrote:
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 

Maybe it would be nice adding some driver description here, so the commit
log actually says something useful about the commit.

[..]
> Reviewed-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> 
> +/**
> + * axs_flag_wait_and_reset - Waits until requested flag in INT_STATUS register
> + *              is set by HW and resets it by writing "1" in INT_CLR_STATUS.
> + * @host:	Pointer to private data structure.
> + * @flag:	Bit/flag offset in INT_STATUS register
> + */
> +static void axs_flag_wait_and_reset(struct axs_nand_host *host, int flag)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < AXS_FLAG_WAIT_DELAY * 100; i++) {
> +		unsigned int status = reg_get(host, INT_STATUS);
> +
> +		if (status & (1 << flag)) {
> +			reg_set(host, INT_CLR_STATUS, 1 << flag);
> +			return;
> +		}
> +
> +		udelay(10);
> +	}
> +
> +	/*
> +	 * Since we cannot report this problem any further than
> +	 * axs_nand_{write|read}_buf() letting user know there's a problem.
> +	 */
> +	dev_err(host->dev, "Waited too long (%d s.) for flag/bit %d\n",
> +		AXS_FLAG_WAIT_DELAY, flag);
> +}

Hm... I'm not sure the above is really true.

The NAND core uses the replaceable chip->waitfunc callback to check the
status of issued commands. See for instance:

static int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
                              int page)
{
        int status = 0;
        const uint8_t *buf = chip->oob_poi;
        int length = mtd->oobsize;

        chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
        chip->write_buf(mtd, buf, length);
        /* Send command to program the OOB data */
        chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);

        status = chip->waitfunc(mtd, chip);

        return status & NAND_STATUS_FAIL ? -EIO : 0;
}

On the other side, if you are clearing the flags in axs_flag_wait_and_reset()
it might be a bit hard for you to get this right.

IOW, I'm not saying you *must* do this, but instead suggesting that you take
a look at waitfunc() and see if it helps report a proper error in the
read/write path.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
