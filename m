Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVcKX-0004af-Ti
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 18:04:11 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IP30096VBYTCB50@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 18:04:05 -0400 (EDT)
Date: Fri, 28 Oct 2005 18:04:05 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1130536220.3901.5.camel@windu.rchland.ibm.com>
To: Josh Boyer <jdub@us.ibm.com>
Message-id: <Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
	<1130536220.3901.5.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 28 Oct 2005, Josh Boyer wrote:

> On Fri, 2005-10-28 at 17:34 -0400, Nicolas Pitre wrote:
> > On Fri, 28 Oct 2005, Josh Boyer wrote:
> > 
> > > I'll preface this with a disclaimer that we saw this on 2.4, however the
> > > same general issue still seems to be present in MTD CVS.
> > 
> > For 2.6.x? Are you sure?
> 
> Apparently not.
> 
> > 
> > In 2.6 there is no schedule_timeout() anywhere in the MTD code.
> 
> Yeah, nevermind.  I forgot that cfi_udelay no longer does that.  In our
> kernel, cfi_udelay has:
> 
> if (current->need_resched)
> 	schedule_timeout(us);
> else
> 	udelay(us);

But current code has almost same behavior:

        if (us >= 1000) {
                msleep((us+999)/1000);
        } else {
                udelay(us);
                cond_resched();
        }

And therefore I wonder if what you saw could occur with that version as 
well.


Nicolas
