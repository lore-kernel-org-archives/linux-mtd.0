Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKWHD-0008Gw-WA
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 10:04:19 +0000
Subject: RE: [RFC PATCH 3/3] Add panic_write function to the onenand driver
From: Richard Purdie <rpurdie@rpsys.net>
To: kmpark@infradead.org
In-Reply-To: <003e01c863ad$ce6ef790$1fa9580a@swcenter.sec.samsung.co.kr>
References: <1201607970.5017.50.camel@localhost.localdomain>
	<003e01c863ad$ce6ef790$1fa9580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain
Date: Thu, 31 Jan 2008 10:03:34 +0000
Message-Id: <1201773814.4996.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'linux-mtd' <linux-mtd@lists.infradead.org>,
	'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-01-31 at 11:05 +0900, Kyungmin Park wrote:
> > +static void onenand_panic_wait(struct mtd_info *mtd)
> > +{
> > +	struct onenand_chip *this = mtd->priv;
> > +	unsigned int interrupt;
> > +	int i;
> > +
> > +	for (i = 0; i < 20; i++) {
> > +		interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
> > +		if (interrupt & ONENAND_INT_MASTER)
> > +			break;
> > +		udelay(1000);
> > +	}
> > +}
> 
> Umm it's waiting with maximum 20msec. how about the increase the index to 20*1000 and use udelay(1).
> If we use the busy-waiting, it uses the max 3msec in case of erase.

I'm ok with changing it to use udelay(10). This function is going to be
rarely called so efficiency isn't a primary concern... 

> Anyway I think you don't use the onenand_wait since it has
> cond_resched(). It's better to use the existing function in case of
> panic_write.
> Okay try to think what's the better way.

Yes, I'm avoiding onenand_wait since we can't schedule in this context.
Other ideas welcome :)

> > + */
> > +static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
> > +			 size_t *retlen, const u_char *buf)
> > +{
> > +	struct onenand_chip *this = mtd->priv;
> > +	int column, subpage;
> > +	int written = 0;
> > +	int ret = 0;
> > +
> > +	if (this->state == FL_PM_SUSPENDED)
> > +		return -EBUSY;
> > +
> > +	/* Wait for any existing operation to clear */
> > +	onenand_panic_wait(mtd);
> 
> Reasonable!
> 
> > +
> > +		this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, mtd->writesize);
> > +		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, mtd->oobsize);
> > +
> > +		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
> > +
> > +		onenand_panic_wait(mtd);
> 
> It has to check the return value and update the bufferram. If not, we can read the wrong data later.

The key point with panic_write is there is unlikely to be any "later". I
don't mind putting the bufferram update calls back if you're happier
with that though.

Cheers,

Richard
