Received: from h-66-166-124-218.lsanca54.covad.net ([66.166.124.218]
	helo=sb-exchange1.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A0L2V-0000IQ-JQ
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2003 14:11:11 +0100
Date: Fri, 19 Sep 2003 06:10:26 -0700
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: Russ Dill <Russ.Dill@asu.edu>
Message-ID: <20030919131025.GA22290@rinconnetworks.com>
References: <20030918190403.GA6047@rinconnetworks.com>
	<1063913545.1035.2.camel@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1063913545.1035.2.camel@localhost>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: PCI to Compact flash adapter question
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks. This is for an embedded device that only has PCI support at this
point. Going PCI->USB first might be an option.

Thanks.

Paul

On Thu, Sep 18, 2003 at 12:32:25PM -0700, Russ Dill wrote:
> On Thu, 2003-09-18 at 12:04, Paul van Gool wrote:
> > Hi,
> > 
> > can anybody recommend a PCI to Compact flash adapter that can be used with
> > Linux?
> 
> pci->cardbus bridges might work. Personally, I'd recommend usb->cf, and
> if you don't have usb, put a pci usb card in. It'll be a lot simplier,
> and a lot cheaper.
> 
> -- 
> Russ Dill <Russ.Dill@asu.edu>

-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
