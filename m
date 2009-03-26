Received: from risingsoftware.com ([207.192.70.63]
	helo=li32-63.members.linode.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmkGk-0000W1-MV
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 07:45:01 +0000
Date: Thu, 26 Mar 2009 18:44:43 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: ubifs version 1 compatibility
Message-ID: <20090326074443.GA7842@cloud.net.au>
References: <20090326051508.GA4760@cloud.net.au>
	<1238049297.3321.20.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1238049297.3321.20.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 26, 2009 at 08:34:57AM +0200, Artem Bityutskiy wrote:
> On Thu, 2009-03-26 at 16:15 +1100, Hamish Moffatt wrote:
> > Hi Artem and all,
> > 
> > I'm upgrading my embedded system which uses UBIFS from 2.6.24 (with a
> > slightly updated ubifs) to 2.6.29.
> > 
> > I notice that the new kernel won't read my existing file systems as it
> > says they are too old - version 1. The code checks for version 3 or 4 I
> > see.
> > 
> > My application firmware is generated with mkfs.ubifs and programmed via
> > ubiupdatevol, but the boot loader on my devices is based on the older
> > kernel and won't be able to read it. And I have read-write file systems
> > that will be formatted with the old version too.
> 
> I've took a brief look. UBIFS went into mainline with format version 4,
> and versions 1,2,3 were more development versions. There were changes in
> the truncation node format and in inode node format. I would probably
> be possible to have compatibility mode, but it is big job :-(
> 
> Your boot-loader is Linux kernel-based, right? Does it have write
> support, or it is read-only?
> 
> Is it possible to upgrade the boot-loader at the same time you upgrade
> the kernel on your devices?
> 
> Side note: now when u-boot supports UBIFS, we need to re-think our
> versioning scheme and strictly preserve R/O compatibility.

Hi Artem,

Yes our version 1 media is from pre-mainline UBIFS and we took our
chances by including it. We are shipping one product using 2.6.24 with
old backported UBIFS and it's working very well. I don't have any
expectations of support for the old version, so thanks for your
assistance thus far.

Fortunately the kernel upgrade is for a newer product where we have some
more flexibility in fixing this problem.

We can upgrade our boot loader to 2.6.29 also so that it can read UBIFS
v4 media. This has to be co-ordinated with the main firmware image but
this is reasonable.

We do have one volatile UBIFS volume that we want to preserve. Is there
any way we could convert it? For example a user-space utility that could
read the old media version?

Maybe before upgrade we could run mkfs.ubifs using the contents of the
existing volume to create the new format, unmount it and ubiupdatevol it..


regards
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
