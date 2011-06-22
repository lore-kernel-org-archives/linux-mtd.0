Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZFeX-0000dX-P1
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 05:07:02 +0000
Received: by pwi3 with SMTP id 3so444002pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 22:06:59 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: onenand/samsung.c: fix build error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 22 Jun 2011 08:07:41 +0300
In-Reply-To: <BANLkTi=MiT1PrcJMdAfegTg74BQYNHC2fw@mail.gmail.com>
References: <1308298176.13535.1.camel@phoenix>
	<1308298294.13535.3.camel@phoenix>
	<BANLkTi=MiT1PrcJMdAfegTg74BQYNHC2fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308719266.18119.31.camel@sauron>
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd@lists.infradead.org, Axel Lin <axel.lin@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-17 at 10:10 -0700, Brian Norris wrote:
> Hi,
> 
> On Fri, Jun 17, 2011 at 1:11 AM, Axel Lin <axel.lin@gmail.com> wrote:
> > -       err = mtd_device_parse_register(&info->mtd, NULL, 0,
> > +       err = mtd_device_parse_register(onenand->mtd, NULL, 0,
> >                        pdata ? pdata->parts : NULL,
> >                        pdata ? pdata->nr_parts : 0);

Yeah, just did this, thanks.

-- 
Best Regards,
Artem Bityutskiy
