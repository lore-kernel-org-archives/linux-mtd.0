Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6Prf-0006ha-I7
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 22:04:20 +0000
Received: by mail-wm0-x241.google.com with SMTP id e3so2405773wme.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 May 2016 15:03:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160527211247.GA123214@google.com>
References: <CADRPPNS1i1XgtpyiT_=rDuDXBDn=ehNY32=RKTC9hdKXhWWq8A@mail.gmail.com>
 <1455840434.2463.97.camel@buserror.net>
 <CADRPPNTauz=T9oWCeZy8G8s0vo9fmieRhn=Gd3jVqqJJEHV_ag@mail.gmail.com>
 <20160406175254.GC5243@localhost>
 <AM2PR04MB0770036256E58407BD045C5A8F9F0@AM2PR04MB0770.eurprd04.prod.outlook.com>
 <20160408024507.69fb4fc1@bbrezillon>
 <CADRPPNRXj_00GF-h_5yHtKPMU=U1C8PXQLZqEVzQvJZobmM7dg@mail.gmail.com>
 <20160525223412.086e45e9@bbrezillon>
 <CADRPPNSeQsOZZ9XRR4BOfZvewoB9RoEy0KzPrRzoDm21LtacnQ@mail.gmail.com>
 <20160527224401.4b776ad4@bbrezillon>
 <20160527211247.GA123214@google.com>
Date: Fri, 27 May 2016 17:03:57 -0500
Message-ID: <CADRPPNR5NXuug7Nig=s8be0yEOB4RKg9zj53t00fdSffo5s72A@mail.gmail.com>
Subject: Re: [PATCH][v3] mtd/ifc: Add support for IFC controller version 2.0
From: Leo Li <pku.leo@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Raghav Dogra <raghav.dogra@nxp.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Yang-Leo Li <leoyang.li@nxp.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Scott Wood <oss@buserror.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Raghav Dogra <raghav@freescale.com>,
 Jaiprakash Singh <b44839@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 27, 2016 at 4:12 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Leo,
>
> On Fri, May 27, 2016 at 10:44:01PM +0200, Boris Brezillon wrote:
>> On Fri, 27 May 2016 15:15:00 -0500
>> Leo Li <pku.leo@gmail.com> wrote:
>> > On Wed, May 25, 2016 at 3:34 PM, Boris Brezillon
>> > <boris.brezillon@free-electrons.com> wrote:
>> > > On Wed, 25 May 2016 14:18:43 -0500
>> > > Leo Li <pku.leo@gmail.com> wrote:
>> > >> It seems that the patch at https://patchwork.ozlabs.org/patch/557389/
>> > >> mentioned above was not in tree for 4.7.  Can you review and apply
>> > >> that patch too?
>> > >
>> > > I see it in the PR Brian sent 2 days ago [1], so it should appear in
>> > > Linus tree soon.
>> > >
>> > > Regards,
>> > >
>> > > Boris
>> > >
>> > > [1]https://lkml.org/lkml/2016/5/24/9
>> >
>> >
>> > The pull request does have patch "mtd/ifc: Add support for IFC
>> > controller version 2.0", but it doesn't have another patch
>> > "driver/memory: Update dependency of IFC for
>> > Layerscape"(https://patchwork.ozlabs.org/patch/557389/) needed to make
>> > the driver selectable on new hardware.
>
> Your patches seem to have broken threading. Or at least, in my mailbox,
> I have that patch, but I can't easily find [PATCH 1/3] or [PATCH 3/3].
> Please fix your threading next time, to help ensure things get handled
> together.
>
> (It also helps when you reply to the patch you're asking about, and not
> to a different patch.)
>
>> Sorry, I overlooked that part in your different emails (even though you
>> clearly stated that you needed both patches).
>>
>> For my defense, I haven't followed the patch series from the beginning,
>> and only took the patch because Brian suggested to do so (and the
>> changes seemed ok).
>> It would have been clearer if the different patches were part of the
>> same series.
>
> +1 to the last sentence.
>
>> Anyway, Brian, can you take it into your tree and make it appear in
>> -rc1 (or earlier if it's still possible)?
>
> Not sure how I could get it any "earlier"? It's not making -rc1 at this
> point.
>
>> BTW, in the patch description you say you're only modifying a Kconfig
>> dependency, but you're actually doing more than that: you're removing
>> an asm header inclusion and manually include several other headers
>> (which I guess were previously included by asm/prom.h).
>
> Please resend this patch with a more complete commit description; I'd
> like it to get actual review (and time in linux-next) before it gets
> merged, so at best, it'll wait a few -rc's. I also suspect the patch
> isn't optimal. I believe Scott has suggested [1] that we didn't need the
> FSL_SOC dependency on the LBC driver. I think IFC looks like a similar
> case?

Thanks Brian.

Raghav, Can you do that as soon as possible?

Regards,
Leo
