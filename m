Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 185rEv-0002oD-00
	for <linux-mtd@lists.infradead.org>; Sun, 27 Oct 2002 17:30:17 +0000
Date: Sun, 27 Oct 2002 19:00:01 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: rkaiser@sysgo.de
Cc: Frank Neuber <neuber@convergence.de>, linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021027180001.GA28417@wohnheim.fh-wedel.de>
References: <20021018104910.GA11807@jupiter> <200210231355.g9NDt6s03055@dagobert.svc.sysgo.de> <20021023143547.GA2979@wohnheim.fh-wedel.de> <200210231616.g9NGGJs10316@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200210231616.g9NGGJs10316@dagobert.svc.sysgo.de>
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

On Wed, 23 October 2002 18:22:49 +0200, Robert Kaiser wrote:
> The whole reason of the concat layer was that I was facing a situation like 
> the one you describe above: BIOS block in the middle of the physical flash 
> address range. I had first planned to deal with it in a mapping driver (like 
> all the others have done before and after me), but then a discussion with 
> David led to my developing the concat layer as a more generic solution.
> 
> David initially wanted it to be an extension to the partitioning code because 
> he thought that partitioning and concatenating are closely related concepts 
> (which seems only logical at first glance), but after looking a little deeper 
> into the issue, I preferred to make it a seperate module because:
> 
>    1) It turned out that there is really not much a concat layer could
>       sensibly share with the partitioning code. They are indeed closely
>       related concepts, but only in the sense that each of them is the
>       opposite to the other :-)

True. All you have to do is grab a couple of partitions and create a
new device from those.
A little performance gets lost, as both concat and partitioning have
to adjust the offset and do some checks. This could be done just once,
but I doubt if the performance gain will be noticeable at all. Keep it
simple, Snoopy.

>    2) I wanted it to be decoupled from the partitioning code because I knew
>       that your re-write of same was planned to be merged. It's a pity this
>       did not happen.

It will. Someday. But when?!?

> > If I got you right, cmdline.c cares about partitioning a device.
> 
> cmdline.c just does the tedious work of scanning the kernel commandline 
> options and turning the information it finds there into a data structure 
> (i.e. the struct mtd_partition that so many mapping drivers have hardcoded). 
> This structure can subsequently be passed to the partitioning code. So it is 
> basically just a way of specifing a partitioning scheme dynamically through 
> the commandline.
> 
> It does, however, support multiple MTD devices, i.e. you can specify 
> individual partitioning schemes for different MTD devices in a single system.

Sounds interesting enough. Worth a close look, when motivation shows
up again.

> > But I
> > worked on hardware that needed to create three devices on flash and
> > partition two of those. Would that still work easily?
> 
> The only thing missing here (assuming you want to use physmap.c for this) is 
> physmap.c supporting multiple devices. If I got you right, that is what your 
> mphysmap.c is about.

Correct.

> > The user should browse through the configuration, see d-box or
> > whatever, say yes *once* and be happy. That is the best interface next
> > to autosensing, no doubt.
> 
> Fully agreed!
> 
> (Hmm, actually I would even *prefer* it to autosensing because I've seen 
> autosense code fail so many times ;-)

Ok, next to working autosensing then. ;-)

> > So the result is that I am pretty unaware about current cvs head.
> > And by now, I don't even care anymore. David is a good developer, but
> > his problems and my problems don't give a very cooperative mixture.
> 
> I wouldn't be so sure about that. It seems to me that many of the problems 
> you were facing at the time have been addressed in David's tree in the 
> meantime, albeit with different methods.

I wouldn't know, how. With current partitioning, imagine two devices,
both with two partitions.
The first device will get minor 0 for the device and minors 1 and 2
for the partitions. The second will get 3, 4 and 5.
Once you create a third partition on the first device, the second will
have 4, 5 and 6. Can you spell trouble?

This was the main issue with my new partitioning code. That and
removing those useless mtd-ro devices, they also cause tons of
problems.

> From what I gathered up to this point, it seems that a physmap.c that 
> supports multiple devices might make a nice addition to David's tree. And, if 
> this module could then be generalized to such an extent that it could replace 
> -say- 90% of the mapping drivers, this would solve the creeping mapping 
> driver inflation that we currently observe.
> 
> However, the *big* problem I see with that, is that whoever does this would 
> have to analyze every single mapping driver and migrate the relevant bits 
> into the new concept. This is tedious, not to speak of the amount of testing 
> that needs to be done. I doubt any one person has access to all the vast 
> collection of devices for which there exist mapping drivers today.

Very true.

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
