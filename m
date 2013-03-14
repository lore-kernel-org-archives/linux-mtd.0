Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG5PP-0006nE-Uo
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 10:29:16 +0000
Message-ID: <1363257009.11441.97.camel@sauron.fi.intel.com>
Subject: Re: MTD : Kernel oops when remounting ubifs as read/write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 14 Mar 2013 12:30:09 +0200
In-Reply-To: <51419E3A.8030007@mimc.co.uk>
References: <5134CEF9.5070502@mimc.co.uk>
 <1363087506.3348.62.camel@sauron.fi.intel.com>
 <51405F3A.3090901@mimc.co.uk>
 <1363252425.11441.94.camel@sauron.fi.intel.com>
 <51419E3A.8030007@mimc.co.uk>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-03-14 at 09:54 +0000, Mark Jackson wrote:
> On 14/03/13 09:13, Artem Bityutskiy wrote:
> > On Wed, 2013-03-13 at 11:12 +0000, Mark Jackson wrote:
> >> Sorry ... this just locks up the unit.
> > 
> > OK, I've reproduced the issue with 3.9-rc2 in nandsim, see the details
> > below. The patch I proposed did not get the error path correctly, but it
> > does fix the issue.
> > 
> > I think what you treat as "lockup" is the fixup process. UBIFS basically
> > reads the entire UBI volume and writes it back. And it uses the atomic
> > change UBI service, which means it also calculates CRC of everything it
> > writes. And this all just takes a lot of time. This has to be done only
> > once on the first mount.
> 
> Okay ... I've retried, but how long is "a lot of time" ?
> 
> I've waited 15 minutes and still nothing.
> 
> And I can see that there's no activity on the NAND chip select !?!
> 
> I'll put some debug info into the fixup routines to see if I can trace what's going on.

Just to make sure - try this last patch I sent. I did test it with
nandsim at least, and I am sure it works. I did not test at all the
first one.

And yes, debug messages would be useful, just do not forget to add the
'ignore_loglevel' kernel boot option, otherwise you won't see the
messages on your console, since they are of KERN_DEBUG level.

You may have other issues which cause lockup, e.g., in driver level. It
makes sense to validate your flash with MTD test modules.

-- 
Best Regards,
Artem Bityutskiy
