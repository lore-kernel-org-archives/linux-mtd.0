Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VocUq-0006iN-TQ
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 17:13:53 +0000
Date: Thu, 5 Dec 2013 09:13:26 -0800
From: Tony Lindgren <tony@atomide.com>
To: Peter Meerwald <pmeerw@pmeerw.net>
Subject: Re: OMAP3 NAND ECC selection
Message-ID: <20131205171326.GA26766@atomide.com>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
 <52A04E75.3010609@corscience.de>
 <alpine.DEB.2.01.1312051711410.20976@pmeerw.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.01.1312051711410.20976@pmeerw.net>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Andreas =?utf-8?B?Qmllw59tYW5u?= <andreas.biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Peter Meerwald <pmeerw@pmeerw.net> [131205 08:13]:
> > >> I'd like to be able to update MLO and u-boot from within a booted Linux
> > >> system on the device (I have to resort to u-boot for that where I can
> > >> control the ECC scheme used)
> 
> > > Meanwhile, to do this we use a small userspace program created by
> > > Javier Martinez in order to flash the MLO in our OMAP3 boards. See
> > > http://git.isee.biz/?p=pub/scm/writeloader.git;a=summary
> 
> > we used another aproach here. See
> > http://article.gmane.org/gmane.linux.drivers.mtd/43804
> 
> pretty much what I have been looking for, thanks!

Hmm well both methods should work, but is there anything stopping us
merging the module param patch to the mainline tree?

Regards,

Tony
