Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJmze-00082n-4m
 for linux-mtd@lists.infradead.org; Tue, 28 Nov 2017 21:00:43 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Tue, 28 Nov 2017 22:00:39 +0100
Message-ID: <5256290.ff6uB8SQ02@blindfold>
In-Reply-To: <4b60c157-438f-4197-879c-f1a8b87cbdf8@colorfullife.com>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <3046677.dsXx11Gx8o@blindfold>
 <4b60c157-438f-4197-879c-f1a8b87cbdf8@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manfred,


Am Donnerstag, 23. November 2017, 23:03:28 CET schrieb Manfred Spraul:
> Hi Richard,
> 
> I have now three datasets:
> - no xattr, no FASTMAP:
> The log consists of ~189.000 WRITE or ERASE commands.
> -- with chk_fs: 30.000 images tested, all ok.
> 
> -- with chk_fs, when splitting large writes at PAGE_SIZE: 814 images
> tested, all ok.
> 
> --> no issues at all when not using xattr.
> 
> - ecryptfs with ecryptfs_xattr_metadata:
> The log consists of ~188.000 WRITE or ERASE commands.
> 
> -- without chk_fs: 23.000 images tested, 5 not mountable images, all 5
> within garbage_collect_leb():
> 
> If I see it right, the root cause is always a node that crosses a page
> boundary:
> the first half of the node is written, the 2nd half is not written, it
> is still 0xff.
> These nodes cause CRC failures during scanning.
> (perhaps: output of layout_in_empty_space(), writing to a erased LEB
> instead of changing a LEB not properly handled?)
> 
> -- with chk_fs: 795 images tested, 62 not mountable.
> Obviously including the 5 above: chk_fs runs after recovery_completed,
> garbage_collect_leb() is run during recovery.
> 
> -- kill-orphaned-xattr, with chk_fs: 215 images tested, 156 not mountable.
> Note: This is not worse than without the patch. There are long streams
> of images that fail during chk_fs, 200 images is not enough for good
> statistics.
> And: I have not tested the same images as without the patch.
> 
> - ecryptfs with ecryptfs_xattr_metadata and with FASTMAP
> The log consists of ~197.000 WRITE or ERASE commands.
> 
> 21.000 images tested, 178 do not mount. all fail in chk_fs.
> 
> The failure is always something like this:
> > [34802.217857] UBIFS error (ubi0:0 pid 25706): ubifs_read_node: bad
> > node at LEB 243:74672, LEB mapping status 0
> > [34802.218965] Not a node, first 24 bytes:
> > [34802.218969] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff
> 
> I have not tested with chk_fastmap.
> And: Unlike above, where I tested the last images, I have here tested
> the first 20k images, thus a more or less empty media.
> The lower failure rate could be caused by that.
> 
> Did you have the time to look at the images?
> If you need more images, or if I should test a patch, just ask.

I tied, but TBH I'm completely lost in all the data you throwing on me.

Let's recap, you trigger a corruption that happens only(!) when xattrs are 
used?
How is Fastmap involved in the game? If so, I want to know whether you can 
trigger without Fastmap being enabled.

Which one is the image that failed first with chk_fs enabled?
On a vanilla kernel...

How did you save that image? I'd like to use it in my simulator too
Make sure to not store OOB data.

Thanks,
//richard
