Received: from mailf.telia.com ([194.22.194.25])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eOby-0002cH-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 00:00:50 +0000
Message-ID: <008901c2c8c0$1ee8e250$020120b0@jockeXP>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Eugene Surovegin" <ebs@ebshome.net>
Cc: <linux-mtd@lists.infradead.org>, "Marius Groeger" <mag@sysgo.de>
References: <5.1.0.14.2.20030130021112.020b0628@mail.ebshome.net> <5.1.0.14.2.20030130100614.038d9778@mail.ebshome.net> <5.1.0.14.2.20030130154710.03813208@mail.ebshome.net>
Subject: Re: PATCH: support for Arctic/Beech/Ebony
Date: Fri, 31 Jan 2003 01:31:39 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> At 02:37 PM 1/30/2003, Joakim Tjernlund wrote:
> 
> > > > > >   - You don't need mb() since ioremap will add the
> > > > > >      GUARDED attribute to the mapping.
> > > > >
> > > > > Well, this is not quite correct.
> > > > >
> > > > > GUARDED attribute does _NOT_ prevent reordering of loads and stores 
> > on PPC
> > > > > (on 4xx at least).
> > > > >
> > > > > See comments in asm-ppc/system.h and also IBM app note "Software
> > > > > consideration when migrating to the PowerPC 440GP from 405GP"
> > > > >
> > > >
> > > >hmm, maybe it's specific to the 8xx family. 860 and 862 does not do
> > > >speculative accesses on GUARDED memory.
> > >
> > > It does! But speculative accesses and access reordering are not the same
> > > thing :)
> >
> >what do you mean, does or does not do speculative accesses?
> 
> Sorry for being unclear.
NP
> 
> If I remember correctly, cache inhibited + guarded is enough for 8xx to 
> prevent both speculative access and load/store reordering.

OK, thanks.

> But this is not true for ALL PPC processors, 440GP is an example when this 
> is not enough
> 
> 
> > >
> > > There is a subtle difference.
> >
> >Yes I understand now, but I discussed this with my HW contact at Motorola 
> >and he agreed
> >that it was OK to remove the mb(). Maybe he was wrong or perhaps non 
> >speculative accesses
> >on mpc 860/862 also disables reorder? I can not find any statement that 
> >confirms this.
> >
> >Howerver I have been running our boards without the mb()'s for months now, 
> >no problem with
> >it so far.
> 
> Well, patch we are discussing is for 4xx, not for 8xx.

Yes, so the mb()'s should be put back.

Marius, sorry for the noise.

   Jocke
> 
> Eugene.
