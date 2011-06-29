Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbnwV-00015L-2V
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 06:08:07 +0000
Received: by iyn15 with SMTP id 15so954182iyn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 23:07:16 -0700 (PDT)
Subject: Re: [PATCH 1/6] nand_wait_ready timeout fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Wed, 29 Jun 2011 09:08:08 +0300
In-Reply-To: <4E09EEA9.2040307@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309247324.23597.37.camel@sauron> <4E09EEA9.2040307@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309327692.23597.99.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 17:09 +0200, Matthieu CASTET wrote:
> >>  	struct nand_chip *chip = mtd->priv;
> >> -	unsigned long timeo = jiffies + 2;
> >> +	unsigned long timeo = jiffies + (2 * HZ) / 1000;
> > 
> > I agree that the code is buggy, but your fix is strange: if HZ = 100, (2
> > * HZ) / 1000 will be zero?
> > 
> > I think you should instead know for how many msecs you want to wait, and
> > use msecs_to_jiffies().
> > 
> Your right, I assume the code was written for HZ=100, and the code should wait
> for 20 ms :
> unsigned long timeo = jiffies + (20 * HZ) / 1000;
> 
> this will match with the
> static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
> {
> 
>     unsigned long timeo = jiffies;
>     int status, state = chip->state;
> 
>     if (state == FL_ERASING)
>         timeo += (HZ * 400) / 1000;
>     else
>         timeo += (HZ * 20) / 1000;
> [...]
> }

I think we should use msecs_to_jiffies() in nand_wait() as well. Why
relying on weird calculations with HZ?

-- 
Best Regards,
Artem Bityutskiy
