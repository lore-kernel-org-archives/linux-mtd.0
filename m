Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwHm4-0005ox-Rz
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 18:02:02 +0000
Received: by wyh11 with SMTP id 11so1322056wyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2011 11:01:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1108241709350.13510@lnxricardw.se.axis.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron>
	<20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
	<Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
	<CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
	<Pine.LNX.4.64.1108241709350.13510@lnxricardw.se.axis.com>
Date: Wed, 24 Aug 2011 11:01:58 -0700
Message-ID: <CAN8TOE_Vom8KHoWwEp2tmka64LLyPdPjnaZEFJTipL+7gkdfUw@mail.gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Wed, Aug 24, 2011 at 8:36 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
...
> I had a problem
> in that in the mtdchar.c I have it looks like this:

Did you mean nand_base.c?

> whereas your patch looks like it was made against a version which lacks the
> memsets. First I thought it was because I was running an older kernel
> (2.6.35), but I looked at HEAD of the linux-2.6 and mtd-2.6 trees at
> git.infradead.org, and it's the same there. So I'm not sure exactly which
> version your patch was made against. Perhaps it's obvious to someone but not
> me right now.

My patches were based on l2-mtd-2.6.git, actually. David Woodhouse
rarely pulls patches into his mtd-2.6 tree, so I have moved to working
with Artem's l2-mtd-2.6 tree, where all the MTD work that's waiting
for upstream sits (some stuff's been there since May). This is not
obvious, and usually when it matters, I try to mention it in the patch
summaries.

Artem: is there any official change in policy on patch submission? I
see documentation that says to base off mtd-2.6.git, but I've been
using l2-mtd-2.6 to help you avoid merge conflicts:
http://www.linux-mtd.infradead.org/source.html

Anyway, I believe the relevant patch dependency (from l2-mtd-2.6.git) is:

   commit a8ee364bbf14861d5d0af39c4da06c30441895fb
   Author: THOMSON, Adam (Adam) <adam.thomson@alcatel-lucent.com>
   mtd: nand_base: always initialise oob_poi before writing OOB data

> Nevertheless, after applying the patch, as you suspected, using 'nandwrite
> -o -n' fails, in this case the application hangs after outputting
>
> Writing data to block 0

I guessed you would be more likely to get a segmentation fault on a
NULL pointer, but I may be wrong.

> Now, this may all be nonsense as as I mentioned I'm not sure that I've had
> the right version to start with. The memsets bug me, as they would explain
> the all-ff's stuff, but I don't really feel like just experimenting.

Right, that's fair enough. I still think this patch is not 100% ready,
anyway. Thanks for the help though!

If you're still up for trying, you can try applying Adam Thomson's
patch, then my RFC, then the inlined amendment I sent. With your
feedback, I will

I need to figure out structurally how to handle the differences
between hardware that uses the standard functions (and works fine
without my patch) and hardware like mine that needs more information
passed to it. Perhaps there needs to be a replaceable
`chip->ecc.write_oob_raw' function? Or at least some modifications to
the other "replaceable" raw functions.

Brian
