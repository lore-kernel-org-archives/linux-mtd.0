Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwvjA-00068O-Oa
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2011 12:41:43 +0000
Date: Fri, 26 Aug 2011 14:41:35 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
In-Reply-To: <CAN8TOE9BHPmVPi929VvNZMFEiuyLH4RbYstwxR2E8VEBeHXL9A@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1108261436450.13510@lnxricardw.se.axis.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron> <20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
	<Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
	<CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
	<Pine.LNX.4.64.1108241709350.13510@lnxricardw.se.axis.com>
	<CAN8TOE_Vom8KHoWwEp2tmka64LLyPdPjnaZEFJTipL+7gkdfUw@mail.gmail.com>
	<Pine.LNX.4.64.1108251118390.13510@lnxricardw.se.axis.com>
	<CAN8TOE9BHPmVPi929VvNZMFEiuyLH4RbYstwxR2E8VEBeHXL9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 25 Aug 2011, Brian Norris wrote:

>>> =A0Author: THOMSON, Adam (Adam) <adam.thomson@alcatel-lucent.com>
>>> =A0mtd: nand_base: always initialise oob_poi before writing OOB data
>>
>> That seems right.
>
> BTW, that patch seems a bit broken to me; I sent a fixup for it:=20
> http://lists.infradead.org/pipermail/linux-mtd/2011-August/037698.html

Thanks, I did see it but it failed to register. I've applied it to my tree=
=20
now.

> I think that I had a little bit of the wrong approach. I was doing
> some ill advised hacking to the existing write functions. I spun off
> my first two patches here as a different series (I believe I CC'd
> you); I used a different approach that should make as little impact on
> currently working hardware as possible:
> http://lists.infradead.org/pipermail/linux-mtd/2011-August/037695.html
>
> Thanks a lot for the testing. I think that my first approach still may=20
> easily have unintended consequences, though. I welcome any testing on my=
=20
> new patch series, and any more systems with broken "noecc" should be=20
> handled through that thread.

I applied the two patches in the above mentioned patch series to my tree=20
(after applying Peter's patch, Adam's, and your amendment to it).=20
Conclusion: nandwrite -o -n still works for me, i.e. the patch doesn't=20
break it.

One little caveat, the tree I'm using is 2.6.35 based. The patches don't=20
apply cleanly, but it just takes a little effort. So I think the results=20
are relevant, just wanted to mention it.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
