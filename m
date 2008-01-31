From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Richard Purdie'" <rpurdie@rpsys.net>,
	"'David Woodhouse'" <dwmw2@infradead.org>,
	"'linux-mtd'" <linux-mtd@lists.infradead.org>
References: <1201607970.5017.50.camel@localhost.localdomain>
Subject: RE: [RFC PATCH 3/3] Add panic_write function to the onenand driver
Date: Thu, 31 Jan 2008 11:05:45 +0900
Message-ID: <003e01c863ad$ce6ef790$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <1201607970.5017.50.camel@localhost.localdomain>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> +static void onenand_panic_wait(struct mtd_info *mtd)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	unsigned int interrupt;
> +	int i;
> +
> +	for (i = 0; i < 20; i++) {
> +		interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
> +		if (interrupt & ONENAND_INT_MASTER)
> +			break;
> +		udelay(1000);
> +	}
> +}

Umm it's waiting with maximum 20msec. how about the increase the index to 20*1000 and use udelay(1).
If we use the busy-waiting, it uses the max 3msec in case of erase.

Anyway I think you don't use the onenand_wait since it has cond_resched(). It's better to use the existing function in case of
panic_write.
Okay try to think what's the better way.

> + */
> +static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
> +			 size_t *retlen, const u_char *buf)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	int column, subpage;
> +	int written = 0;
> +	int ret = 0;
> +
> +	if (this->state == FL_PM_SUSPENDED)
> +		return -EBUSY;
> +
> +	/* Wait for any existing operation to clear */
> +	onenand_panic_wait(mtd);

Reasonable!

> +
> +		this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, mtd->writesize);
> +		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, mtd->oobsize);
> +
> +		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
> +
> +		onenand_panic_wait(mtd);

It has to check the return value and update the bufferram. If not, we can read the wrong data later.

Thank you,
Kyungmin Park
