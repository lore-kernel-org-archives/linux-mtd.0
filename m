Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbTFt-0002xN-4t
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 08:02:45 +0000
Received: by pvg20 with SMTP id 20so3793286pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 01:02:39 -0700 (PDT)
Subject: Re: [PATCH 3/6] refactor mtd wait code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Tue, 28 Jun 2011 11:03:30 +0300
In-Reply-To: <1309248031.23597.45.camel@sauron>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-3-git-send-email-matthieu.castet@parrot.com>
	<1309248031.23597.45.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309248214.23597.47.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 11:00 +0300, Artem Bityutskiy wrote:
> On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
> > +/**
> > +  * This is call after sending a read command, or for autoincrement
> > +  * chip that need it (!NAND_NO_READRDY).
> > +  *
> > +  * We can't call NAND_CMD_STATUS here, because the read command
> > +  * is not finished
> > +  */
> > +static void nand_wait_read(struct mtd_info *mtd, struct nand_chip *chip)
> > +{
> > +	/*
> > +	 * If we don't have access to the busy pin, we apply the given
> > +	 * command delay
> > +	 */
> > +	if (!chip->dev_ready) {
> > +		udelay(chip->chip_delay);
> > +	}
> > +	else {
> > +		/* Apply this short delay always to ensure that we do wait tWB in
> > +		 * any case on any machine. */
> > +		ndelay(100);
> 
> Please, all these hard-coded numbers should be hidden in the specific
> driver.

Or could you please explain a bit better why this delay has to be part
of nand core? And why it is 100 and not 200?

-- 
Best Regards,
Artem Bityutskiy
