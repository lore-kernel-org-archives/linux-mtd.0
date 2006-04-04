Received: from 66.239.25.20.ptr.us.xo.net ([66.239.25.20] helo=zoot.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQbix-00057X-8t
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 22:57:00 -0400
To: "H. Peter Anvin" <hpa@zytor.com>
References: <20060329232520.1677d2b3.akpm@osdl.org>
	<442C0494.2040609@zytor.com> <20060330114014.53150d1b.akpm@osdl.org>
	<442C6B78.3060706@zytor.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: Mon, 03 Apr 2006 20:56:26 -0600
In-Reply-To: <442C6B78.3060706@zytor.com> (H. Peter Anvin's message of "Thu,
	30 Mar 2006 15:36:24 -0800")
Message-ID: <m3hd5anj51.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"H. Peter Anvin" <hpa@zytor.com> writes:

> There seems to be a few options, in order from least work to more work:
>
> - Removing the blkmtd driver and tell people to use block2mtd;
> - Have kinit intercept blkmtd configuration options and emulate them using
> block2mtd;
> - Adjust blkmtd to have a configuration interface, and then make kinit configure
> it.

Block devices are not especially interesting when working with flash chips, as they
are an emulation layer.  The character devices are much more interesting,
and the native filesystems don't go through a block or a character device.
So killing blkmtd sounds like a reasonable thing to do.

Given that klibc will reduce the size of the kernel I expect most embedded
users will in general be in favor of it.

So I suggest what happens is that we deprecate blkmtd in Documentation/FeatureRemoval
of 2.6.17 and delete it in the -mm tree.

Then you can merge klibc.

Does any one have a problem with that plan?

Eric
