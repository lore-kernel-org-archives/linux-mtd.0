Received: from wsip68-15-115-9.ok.ok.cox.net ([68.15.115.9] helo=mail.forestsidingsupply.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16v3LY-00061L-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Apr 2002 22:40:13 +0100
Date: Tue, 9 Apr 2002 16:40:10 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: root jffs2 filesystem on blkmtd emulated device
Message-ID: <20020409164010.A12600@ns2.forestsidingsupply.com>
References: <20020409114205.A21994@ns2.forestsidingsupply.com> <1018381371.15728.3.camel@russ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1018381371.15728.3.camel@russ>; from Russ.Dill@asu.edu on Tue, Apr 09, 2002 at 12:42:50PM -0700
From: mike@forestsidingsupply.com (Mike Mattice)
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

On Tue, Apr 09, 2002 at 12:42:50PM -0700, Russ Dill wrote:
> On Tue, 2002-04-09 at 09:42, Mike Mattice wrote:
> > I've got a flash based ide module which is too small for my needs w/o 
> > compression.  So, I'm trying to get this to use jffs2 as it's root 
> > filesystem type.   I've run into a bit of a problem.
> > 
> > After applying the following patch, using the attached config, and passing 
> > 'blkmtd=/dev/hdc2' to the kernel and setting the root device to 
> > '/dev/mtdblock/0' via lilo, I get this on the console.  (hand typed, but 
> > should be very close)
> 
> good debugging, it was fixed in october, but due to some cvs snafu, has
> never made it into the 2.4 kernels. Just remove the invalidate_device
> call
> 

Thanks, on both counts.  The system boots now.  I didn't know if the
invalidate was necessary or not.

Mike
