Received: from mail.meprolight.com ([194.90.149.17] helo=meprolight.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SehgS-0002an-93
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 07:08:05 +0000
From: Alex Gershgorin <alexg@meprolight.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 13 Jun 2012 10:06:50 +0300
Subject: RE: [PATCH] mtd: nand: mxc_nand fix compiler warning
Message-ID: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3334@MEP-EXCH.meprolight.com>
References: <1339499887-17859-1-git-send-email-alexg@meprolight.com>
 <20120612120115.GU22191@pengutronix.de>
 <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3332@MEP-EXCH.meprolight.com>,
 <20120612142443.GV22191@pengutronix.de>
In-Reply-To: <20120612142443.GV22191@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Uwe,

> > >Having said that, I prefer to have
>
> > >  http://mid.gmane.org/1335171381-24869-1-git-send-email-u.kleine-koen=
ig@pengutronix.de
> > > (and the follow-ups) applied. Casting away consts is nearly always
> > > wrong.
>
> I think this patch will solve the warnings problem only in mxc_nand drive=
r, but this patch also creates
>  new same problems to  other drivers that use struct of_device_id.
> > > >Yeah, but IMHO they are worth to be fixed. With your patch you assum=
e
> > > > that the data member will never be modified (and in fact it shouldn=
't).

No my patch only removes a compiler warning of the mxc_nand driver in curre=
nt version of the kernel.
=20
> > > > So the right thing is to make that assumption offical.
> > > > And for well-behaved drivers the fix is easy (i.e. spread a few con=
sts),
> > > > and bad drivers are forced to be fixed (or introduce casts for cons=
t
> > > > that hopefully will be catched during review).

Can you imagine how many drivers will require additional patches and what s=
hould be the level of fixation?
I do not know
But in general your idea is good, only in my opinion this requires a more i=
n-depth review.

Regards,
Alex






=20
