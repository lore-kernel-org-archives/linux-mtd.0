Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwWJG-00079j-3k
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 09:33:16 +0000
Date: Thu, 25 Aug 2011 11:33:10 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
In-Reply-To: <CAN8TOE_Vom8KHoWwEp2tmka64LLyPdPjnaZEFJTipL+7gkdfUw@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1108251118390.13510@lnxricardw.se.axis.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron> <20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
	<Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
	<CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
	<Pine.LNX.4.64.1108241709350.13510@lnxricardw.se.axis.com>
	<CAN8TOE_Vom8KHoWwEp2tmka64LLyPdPjnaZEFJTipL+7gkdfUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	=?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
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


On Wed, 24 Aug 2011, Brian Norris wrote:

> On Wed, Aug 24, 2011 at 8:36 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
> ...
>> I had a problem
>> in that in the mtdchar.c I have it looks like this:
>
> Did you mean nand_base.c?

Yes, sorry about that.

>> whereas your patch looks like it was made against a version which lacks =
the
>> memsets. First I thought it was because I was running an older kernel
>> ...
> My patches were based on l2-mtd-2.6.git, actually. David Woodhouse
> rarely pulls patches into his mtd-2.6 tree, so I have moved to working
> with Artem's l2-mtd-2.6 tree, where all the MTD work that's waiting
> for upstream sits (some stuff's been there since May). This is not
> obvious, and usually when it matters, I try to mention it in the patch
> summaries.

I guess I should have thought of it but never thought to look there.

> Anyway, I believe the relevant patch dependency (from l2-mtd-2.6.git) is:
>
>   commit a8ee364bbf14861d5d0af39c4da06c30441895fb
>   Author: THOMSON, Adam (Adam) <adam.thomson@alcatel-lucent.com>
>   mtd: nand_base: always initialise oob_poi before writing OOB data

That seems right.

>> Nevertheless, after applying the patch, as you suspected, using 'nandwri=
te
>> -o -n' fails, in this case the application hangs after outputting
>>
>> Writing data to block 0
>
> I guessed you would be more likely to get a segmentation fault on a
> NULL pointer, but I may be wrong.

Something seems to hang at a lower level, because the system becomes=20
unresponsive at this point (I can telnet in, but trying to access the=20
flash with ls for instance causes the shell to hang).

> If you're still up for trying, you can try applying Adam Thomson's
> patch, then my RFC, then the inlined amendment I sent. With your
> feedback, I will

(something seems missing here ... nevertheless)

I applied the patches as you mentioned, which brought success. Dumping a=20
partition with nanddump, then writing it back with nandwrite -o -n results=
=20
in the correct data being written both to the main and oob areas.

(Without your inlinend patch, the nandwrite application still hangs after=
=20
Writing to data block 0).

So the conclusion would be that this combination of patches does not break=
=20
Peter Wippich's patch.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
