Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ty788-0006Tj-7a
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2013 20:41:09 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] goldfish: NAND flash driver
In-Reply-To: <20130121234502.19934.61017.stgit@bob.linux.org.uk> (Alan Cox's
 message of "Mon, 21 Jan 2013 23:45:10 +0000")
References: <20130121234502.19934.61017.stgit@bob.linux.org.uk>
Date: Wed, 23 Jan 2013 21:41:02 +0100
Message-ID: <87r4lboco1.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alan Cox <alan@linux.intel.com> writes:
... zip ...

Hi Alan,
I have a couple of questions on your patch.

> +static u32 goldfish_nand_cmd_with_params(struct mtd_info *mtd,
> +			enum nand_cmd cmd, u64 addr, u32 len,
> +			void *ptr, u32 *rv)
> +{
> +	u32 cmdp;
> +	struct goldfish_nand *nand = mtd->priv;
> +	struct cmd_params *cps = nand->cmd_params;
> +	unsigned char __iomem  *base = nand->base;
> +
> +	if (cps == NULL)
> +		return -1;
> +
> +	switch (cmd) {
> +	case NAND_CMD_ERASE:
> +		cmdp = NAND_CMD_ERASE_WITH_PARAMS;
> +		break;
> +	case NAND_CMD_READ:
> +		cmdp = NAND_CMD_READ_WITH_PARAMS;
> +		break;
> +	case NAND_CMD_WRITE:
> +		cmdp = NAND_CMD_WRITE_WITH_PARAMS;
> +		break;
> +	default:
> +		return -1;
> +	}
> +	cps->dev = mtd - nand->mtd;
> +	cps->addr_high = (u32)(addr >> 32);
> +	cps->addr_low = (u32)addr;
> +	cps->transfer_size = len;
> +	cps->data = (u32)ptr;
> +	writel(cmdp, base + NAND_COMMAND);
What guarantee do you have on the order of writes here ? Isn't a write barrier
required here ?


> +	*rv = cps->result;
> +	return 0;
> +}
> +
> +static u32 goldfish_nand_cmd(struct mtd_info *mtd, enum nand_cmd cmd,
> +				u64 addr, u32 len, void *ptr)
> +{
> +	struct goldfish_nand *nand = mtd->priv;
> +	u32 rv;
> +	unsigned long irq_flags;
> +	unsigned char __iomem  *base = nand->base;
> +
> +	spin_lock_irqsave(&nand->lock, irq_flags);
Why this spin_lock and not a mutex ? I didn't see any interrupts used in this
driver, have I missed something ?

> +	if (goldfish_nand_cmd_with_params(mtd, cmd, addr, len, ptr, &rv)) {
> +		writel(mtd - nand->mtd, base + NAND_DEV);
> +		writel((u32)(addr >> 32), base + NAND_ADDR_HIGH);
> +		writel((u32)addr, base + NAND_ADDR_LOW);
> +		writel(len, base + NAND_TRANSFER_SIZE);
> +		writel((u32)ptr, base + NAND_DATA);
> +		writel(cmd, base + NAND_COMMAND);
> +		rv = readl(base + NAND_RESULT);
Same question here on the order of the read wrt to previous writes.

> +	}
> +	spin_unlock_irqrestore(&nand->lock, irq_flags);
> +	return rv;
> +}
> +
> +static int goldfish_nand_erase(struct mtd_info *mtd, struct erase_info *instr)
> +{
> +	loff_t ofs = instr->addr;
> +	u32 len = instr->len;
> +	u32 rem;
> +
> +	if (ofs + len > mtd->size)
> +		goto invalid_arg;
I don't think that test is required, the MTD API gives already that guarantee
AFAIR.

... zip ...

> +static int goldfish_nand_read_oob(struct mtd_info *mtd, loff_t ofs,
> +				struct mtd_oob_ops *ops)
> +{
> +	u32 rem;
> +
> +	if (ofs + ops->len > mtd->size)
> +		goto invalid_arg;
Ditto.

...zip...

> +static int goldfish_nand_write_oob(struct mtd_info *mtd, loff_t ofs,
> +				struct mtd_oob_ops *ops)
> +{
> +	u32 rem;
> +
> +	if (ofs + ops->len > mtd->size)
> +		goto invalid_arg;
Ditto.

...zip...

> +static int goldfish_nand_read(struct mtd_info *mtd, loff_t from, size_t len,
> +				size_t *retlen, u_char *buf)
> +{
> +	u32 rem;
> +
> +	if (from + len > mtd->size)
> +		goto invalid_arg;
Ditto.

..zip...

> +static int goldfish_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
> +				size_t *retlen, const u_char *buf)
> +{
> +	u32 rem;
> +
> +	if (to + len > mtd->size)
> +		goto invalid_arg;
Ditto.

> +static int nand_setup_cmd_params(struct platform_device *pdev,
> +						struct goldfish_nand *nand)
> +{
> +	u64 paddr;
> +	unsigned char __iomem  *base = nand->base;
> +
> +	nand->cmd_params = devm_kzalloc(&pdev->dev,
> +					sizeof(struct cmd_params), GFP_KERNEL);
> +	if (!nand->cmd_params)
> +		return -1;
> +
> +	paddr = __pa(nand->cmd_params);
That looks weird (the __pa()) usage. I thought drivers should not use __pa()
directly.

> +	writel((u32)(paddr >> 32), base + NAND_CMD_PARAMS_ADDR_HIGH);
> +	writel((u32)paddr, base + NAND_CMD_PARAMS_ADDR_LOW);
> +	return 0;
> +}
> +
> +static int goldfish_nand_init_device(struct platform_device *pdev,
> +					struct goldfish_nand *nand, int id)
> +{
> +	u32 name_len;
> +	u32 result;
> +	u32 flags;
> +	unsigned long irq_flags;
> +	unsigned char __iomem  *base = nand->base;
> +	struct mtd_info *mtd = &nand->mtd[id];
> +	char *name;
> +
> +	spin_lock_irqsave(&nand->lock, irq_flags);
Again same spin_lock question.

Cheers.

-- 
Robert
