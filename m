Received: from protonic.xs4all.nl ([213.84.116.84])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Tg9-0007lK-Of
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 09:26:18 +0000
Date: Thu, 23 Aug 2012 11:27:32 +0200
From: David Jander <david.jander@protonic.nl>
To: dedekind1@gmail.com
Subject: Re: Current mainline (3.6-rc3) UBIFS errors
Message-ID: <20120823112732.32ed62d5@archvile>
In-Reply-To: <1345711673.2848.214.camel@sauron.fi.intel.com>
References: <20120823095048.6c6ee35a@archvile>
 <1345709408.2848.207.camel@sauron.fi.intel.com>
 <20120823103934.1028f491@archvile>
 <1345711673.2848.214.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Aug 2012 11:47:53 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2012-08-23 at 10:39 +0200, David Jander wrote:
> > On Thu, 23 Aug 2012 11:10:08 +0300
> > Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > 
> > > On Thu, 2012-08-23 at 09:50 +0200, David Jander wrote:
> > > > [    4.069409] UBI warning: ubi_io_read: error -74 (ECC error) while
> > > > reading 160 bytes from PEB 5616:87112, read only 160 bytes
> > > 
> > > Hi, looks like a problem with your driver. For some reasons it returns
> > > ECC errors when reading small amount of data (160 bytes). Did you run
> > > mtd tests - to they pass?
> > 
> > I thought so at first, but this error appeared on two different hardware
> > platforms at the same time, when upgrading to latest mainline. I am coming
> > from kernel 3.1, which worked fine on the MPC5121e. The ARM platform also
> > worked without problems on a previous version (I think it was 3.4-something,
> > not so sure right now). The only common piece of hardware/driver is the actual
> > NAND flash chip on both boards (Samsung K9K8G08... SLC 8Gbit NAND), so I
> > thought this had to be a (temporary) issue in current mainline code.
> 
> A change in the mtd layer probably caused this.
> 
> > > So UBI just tells that it cannot read, the root-cause is in the driver.
> > 
> > Two different drivers... same issue!?
> 
> Quite possible if there is a bug in mtd layer. First try to find out the
> latest working kernel release.

Ok, sounds reasonable.
I found kernel 3.5 works fine. Now bisecting...

> > Can you tell if I am supposed to be able to mount a UBIFS device formatted
> > with 3.1 on latest mainline without trouble? Is there a chance OOB layout may
> > have changed, or something similar? I tried reformatting with 3.6-rc2 just in
> > case, but the problem remained.
> 
> Absolutely yes, we maintain on-flash format compatibility and you do not
> have to re-format your flash.

Good to know! I had such an issue before, when upgrading our customer from
Freescale's 2.6.25 kernel to 3.1 mainline. Freescale had a different OOB/ECC
layout. The upgrade procedure was a PITA and involved making a filesystem
backup/restore to a USB device :-(

Best regards,

-- 
David Jander
Protonic Holland.
