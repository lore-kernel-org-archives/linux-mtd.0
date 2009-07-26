Received: from thunk.org ([69.25.196.29] helo=thunker.thunk.org)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MVCtG-0000yt-EM
	for linux-mtd@lists.infradead.org; Sun, 26 Jul 2009 23:12:31 +0000
Date: Sun, 26 Jul 2009 19:07:15 -0400
From: Theodore Tso <tytso@mit.edu>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 0/2] RFC: Add support for UBI and UBIFS
Message-ID: <20090726230715.GD17272@mit.edu>
References: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
Cc: dedekind@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 15, 2009 at 11:38:42AM +0200, Corentin Chary wrote:
> Hi,
> Here is two patch to add support for UBI and UBIFS in libblkid
> With that, if you type "blkid" it will show you UBIFS filesystem.
> 
> The thing is that I'm not sure this patch is really usefull as UBIFS
> is a "nodev" filesystem, and it doesn't deal with block devices.
> 
> I first started theses patch to be able to do stuff like:
> mount /dev/ubi0_0 /mnt/test but we need to patch UBIFS for that.
> 
> So, do you think we should be able to do that ? If it's ok, these
> two patch are a first step.

Sorry for the delay in getting back to you; things have been pretty
busy this past week or two.  Can you get me small (preferably under
200k) sample filesystem images for the purposes of regression testing?

Also, the blkid library is in the process of being transferred to
util-linux-ng.  So I'm willing to apply the patches, but they also
need to be ported to the version of the blkid library in util-linux-ng
to make sure this feature doesn't get lost when distributions start
transitioning to util-linux-ng.

Regards,

					- Ted
