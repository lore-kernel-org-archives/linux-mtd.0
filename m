Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QRh6S-0003pB-93
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 08:48:37 +0000
Subject: Re: [PATCH v6 1/8] MTD: Add integrator-flash feature to physmap
From: Marc Zyngier <Marc.Zyngier@arm.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <BANLkTim0xrx+33BeoSbXbQcu2Ab6Oin=Wg@mail.gmail.com>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
	<1305637877-24436-2-git-send-email-marc.zyngier@arm.com>
	<4DE53D52.4040508@ru.mvista.com>
	<20110531224428.6636e283@taxman.wild-wind.fr.eu.org>
	<BANLkTim0xrx+33BeoSbXbQcu2Ab6Oin=Wg@mail.gmail.com>
Date: Wed, 01 Jun 2011 08:49:06 +0100
Message-ID: <1306914546.27474.349.camel@e102391-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Sergei Shtylyov <sshtylyov@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-31 at 22:20 -0400, Mike Frysinger wrote:
> On Tue, May 31, 2011 at 17:44, Marc Zyngier wrote:
> > On Tue, 31 May 2011 23:11:14 +0400 Sergei Shtylyov wrote:
> >> Marc Zyngier wrote:
> >> > In the process of moving platforms away from integrator-flash
> >> > (aka armflash), add to physmap the few features that make
> >> > armflash unique:
> >>
> >> > - optionnal probing for the AFS partition type
> >> > - init() and exit() methods, used by Integrator to control
> >> >   write access to the various onboard programmable components
> >>
> >> > Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> >> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> >> > Cc: David Woodhouse <dwmw2@infradead.org>
> >> [...]
> >>
> >> > diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap=
.h
> >> > index bcfd9f7..d37cca0 100644
> >> > --- a/include/linux/mtd/physmap.h
> >> > +++ b/include/linux/mtd/physmap.h
> >> > @@ -22,6 +22,8 @@ struct map_info;
> >> >
> >> >  struct physmap_flash_data {
> >> >     unsigned int            width;
> >> > +   int                     (*init)(struct platform_device *);
> >> > +   void                    (*exit)(struct platform_device *);
> >>
> >>     How about a declaration for 'struct platform_device' beforehand? T=
his breaks
> >> build on other platforms at least...
> >
> > Sure. Please send a patch.
>=20
> uhh, what ?  you broke things, so you fix them.  i already pointed out
> this breakage to you over a week ago.

Mike,

Sorry I missed your earlier comment about this. My bad.

Now, about my reply to Sergei:
      * Sergei identified the problem, and proposed a valid fix. It's
        only fair he gets credited for his work (yes, you did it before
        he did, but I didn't know it). The SOB on a patch is the proper
        way of managing the attribution.
      * Posting a patch is the quickest way for the maintainer (in this
        case David) to be able to push a fix to mainline.
      * It also helps other folks reading the ML and facing the same
        issue. They can grab the patch, apply it locally and go on with
        their own stuff until the patch is merged.
      * The person reporting the problem probably has a configuration
        showing the problem. If any of my platforms had shown that
        error, I would have fixed it long before it hit the mailing
        list.

Now, to keep everyone happy, an untested patch. David, can you please
apply it?

Cheers,

=09M.

>From 1440a857e119b90df68e87cf9da87fce870c86cf Mon Sep 17 00:00:00 2001
From: Marc Zyngier <marc.zyngier@arm.com>
Date: Wed, 1 Jun 2011 08:37:28 +0100
Subject: [PATCH] MTD: Fix physmap compilation error

Commit b7281ca2a4 (MTD: Add integrator-flash feature to physmap)
broke some platforms by using 'struct platform_device' without
declaring it.

Add a forward declaration to keep everyone happy.

Fix proposed by both Mike Frysinger and Sergei Shtylyov.

Reported-by: Mike Frysinger <vapier.adi@gmail.com>
Reported-by: Sergei Shtylyov <sshtylyov@mvista.com>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 include/linux/mtd/physmap.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index d40bfa1..e5f21d2 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -19,6 +19,7 @@
 #include <linux/mtd/partitions.h>
=20
 struct map_info;
+struct platform_device;
=20
 struct physmap_flash_data {
 =09unsigned int=09=09width;
--=20
1.7.0.4


--=20
Reality is an implementation detail.
