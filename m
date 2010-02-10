Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NfI98-0002aY-TF
	for linux-mtd@lists.infradead.org; Wed, 10 Feb 2010 19:22:51 +0000
Received: by fg-out-1718.google.com with SMTP id 22so22999fge.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Feb 2010 11:22:44 -0800 (PST)
Subject: Re: [patch for 2.6.33? 1/1] mtd/nand: fix build failure caused by typo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1265825755.2529.2125.camel@macbook.infradead.org>
References: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
	<20100203080725.GA11354@pengutronix.de>
	<1265825755.2529.2125.camel@macbook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Feb 2010 21:22:25 +0200
Message-Id: <1265829745.21361.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hsweeten@visionengravers.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, peterhuewe@gmx.de,
	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-02-10 at 18:15 +0000, David Woodhouse wrote:
> On Wed, 2010-02-03 at 09:07 +0100, Uwe Kleine-König wrote:
> > Hello Andrew,
> > 
> > > From: Peter Huewe <peterhuewe@gmx.de>
> > > 
> > > Fix a build failure introduced by the patch
> > > 
> > >     mtd: orion_nand.c: add error handling and use resource_size()
> > > 
> > > The patch assigns something to a undeclared variable 'err', whereas the
> > > rest of the code uses 'ret' for this task.
> >
> > why did you add a ? to the subject?  IMHO it should go in 2.6.33 as
> > it's an obvious build fix. 
> 
> The build error isn't in 2.6.33 though -- it's only in linux-next.
> 
> Patch applied; thanks.

Oh, right. We were all confused :-) The problem is solved now.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
