Received: from vmmrnat.verisignmail.com ([216.168.230.187] helo=vmmr8.verisignmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eO3b-0002Zw-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 23:25:20 +0000
Message-Id: <5.1.0.14.2.20030130154710.03813208@mail.ebshome.net>
Date: Thu, 30 Jan 2003 15:56:00 -0800
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
From: Eugene Surovegin <ebs@ebshome.net>
Subject: Re: PATCH: support for Arctic/Beech/Ebony
Cc: <linux-mtd@lists.infradead.org>
In-Reply-To: <005d01c2c8b0$1fdb4be0$020120b0@jockeXP>
References: <5.1.0.14.2.20030130021112.020b0628@mail.ebshome.net>
 <5.1.0.14.2.20030130100614.038d9778@mail.ebshome.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 02:37 PM 1/30/2003, Joakim Tjernlund wrote:

> > > > >   - You don't need mb() since ioremap will add the
> > > > >      GUARDED attribute to the mapping.
> > > >
> > > > Well, this is not quite correct.
> > > >
> > > > GUARDED attribute does _NOT_ prevent reordering of loads and stores 
> on PPC
> > > > (on 4xx at least).
> > > >
> > > > See comments in asm-ppc/system.h and also IBM app note "Software
> > > > consideration when migrating to the PowerPC 440GP from 405GP"
> > > >
> > >
> > >hmm, maybe it's specific to the 8xx family. 860 and 862 does not do
> > >speculative accesses on GUARDED memory.
> >
> > It does! But speculative accesses and access reordering are not the same
> > thing :)
>
>what do you mean, does or does not do speculative accesses?

Sorry for being unclear.

If I remember correctly, cache inhibited + guarded is enough for 8xx to 
prevent both speculative access and load/store reordering.
But this is not true for ALL PPC processors, 440GP is an example when this 
is not enough


> >
> > There is a subtle difference.
>
>Yes I understand now, but I discussed this with my HW contact at Motorola 
>and he agreed
>that it was OK to remove the mb(). Maybe he was wrong or perhaps non 
>speculative accesses
>on mpc 860/862 also disables reorder? I can not find any statement that 
>confirms this.
>
>Howerver I have been running our boards without the mb()'s for months now, 
>no problem with
>it so far.

Well, patch we are discussing is for 4xx, not for 8xx.

Eugene.
