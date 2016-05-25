Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5eKf-0002GX-M4
 for linux-mtd@lists.infradead.org; Wed, 25 May 2016 19:19:06 +0000
Received: by mail-wm0-x243.google.com with SMTP id q62so18442252wmg.3
 for <linux-mtd@lists.infradead.org>; Wed, 25 May 2016 12:18:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160408024507.69fb4fc1@bbrezillon>
References: <1455708258-3831-1-git-send-email-raghav.dogra@nxp.com>
 <CADRPPNS1i1XgtpyiT_=rDuDXBDn=ehNY32=RKTC9hdKXhWWq8A@mail.gmail.com>
 <1455840434.2463.97.camel@buserror.net>
 <CADRPPNTauz=T9oWCeZy8G8s0vo9fmieRhn=Gd3jVqqJJEHV_ag@mail.gmail.com>
 <20160406175254.GC5243@localhost>
 <AM2PR04MB0770036256E58407BD045C5A8F9F0@AM2PR04MB0770.eurprd04.prod.outlook.com>
 <20160408024507.69fb4fc1@bbrezillon>
Date: Wed, 25 May 2016 14:18:43 -0500
Message-ID: <CADRPPNRXj_00GF-h_5yHtKPMU=U1C8PXQLZqEVzQvJZobmM7dg@mail.gmail.com>
Subject: Re: [PATCH][v3] mtd/ifc: Add support for IFC controller version 2.0
From: Leo Li <pku.leo@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Yang-Leo Li <leoyang.li@nxp.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Scott Wood <oss@buserror.net>, Raghav Dogra <raghav.dogra@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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

On Thu, Apr 7, 2016 at 7:45 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 6 Apr 2016 18:53:39 +0000
> Yang-Leo Li <leoyang.li@nxp.com> wrote:
>
>>
>>
>> > -----Original Message-----
>> > From: Brian Norris [mailto:computersforpeace@gmail.com]
>> > Sent: Wednesday, April 06, 2016 12:53 PM
>> > To: Li Yang <leoli@freescale.com>
>> > Cc: Scott Wood <oss@buserror.net>; Raghav Dogra <raghav.dogra@nxp.com>;
>> > linux-mtd@lists.infradead.org; linuxppc-dev <linuxppc-dev@lists.ozlabs.org>;
>> > Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; Raghav Dogra
>> > <raghav@freescale.com>; Jaiprakash Singh <b44839@freescale.com>; Boris
>> > Brezillon <boris.brezillon@free-electrons.com>
>> > Subject: Re: [PATCH][v3] mtd/ifc: Add support for IFC controller version 2.0
>> >
>> > Hi,
>> >
>> > On Wed, Mar 30, 2016 at 03:43:40PM -0500, Li Yang wrote:
>> > > Hi Brian,
>> > >
>> > > Could you help to review and pull in this patch and the Kconfig update
>> > > after this patch(https://patchwork.ozlabs.org/patch/557389/)?  It
>> >
>> > It's probably best for Boris to apply this now.
>>
>> Thanks Brian.  I see Boris is taking over the maintenance of NAND recently, we will follow up with him.
>>
>> Hi Boris,
>>
>> Can you consider to pull in this patch and then Kconfig patch (https://patchwork.ozlabs.org/patch/557389/)?
>
> Applied.
>
> Thanks,
>
> Boris

Hi Boris,

It seems that the patch at https://patchwork.ozlabs.org/patch/557389/
mentioned above was not in tree for 4.7.  Can you review and apply
that patch too?

Regards,
Leo
