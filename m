Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeS1X-00031L-0n
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 14:24:47 +0000
Date: Tue, 12 Jun 2012 16:24:43 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Gershgorin <alexg@meprolight.com>
Subject: Re: [PATCH] mtd: nand: mxc_nand fix compiler warning
Message-ID: <20120612142443.GV22191@pengutronix.de>
References: <1339499887-17859-1-git-send-email-alexg@meprolight.com>
 <20120612120115.GU22191@pengutronix.de>
 <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3332@MEP-EXCH.meprolight.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3332@MEP-EXCH.meprolight.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 12, 2012 at 04:39:33PM +0300, Alex Gershgorin wrote:
> 
> On Tue, Jun 12, 2012 at 02:18:07PM +0300, Alex Gershgorin wrote:
> > This patch removes the following warning:
> > drivers/mtd/nand/mxc_nand.c:1246: warning: initialization discards qualifiers from pointer target type
> > drivers/mtd/nand/mxc_nand.c:1249: warning: initialization discards qualifiers from pointer target type
> > drivers/mtd/nand/mxc_nand.c:1252: warning: initialization discards qualifiers from pointer target type
> > drivers/mtd/nand/mxc_nand.c:1255: warning: initialization discards qualifiers from pointer target type
> >
> > Signed-off-by: Alex Gershgorin <alexg@meprolight.com>
> >
> > Applies to v3.5-rc2+
> > ---
> > >Better write the "Applies to" line after the tripple dash. Then this
> > >info doesn't make it into the commit log. Instead point out the
> > >offending commit.
> 
> Sorry my mistake
> 
> > >Having said that, I prefer to have
> 
> > >  http://mid.gmane.org/1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de
> > > (and the follow-ups) applied. Casting away consts is nearly always
> > > wrong.
> 
> I think this patch will solve the warnings problem only in mxc_nand driver, but this patch also creates
>  new same problems to  other drivers that use struct of_device_id.
Yeah, but IMHO they are worth to be fixed. With your patch you assume
that the data member will never be modified (and in fact it shouldn't).
So the right thing is to make that assumption offical.
And for well-behaved drivers the fix is easy (i.e. spread a few consts),
and bad drivers are forced to be fixed (or introduce casts for const
that hopefully will be catched during review).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
