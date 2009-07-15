Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MR06Z-0007aR-IW
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 08:44:53 +0000
Subject: Re: [PATCH] mtdblock: introduce mtdblks_lock
From: Artem Bityutskiy <dedekind@infradead.org>
To: Matthias Kaehlcke <matthias@kaehlcke.net>
In-Reply-To: <20090715083603.GH18774@darwin>
References: <20090714200429.GD18774@darwin>
	<1247643714.11353.11.camel@localhost.localdomain>
	<20090715083603.GH18774@darwin>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Jul 2009 11:39:22 +0300
Message-Id: <1247647162.11353.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 10:36 +0200, Matthias Kaehlcke wrote:
> El Wed, Jul 15, 2009 at 10:41:54AM +0300 Artem Bityutskiy ha dit:
> 
> > On Tue, 2009-07-14 at 22:04 +0200, Matthias Kaehlcke wrote:
> > > +static struct mutex mtdblks_lock;
> > > +
> > >  /*
> > >   * Cache stuff...
> > >   *
> > > @@ -270,6 +272,8 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
> > >  
> > >  	DEBUG(MTD_DEBUG_LEVEL1,"mtdblock_open\n");
> > >  
> > > +	mutex_lock(&mtdblks_lock);
> > > +
> > >  	if (mtdblks[dev]) {
> > >  		mtdblks[dev]->count++;
> > >  		return 0;
> > 
> > Now about unlocking the mutex here?
> 
> i missed this one ...
> 
> thanks for your review. i'm going fix that and send out an updated
> version of the patch

Err, I've already amended your patch and put it to my l2-mtd-2.6.git:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=2a4d4fdb6393fdcbfea546b2474baf41d434302a

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
