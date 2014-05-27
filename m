Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpIne-0001ST-VJ
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 14:56:23 +0000
Message-ID: <1401202545.1304.164.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 27 May 2014 17:55:45 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B4091B2@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
 ,<1401194249.1304.140.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4091B2@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-05-27 at 14:15 +0000, Mats Kärrman wrote:
> Artem, 
> 
> On Tuesday, May 27, 2014 2:37 PM, Artem Bityutskiy wrote:
> > But I think I see the problem with this solution now.
> >
> > The problem is that with this we won't get power cut emulated while you
> > mount the file system.
> >
> > Before this change, we could have something like:
> >
> > 1. Working with the FS, power-cut
> > 2. Unmount the FS, start mounting -> power-cut in the middle of mount.
> > 
> > So we could test power cuts while we are in the middle of recovery from
> > the previous power cuts, in a way "nested" power-cuts.
> > 
> > With your change, we never have them.
> 
> With the old version we didn't get a power-cut at all, unless power-cuts
> were first globally enable by writing "1" to 
> /sys/kernel/debug/ubifs/tst_recovery.
> 
> This is still possible!

Ah, yes, it is enabled _outside_ of the test. And with this patch, the
per-FS one is enabled _inside_ the test.

With this patch we have the following issues:

1. -p enables per-FS power cut emulation automatically, however, you
have bad coverage (the most problematic code in the UBIFS driver is
related to the "nested" cuts, IIRC)

2. For better coverage, you have to to manually enable global power
cuts.

So, those who test UBIFS with nandsim, may mistakenly think -p is all
they need, and they miss a fair amount of coverage. Not good.

And we have an inconsistency: the test is able to touch the per-FS power
cuts debugfs files, which is nice and user-friendly, but the global
power cuts debugfs file has to be touched manually. Not nice.


How about this compromise solution which should be simple enough to
implement, but I am not sure it is good enough to you.


Change -p so that it takes an _argument_. The argument should be a path
to the debugfs file which controls the power cuts emulation. This can be
either global or the per-FS switch.

All the test will do is writing '1' to this file as soon as it starts,
and as soon as it mounts or re-mounts the FS.

Now, it is your choice which file path to give - the global or the
per-FS.

What do you think?

-- 
Best Regards,
Artem Bityutskiy
