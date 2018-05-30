Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fO57o-0001TJ-Q2
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 17:43:06 +0000
Received: by mail-lf0-x244.google.com with SMTP id n3-v6so5604333lfe.12
 for <linux-mtd@lists.infradead.org>; Wed, 30 May 2018 10:42:54 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Shreeya Patel <shreeya.patel23498@gmail.com>,
 Arvind Yadav <arvind.yadav.cs@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/6 v2] mtd: rawnand: ams-delta: use GPIO lookup table
Date: Wed, 30 May 2018 19:43:09 +0200
Message-ID: <1543045.tPZatK9yHU@z50>
In-Reply-To: <20180530110500.185b5b7b@bbrezillon>
References: <CAHp75Ved2nw1JKnXT2Jxnw4XLsby1eVJU6cfBjE2sp4LP4Kwmg@mail.gmail.com>
 <20180525222046.11200-1-jmkrzyszt@gmail.com>
 <20180530110500.185b5b7b@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, May 30, 2018 11:05:00 AM CEST Boris Brezillon wrote:
> Hi Janusz,

Hi Boris,

> On Sat, 26 May 2018 00:20:45 +0200
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> > ...
> > Changes since v1:
> > - fix handling of devm_gpiod_get_optional() return values - thanks to
> >   Andy Shevchenko.
> 
> Can you put the changelog after the "---" separator so that it does not
> appear in the final commit message?

Yes, sure, sorry for that.

> > +err_gpiod:
> > +	if (err == -ENODEV || err == -ENOENT)
> > +		err = -EPROBE_DEFER;
> 
> Hm, isn't it better to make gpiod_find() return ERR_PTR(-EPROBE_DEFER)
> here [1]? At least, ENOENT should not be turned into EPROBE_DEFER,
> because it's returned when there's no entry matching the requested gpio
> in the lookup table, and deferring the probe won't solve this problem.

ENOENT is also returned when no matching lookup table is found. That may 
happen if consumer dev_name stored in the table differs from dev_name assigned 
to the consumer by its bus, the platform bus in this case. For that reason I 
think the consumer dev_name should be initialized in the table after the 
device is registered, when its actual dev_name can be obtained. If that device 
registration happens after the driver is already registered, e.g., at 
late_initcall, the device is probed before its lookup table is ready. For that 
reason returning EPROBE_DEFER seems better to me even in the ENOENT case.

Thanks,
Janusz
