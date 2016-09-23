Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnOnv-0003A8-DH
 for linux-mtd@lists.infradead.org; Fri, 23 Sep 2016 11:38:09 +0000
From: "Chugh, Sanjeev" <Sanjeev_Chugh@mentor.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH 2/2] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
Date: Fri, 23 Sep 2016 11:37:44 +0000
Message-ID: <BEFE8A70F8F03B42BC5848A2E783B9E950AC853F@EU-MBX-03.mgc.mentorg.com>
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
 <5795EA8B.2040209@nod.at> <20160729182449.GA124841@google.com>
 <1470292252.2311.48.camel@gmail.com>
 <BEFE8A70F8F03B42BC5848A2E783B9E950AC8413@EU-MBX-03.mgc.mentorg.com>
In-Reply-To: <BEFE8A70F8F03B42BC5848A2E783B9E950AC8413@EU-MBX-03.mgc.mentorg.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just to clarify, I meant since you were suggesting that value of numerasere=
gions either 0 or 1 is essentially equal.=20

Are you suggesting that you don't like the change and better clarify this i=
n documentation about this ?=20

-Sanjeev

>-----Original Message-----
>From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf O=
f
>Chugh, Sanjeev
>Sent: Friday, September 23, 2016 4:51 PM
>To: dedekind1@gmail.com; Brian Norris; Richard Weinberger
>Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org;
>stable@vger.kernel.org
>Subject: RE: [PATCH 2/2] ubi: attach: do not return -EINVAL if the mtd-
>>numeraseregions is 1
>
>Hello Brian, Artem,
>
>Are you suggesting that this change be documented instead. Note that we ar=
e
>using NOR flash devices for our testing as you asked.
>
>Can I request you to please clarify on acceptance of this patch ?
>
>Thanks
>Sanjeev
>
>>-----Original Message-----
>>From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
>>Sent: Thursday, August 04, 2016 12:01 PM
>>To: Brian Norris; Richard Weinberger
>>Cc: Rajeev Kumar; dwmw2@infradead.org; linux-mtd@lists.infradead.org;
>>stable@vger.kernel.org
>>Subject: Re: [PATCH 2/2] ubi: attach: do not return -EINVAL if the mtd-
>>>numeraseregions is 1
>>
>>On Fri, 2016-07-29 at 11:24 -0700, Brian Norris wrote:
>>> (Artem, any opinions, since you had the most opinion last time this
>>> came
>>> up?)
>>
>>Hi Brian,
>>
>>well, I do not have strong opinion. That UBI translates to "I do not know=
 how to
>>deal with multiple regions", nothing else.
>>
>>I think this was my understanding of numeraseregions
>>
>>1. numaraseregions=3D0: no regions, just uniform flash.
>>
>>2. numeraseregions=3D1: basically same as above, but friendlier to the re=
gion-
>>aware software. Indeed, if I care about regions, I do not want to handle =
the
>>special case of numerasereions=3D0, I want a common case with
>>numerasereionts>0.
>>
>>Or to put it this way, from the drivers' writer POW:
>>
>>numaraseregions=3D0 - do not know anything about regions, do not care.
>>Also pre-regions dirivers, old stuff
>>
>>numeraseregions=3D1 - I want my driver to be ideal. Non-aware SW won't lo=
ok to
>>the regions stuff, the aware SW will work nicely.
>>
>>So my take is: ban numeraseregions=3D1 if you feel like, but I recommend =
to just
>>document the 0 (don't care/legacy) and 1 (same as 0, but care) and allow =
for
>>both.
>>
>>Artem.
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
