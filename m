Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvTPQ-00054g-MH
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 12:15:17 +0000
Received: by yxk8 with SMTP id 8so4234307yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 05:15:11 -0700 (PDT)
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>, Ricard Wanderlof
	<ricard.wanderlof@axis.com>
Date: Mon, 22 Aug 2011 15:16:55 +0300
In-Reply-To: <20110822120417.GA13515@parrot.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron> <20110822120417.GA13515@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314015423.2644.118.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <computersforpeace@gmail.com>,
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

On Mon, 2011-08-22 at 14:04 +0200, Ivan Djelic wrote:
> On Mon, Aug 22, 2011 at 11:02:40AM +0100, Artem Bityutskiy wrote:
> > Hi,
> > 
> > On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> > > First off, these fixes are motivated by a number of things:
> > > 
> > > 1) Broken "noecc" writes; `nandwrite -n -o' does not work on my
> > >    hardware, at least, without these patches
> > 
> > I think Ivan complained about this at some point - he said he has images
> > with crafted ECC codes to test his BCH library, but he could not flash
> > them properly. So yes, this is worth fixing.
> 
> Actually it was Ricard Wanderlof, but indeed he was testing the BCH library
> (http://lists.infradead.org/pipermail/linux-mtd/2011-March/034516.html).
> It would be nice if he could ack the fix ?

Sure, CCed.

-- 
Best Regards,
Artem Bityutskiy
