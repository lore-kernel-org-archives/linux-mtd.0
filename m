Subject: Re: [patch for 2.6.33? 1/1] mtd/nand: fix build failure caused by typo
From: David Woodhouse <dwmw2@infradead.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20100203080725.GA11354@pengutronix.de>
References: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
	<20100203080725.GA11354@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Feb 2010 18:15:55 +0000
Message-ID: <1265825755.2529.2125.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hsweeten@visionengravers.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, peterhuewe@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-02-03 at 09:07 +0100, Uwe Kleine-König wrote:
> Hello Andrew,
> 
> > From: Peter Huewe <peterhuewe@gmx.de>
> > 
> > Fix a build failure introduced by the patch
> > 
> >     mtd: orion_nand.c: add error handling and use resource_size()
> > 
> > The patch assigns something to a undeclared variable 'err', whereas the
> > rest of the code uses 'ret' for this task.
>
> why did you add a ? to the subject?  IMHO it should go in 2.6.33 as
> it's an obvious build fix. 

The build error isn't in 2.6.33 though -- it's only in linux-next.

Patch applied; thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
