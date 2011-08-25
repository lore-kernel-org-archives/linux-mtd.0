Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qwe83-0007jC-27
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 17:54:12 +0000
Received: by wwj26 with SMTP id 26so5767097wwj.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2011 10:54:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1108251118390.13510@lnxricardw.se.axis.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron>
	<20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
	<Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
	<CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
	<Pine.LNX.4.64.1108241709350.13510@lnxricardw.se.axis.com>
	<CAN8TOE_Vom8KHoWwEp2tmka64LLyPdPjnaZEFJTipL+7gkdfUw@mail.gmail.com>
	<Pine.LNX.4.64.1108251118390.13510@lnxricardw.se.axis.com>
Date: Thu, 25 Aug 2011 10:54:04 -0700
Message-ID: <CAN8TOE9BHPmVPi929VvNZMFEiuyLH4RbYstwxR2E8VEBeHXL9A@mail.gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	=?ISO-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
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

Hi Ricard,

On Thu, Aug 25, 2011 at 2:33 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
> On Wed, 24 Aug 2011, Brian Norris wrote:
>> On Wed, Aug 24, 2011 at 8:36 AM, Ricard Wanderlof <ricard.wanderlof@axis=
.com> wrote:
>> Anyway, I believe the relevant patch dependency (from l2-mtd-2.6.git) is=
:
>>
>> =A0commit a8ee364bbf14861d5d0af39c4da06c30441895fb
>> =A0Author: THOMSON, Adam (Adam) <adam.thomson@alcatel-lucent.com>
>> =A0mtd: nand_base: always initialise oob_poi before writing OOB data
>
> That seems right.

BTW, that patch seems a bit broken to me; I sent a fixup for it:
http://lists.infradead.org/pipermail/linux-mtd/2011-August/037698.html

>> I guessed you would be more likely to get a segmentation fault on a
>> NULL pointer, but I may be wrong.
>
> Something seems to hang at a lower level, because the system becomes
> unresponsive at this point (I can telnet in, but trying to access the fla=
sh
> with ls for instance causes the shell to hang).

I think that I had a little bit of the wrong approach. I was doing
some ill advised hacking to the existing write functions. I spun off
my first two patches here as a different series (I believe I CC'd
you); I used a different approach that should make as little impact on
currently working hardware as possible:
http://lists.infradead.org/pipermail/linux-mtd/2011-August/037695.html

> (something seems missing here ...

Acknowledged :)

> I applied the patches as you mentioned, which brought success. Dumping a
> partition with nanddump, then writing it back with nandwrite -o -n result=
s
> in the correct data being written both to the main and oob areas.

Great!

> (Without your inlinend patch, the nandwrite application still hangs after
> Writing to data block 0).

Not quite sure what the hanging is all about - may be related to my
improper use of CMD_SEQIN, then a nand wait function being called
later? - but that's why I've changed my approach.

> So the conclusion would be that this combination of patches does not brea=
k
> Peter Wippich's patch.

Thanks a lot for the testing. I think that my first approach still may
easily have unintended consequences, though. I welcome any testing on
my new patch series, and any more systems with broken "noecc" should
be handled through that thread.

Brian
