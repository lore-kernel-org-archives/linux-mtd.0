Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184NiG-0000uk-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 16:46:28 +0100
Message-Id: <200210231616.g9NGGJs10316@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: parse_cmdline_partitions equivalent for map_info
Date: Wed, 23 Oct 2002 18:22:49 +0200
Cc: Frank Neuber <neuber@convergence.de>, linux-mtd@lists.infradead.org
References: <20021018104910.GA11807@jupiter> <200210231355.g9NDt6s03055@dagobert.svc.sysgo.de> <20021023143547.GA2979@wohnheim.fh-wedel.de>
In-Reply-To: <20021023143547.GA2979@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Jörn,

Am Mittwoch, 23. Oktober 2002 16:35 schrieb Jörn Engel:
> >
> > > - Some drivers need to cut out a small range from the middle for the
> > >   bootloader. They then concatenate the range before and after the
> > >   bootloader into one virtual partition. Find a clean solution for
> > >   this.
> >
> > Hmm, I would have thought that mtdconcat.c does this nicely already?
>
> I would have to actually take a look, but that should do it. (1)

The whole reason of the concat layer was that I was facing a situation like 
the one you describe above: BIOS block in the middle of the physical flash 
address range. I had first planned to deal with it in a mapping driver (like 
all the others have done before and after me), but then a discussion with 
David led to my developing the concat layer as a more generic solution.

David initially wanted it to be an extension to the partitioning code because 
he thought that partitioning and concatenating are closely related concepts 
(which seems only logical at first glance), but after looking a little deeper 
into the issue, I preferred to make it a seperate module because:

   1) It turned out that there is really not much a concat layer could
      sensibly share with the partitioning code. They are indeed closely
      related concepts, but only in the sense that each of them is the
      opposite to the other :-)
   2) I wanted it to be decoupled from the partitioning code because I knew
      that your re-write of same was planned to be merged. It's a pity this
      did not happen.

[BTW: The concat layer has a similar problem as cmdline.c: since it was 
introduced relatively late, only few mapping drivers actually use it. And 
since new mapping drivers tend to be created from existing ones in a 
copy-paste manner, this doesn't improve over time...]

>
> > > When physmap.c or any variant is generic enough to do all this, it
> > > needs two or three interfaces:
> > > - Command line, a lot of people should need that.
> >
> > why not use what is there already (cmdline.c) ?
>
> Again, see (1)
> We have two seperate issues: Creating devices and partitioning those
> devices. This is interchangeable in most cases, but not in all.
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Exactly!

> If I got you right, cmdline.c cares about partitioning a device.

cmdline.c just does the tedious work of scanning the kernel commandline 
options and turning the information it finds there into a data structure 
(i.e. the struct mtd_partition that so many mapping drivers have hardcoded). 
This structure can subsequently be passed to the partitioning code. So it is 
basically just a way of specifing a partitioning scheme dynamically through 
the commandline.

It does, however, support multiple MTD devices, i.e. you can specify 
individual partitioning schemes for different MTD devices in a single system.

> But I
> worked on hardware that needed to create three devices on flash and
> partition two of those. Would that still work easily?

The only thing missing here (assuming you want to use physmap.c for this) is 
physmap.c supporting multiple devices. If I got you right, that is what your 
mphysmap.c is about.


>
> > > - A c api for the "got a d-box, hit this options" type files.
> >
> > Not sure what you mean by "c api", but generally, MTD is already a
> > nightmare to configure for a non-guru, unless there is a specific mapping
> > driver for your hardware that you can just click. So this ability to just
> > tickbox your platform should definitely stay (or even be extended) when a
> > new concept gets introduced.
>
> I mean the infrastructure to rewrite 98% of the mapping drivers in <20
> lines.
>
> The user should browse through the configuration, see d-box or
> whatever, say yes *once* and be happy. That is the best interface next
> to autosensing, no doubt.

Fully agreed!

(Hmm, actually I would even *prefer* it to autosensing because I've seen 
autosense code fail so many times ;-)



> (1)
> About a year ago, I forked David's tree and rewrote the partitioning.
> The changes were quite intrusive, but the result looked good to me.
> Since then, I wanted to merge the changes back into David's tree. It
> never happened, blame goes to both of us.
> Sad result is that I continued developing my tree, you all continued
> developing David's tree and neither has looked at the other.
> Currently, two or three independent groups use my tree, most use
> David's tree and noone cares about the situation.
> Again, blame everyone. David never looked at my code. I never put it
> into nice sizeable pieces for him. And everyone else either dumped
> David's tree or ignored mine.

This is really a pity :-(

>
> So the result is that I am pretty unaware about current cvs head.
> And by now, I don't even care anymore. David is a good developer, but
> his problems and my problems don't give a very cooperative mixture.

I wouldn't be so sure about that. It seems to me that many of the problems 
you were facing at the time have been addressed in David's tree in the 
meantime, albeit with different methods.

>From what I gathered up to this point, it seems that a physmap.c that 
supports multiple devices might make a nice addition to David's tree. And, if 
this module could then be generalized to such an extent that it could replace 
-say- 90% of the mapping drivers, this would solve the creeping mapping 
driver inflation that we currently observe.

However, the *big* problem I see with that, is that whoever does this would 
have to analyze every single mapping driver and migrate the relevant bits 
into the new concept. This is tedious, not to speak of the amount of testing 
that needs to be done. I doubt any one person has access to all the vast 
collection of devices for which there exist mapping drivers today.


Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
