Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SImWg-0002Yy-5k
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 19:51:22 +0000
Received: by lboj14 with SMTP id j14so3117303lbo.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Apr 2012 12:51:19 -0700 (PDT)
Message-ID: <1334346542.2200.18.camel@brekeke>
Subject: Re: Unstable bits and JFFS2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 13 Apr 2012 22:49:02 +0300
In-Reply-To: <20120413183617.GA22004@pengutronix.de>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
 <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
 <1334334462.13160.10.camel@sauron.fi.intel.com>
 <20120413183617.GA22004@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: 'Matej Kupljen' <matej.kupljen@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Atlant Schmidt <aschmidt@dekaresearch.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-04-13 at 20:36 +0200, Wolfram Sang wrote:
> Hi,
> 
> > > > Artem, you said that this unstable bits only happen
> > > > during power cuts, is this right? Would those appear
> > > > also on simulated power cuts, the ones that integck
> > > > can produce?
> 
> A bit of hijacking this thread, yet it fits somehow to the idea I got
> yesterday:
> 
> There is the Open Project Proposal again, where the CEWG funds topics which
> improve embedded linux in general [1]. I wonder if it makes sense to hand in a
> proposal starting to tackle the 'unstable bits' issue. I could imagine task 1
> mentioned in the wiki page (1. Improve the existing power cut emulation
> infrastructure in UBIFS and start emulating unstable bits. Start with emulating
> only one type of unstable bits, e.g., type 1.) could be a good candidate for
> such a proposal. Since I am not deeply involved with this topic:
> 
> 1) Is this task still needed?
> 2) Is it a good task for a 2-3 week period (I'd think so)
> 3) Are there people around up for the task?
> 
> I'd be willing to write the proposal, if nobody else volunteers. (yet, given my
> constraints, I am not the right person to actually work on it). Even if the
> proposal doesn't get contracted, the topic itself might get some attention
> since it will be discussed in the CEWG.

Yes, definitely a hot topic now, I am swamped with lots of things and
never found time for writing proposals like this. Please, go ahead,
would be very appreciated. I might help reviewing it and amending.
