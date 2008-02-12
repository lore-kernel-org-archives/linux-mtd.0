Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JOwxD-0003xe-ME
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 15:21:57 +0000
Date: Tue, 12 Feb 2008 16:21:24 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <20080212152124.GA21878@lazybastard.org>
References: <chaz20080212134751.GI30304@artesyncp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <chaz20080212134751.GI30304@artesyncp.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 12 February 2008 13:47:51 +0000, Stephane Chazelas wrote:
> 
> this patch addresses a number of small issues mainly regarding
> the output made by this driver to dmesg:
>   - Some of the "blkmtd"'s had not been changed to "block2mtd"
>     which caused display problem
>   - the parse_err() macro was displaying "block2mtd: " twice

Fairly obvious fixes.

> Also, one can add a block2mtd mtd device with things like:
> 
> echo /dev/loop3,$((256*1024)) |
>   sudo tee /sys/module/block2mtd/parameters/block2mtd
> 
> but individual mtds cannot be removed. You can only do a
> modprobe -r block2mtd to remove *all* the block2mtd mtds.
> 
> This patch proposes to add the cabability with:
> 
> echo /dev/loop3,remove |
>   sudo tee /sys/module/block2mtd/parameters/block2mtd

Sounds sane enough.  But I do have some reservations about the
implementation.  It would be best if you split the patch in two.  One
with the obvious stuff above and one for this.

The core of remove_device_by_name() is shared with block2mtd_exit(),
so a common helper would be good.  Your error handling is better, so
let's keep that version.

And independently of your patch a mutex protecting the device list from
simultaneous modifications would be good to have.

Side note: I may not have internet access until 19th or so.

Jörn

-- 
Rules of Optimization:
Rule 1: Don't do it.
Rule 2 (for experts only): Don't do it yet.
-- M.A. Jackson
