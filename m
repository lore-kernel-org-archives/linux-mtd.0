Received: from ipmail06.adl6.internode.on.net ([150.101.137.145])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7Yfw-0005Dm-Oo
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2015 00:36:25 +0000
Date: Wed, 24 Jun 2015 10:33:35 +1000
From: Dave Chinner <david@fromorbit.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
Message-ID: <20150624003335.GG22807@dastard>
References: <1433831809.28854.17.camel@sauron.fi.intel.com>
 <55769D97.3010602@nod.at> <5577AC03.9060909@cn.fujitsu.com>
 <1433928078.14092.1.camel@sauron.fi.intel.com>
 <55780D1C.6080907@cn.fujitsu.com>
 <1433931934.14092.11.camel@sauron.fi.intel.com>
 <557812A4.8020409@cn.fujitsu.com>
 <1433934324.14092.15.camel@sauron.fi.intel.com>
 <55892D18.3020203@cn.fujitsu.com>
 <1435056240.7659.69.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435056240.7659.69.camel@sauron.fi.intel.com>
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 23, 2015 at 01:44:00PM +0300, Artem Bityutskiy wrote:
> On Tue, 2015-06-23 at 17:55 +0800, Dongsheng Yang wrote:
> > In short, I think force_atime to ubifs is the choice from my opinion.
> 
> So will we end up with this:
> 
> -o - no atime support
> -o atime - no atime support
> -o noatime - same, no atime support
> -o force_atime - full atime support
> -o relatime - relative atime support
> -o lazyatime - lazy atime support

> IOW, atime/noatime mount options have no effect on UBIFS. To have full
> atime support - people have to use "force_atime". And then the rest of
> the standard options are supported.

That's the exact semantics of the standard -o strictatime option.
See the mount(8) man page:

       strictatime
	      Allows  to  explicitly requesting full atime updates.
	      This makes it possible for kernel to defaults to
	      relatime or noatime but still allow userspace to
	      override it. For more details about the default system
	      mount options see /proc/mounts.

It's passed down to the kernel via the MS_STRICTATIME flag. All
you need to do is make ubifs aware of this flag...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
