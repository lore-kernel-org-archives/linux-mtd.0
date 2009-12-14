Received: from mail-gx0-f210.google.com ([209.85.217.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKDLA-0001G9-BW
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 16:00:08 +0000
Received: by gxk2 with SMTP id 2so2976353gxk.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Dec 2009 08:00:01 -0800 (PST)
Date: Mon, 14 Dec 2009 10:59:47 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: New mtd-utils release?
Message-ID: <20091214155947.GD16448@hansolo.jdub.homelinux.org>
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
	<20091214135614.GC16448@hansolo.jdub.homelinux.org>
	<87zl5lr525.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zl5lr525.fsf@macbook.be.48ers.dk>
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@caiaq.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 14, 2009 at 03:41:38PM +0100, Peter Korsgaard wrote:
>>>>>> "Josh" == Josh Boyer <jwboyer@gmail.com> writes:
>
>Hi,
>
> Josh> I've avoided doing a release because there isn't a really good
> Josh> way to correlate mtd-utils to kernel version.  I don't believe
> Josh> there have been any on-disk (Ha!) UBIFS format changes, and UBI
> Josh> itself hasn't had format changes for a long time, so it is
> Josh> probably safe to do that now.
>
>Well, you'll have those version issues anyway - With known-good git
>SHA1's or releases. Adding a release would just make more people use the
>same revision, instead of people using git head of whatever day they
>needed mtd-utils.

This is true.  I just feel better about saying 'use git head' or
'upgrade your kernel' than I do trying to come up with some kind of
mapping.

> Josh> (Also, I believe nandwrite is _STILL_ broken with the OOB stuff.)
>
>Ok, what is the issue? Anyone working on fixing it? Did it work back in
>1.2.0?

The MEMSETOOBSEL ioctl no longer exists in the kernel. It worked in 1.2.0
assuming you were using a sufficiently old enough kernel.  I can't recall
if anyone is working on fixing it or not, but Thomas has mentioned that
there is a patch floating around somewhere.

josh
