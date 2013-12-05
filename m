Received: from ns.pmeerw.net ([87.118.82.44] helo=pmeerw.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VobXi-0005CG-QH
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 16:12:47 +0000
Date: Thu, 5 Dec 2013 17:12:23 +0100 (CET)
From: Peter Meerwald <pmeerw@pmeerw.net>
To: =?UTF-8?Q?Andreas_Bie=C3=9Fmann?= <andreas.biessmann@corscience.de>
Subject: Re: OMAP3 NAND ECC selection
In-Reply-To: <52A04E75.3010609@corscience.de>
Message-ID: <alpine.DEB.2.01.1312051711410.20976@pmeerw.net>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
 <52A04E75.3010609@corscience.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >> I'd like to be able to update MLO and u-boot from within a booted Linux
> >> system on the device (I have to resort to u-boot for that where I can
> >> control the ECC scheme used)

> > Meanwhile, to do this we use a small userspace program created by
> > Javier Martinez in order to flash the MLO in our OMAP3 boards. See
> > http://git.isee.biz/?p=pub/scm/writeloader.git;a=summary

> we used another aproach here. See
> http://article.gmane.org/gmane.linux.drivers.mtd/43804

pretty much what I have been looking for, thanks!

p.

-- 

Peter Meerwald
+43-664-2444418 (mobile)
