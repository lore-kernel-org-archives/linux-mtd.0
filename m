Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z845e-0007nI-Kp
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 10:09:03 +0000
Message-ID: <1435226918.9627.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Thu, 25 Jun 2015 13:08:38 +0300
In-Reply-To: <558BD010.6020207@cn.fujitsu.com>
References: <1433831809.28854.17.camel@sauron.fi.intel.com>
 <55769D97.3010602@nod.at> <5577AC03.9060909@cn.fujitsu.com>
 <1433928078.14092.1.camel@sauron.fi.intel.com>
 <55780D1C.6080907@cn.fujitsu.com>
 <1433931934.14092.11.camel@sauron.fi.intel.com>
 <557812A4.8020409@cn.fujitsu.com>
 <1433934324.14092.15.camel@sauron.fi.intel.com>
 <55892D18.3020203@cn.fujitsu.com>
 <1435056240.7659.69.camel@sauron.fi.intel.com>
 <20150624003335.GG22807@dastard> <558BD010.6020207@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Dave Chinner <david@fromorbit.com>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thu, 2015-06-25 at 17:55 +0800, Dongsheng Yang wrote:
> On 06/24/2015 08:33 AM, Dave Chinner wrote:
> > On Tue, Jun 23, 2015 at 01:44:00PM +0300, Artem Bityutskiy wrote:
> >> On Tue, 2015-06-23 at 17:55 +0800, Dongsheng Yang wrote:
> >>> In short, I think force_atime to ubifs is the choice from my opinion.
> >>
> >> So will we end up with this:
> >>
> >> -o - no atime support
> >> -o atime - no atime support
> >> -o noatime - same, no atime support
> >> -o force_atime - full atime support
> >> -o relatime - relative atime support
> >> -o lazyatime - lazy atime support
> >
> >> IOW, atime/noatime mount options have no effect on UBIFS. To have full
> >> atime support - people have to use "force_atime". And then the rest of
> >> the standard options are supported.
> >
> > That's the exact semantics of the standard -o strictatime option.
> > See the mount(8) man page:
> >
> >         strictatime
> > 	      Allows  to  explicitly requesting full atime updates.
> > 	      This makes it possible for kernel to defaults to
> > 	      relatime or noatime but still allow userspace to
> > 	      override it. For more details about the default system
> > 	      mount options see /proc/mounts.
> >
> > It's passed down to the kernel via the MS_STRICTATIME flag. All
> > you need to do is make ubifs aware of this flag...
> 
> Hi Dave, thanx for your suggestiong, but sorry, it's a little confusing
> to me :(.

I do not know the history, but IIUC, this is what Dave's hint translates
to for UBIFS:

-o - default behavior (no atime)
-o atime - default behavior (no atime)
-o noatime - default behavior (no atime)

-o strictatime - full atime support
-o relatime - relative atime support
-o lazyatime - lazy atime support

Is this logical from user's perspective? No, but this is a standard
"hack", not an UBIFS-only "hack", so we are fine.

"force_atime" that you are suggesting would be UBIFS-only hack, which is
not as fine as a standard and documented "hack".

IOW, atime/noatime are the "don't use" options, they are ignored and
every file-system is free to use its own defaults, be that noatime or
relatime or strictatime. If you want to tell the FS what to do, use
strictatime/relatime/lazyatime.

Does it make sense?
