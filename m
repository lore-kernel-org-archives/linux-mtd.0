Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwUEN-0005SF-Na
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 07:20:06 +0000
Received: by ywp17 with SMTP id 17so1791862ywp.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2011 00:20:01 -0700 (PDT)
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 25 Aug 2011 10:21:50 +0300
In-Reply-To: <CAN8TOE_Vom8KHoWwEp2tmka64LLyPdPjnaZEFJTipL+7gkdfUw@mail.gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron> <20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
	<Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
	<CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
	<Pine.LNX.4.64.1108241709350.13510@lnxricardw.se.axis.com>
	<CAN8TOE_Vom8KHoWwEp2tmka64LLyPdPjnaZEFJTipL+7gkdfUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314256916.18988.27.camel@sauron>
Mime-Version: 1.0
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-24 at 11:01 -0700, Brian Norris wrote:
> On Wed, Aug 24, 2011 at 8:36 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
> ...
> > I had a problem
> > in that in the mtdchar.c I have it looks like this:
> 
> Did you mean nand_base.c?
> 
> > whereas your patch looks like it was made against a version which lacks the
> > memsets. First I thought it was because I was running an older kernel
> > (2.6.35), but I looked at HEAD of the linux-2.6 and mtd-2.6 trees at
> > git.infradead.org, and it's the same there. So I'm not sure exactly which
> > version your patch was made against. Perhaps it's obvious to someone but not
> > me right now.
> 
> My patches were based on l2-mtd-2.6.git, actually. David Woodhouse
> rarely pulls patches into his mtd-2.6 tree, so I have moved to working
> with Artem's l2-mtd-2.6 tree, where all the MTD work that's waiting
> for upstream sits (some stuff's been there since May). This is not
> obvious, and usually when it matters, I try to mention it in the patch
> summaries.

David's tree is desperately out-of-date now, I did not talk to him
lately, he is not very reachable now.

There are patches from May because David did merge anything this merge
window, probably he had some issues/etc, let's hope he'll merge
everything next merge window. May be he wanted to ask me to merge it,
but I have been having vacation and was not available at the IRC chat.

> Artem: is there any official change in policy on patch submission? I
> see documentation that says to base off mtd-2.6.git, but I've been
> using l2-mtd-2.6 to help you avoid merge conflicts:
> http://www.linux-mtd.infradead.org/source.html

There is no official policy, this all works because enthusiasts who just
like MTD stuff and keep it alive. When I noticed that dwmw2 does not
give MTD ML enough attention, I just started my l2 tree to help him - it
was faster/easier for him to look with reviewed patches in my tree
rather than look through whole MTD ML, find out which acks/reviewed-by
to add and where, which patch versions are out of date, etc. 

At this point I think, that you have to use the l2 tree, because David's
tree is very out-of-date. Also, beware that the l2 tree is currently in
linux-next.

-- 
Best Regards,
Artem Bityutskiy
