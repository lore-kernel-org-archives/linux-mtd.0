Received: from vmmrnat.verisignmail.com ([216.168.230.187] helo=vmmr9.verisignmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eIh7-0001mw-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 17:41:45 +0000
Message-Id: <5.1.0.14.2.20030130100614.038d9778@mail.ebshome.net>
Date: Thu, 30 Jan 2003 10:12:39 -0800
To: joakim.tjernlund@lumentis.se
From: Eugene Surovegin <ebs@ebshome.net>
Subject: RE: PATCH: support for Arctic/Beech/Ebony
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <IGEFJKJNHJDCBKALBJLLKEMCFJAA.joakim.tjernlund@lumentis.se>
References: <5.1.0.14.2.20030130021112.020b0628@mail.ebshome.net>
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

At 03:23 AM 1/30/2003, you wrote:
> > Joakim,
> >
> > At 01:46 PM 1/29/2003, you wrote:
> > >   - You don't need mb() since ioremap will add the
> > >      GUARDED attribute to the mapping.
> >
> > Well, this is not quite correct.
> >
> > GUARDED attribute does _NOT_ prevent reordering of loads and stores on PPC
> > (on 4xx at least).
> >
> > See comments in asm-ppc/system.h and also IBM app note "Software
> > consideration when migrating to the PowerPC 440GP from 405GP"
> >
>
>hmm, maybe it's specific to the 8xx family. 860 and 862 does not do
>speculative accesses on GUARDED memory.

It does! But speculative accesses and access reordering are not the same 
thing :)

There is a subtle difference.

>Me wounders what GUARDED is good for if it doesn't prevent reordering.

I think it's a FAQ for PPC devel list :)

Eugene.
