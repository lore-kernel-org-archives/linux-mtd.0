Date: Tue, 10 Dec 2013 18:13:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 28/36] mtd: st_spi_fsm: Supply a busy wait for
 post-write status
Message-ID: <20131211021311.GM27149@ld-irv-0074.broadcom.com>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-29-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385727565-25794-29-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 29, 2013 at 12:19:17PM +0000, Lee Jones wrote:
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
> @@ -292,6 +308,42 @@ static int stfsm_enter_32bit_addr(struct stfsm *fsm, int enter)
>  	return 0;
>  }
>  
> +static uint8_t stfsm_wait_busy(struct stfsm *fsm)
> +{
> +	struct stfsm_seq *seq = &stfsm_seq_read_status_fifo;
> +	unsigned long deadline;
> +	uint32_t status;
> +
> +	/* Use RDRS1 */
> +	seq->seq_opc[0] = (SEQ_OPC_PADS_1 |
> +			   SEQ_OPC_CYCLES(8) |
> +			   SEQ_OPC_OPCODE(FLASH_CMD_RDSR));
> +
> +	/* Load read_status sequence */
> +	stfsm_load_seq(fsm, seq);
> +
> +	/* Repeat until busy bit is deasserted, or timeout */
> +	deadline = jiffies + FLASH_MAX_BUSY_WAIT;
> +	do {
> +		cond_resched();
> +
> +		stfsm_wait_seq(fsm);
> +
> +		stfsm_read_fifo(fsm, &status, 4);
> +
> +		if ((status & FLASH_STATUS_BUSY) == 0)
> +			return 0;
> +
> +		/* Restart */
> +		writel(seq->seq_cfg, fsm->base + SPI_FAST_SEQ_CFG);
> +
> +	} while (!time_after_eq(jiffies, deadline));

You have a timeout problem here, similar to the one I mentioned earlier,
except that in this one, your do/while at least ensures that you always
run the loop at least once... but still, what if "a long time" elapses
between stfsm_read_fifo() and checking time_after_eq()?

I think you want something like this after the while():

	stfsm_read_fifo(fsm, &status, 4);
	if ((status & FLASH_STATUS_BUSY) == 0)
		return 0;

> +	dev_err(fsm->dev, "timeout on wait_busy\n");
> +
> +	return -EIO;
> +}
> +
>  static int stfsm_wrvcr(struct stfsm *fsm, uint8_t data)
>  {
>  	struct stfsm_seq *seq = &stfsm_seq_wrvcr;

Brian
