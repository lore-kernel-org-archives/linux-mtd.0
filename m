Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKV3W-0004NO-2q
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 20:03:37 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Thu, 30 Nov 2017 21:03:37 +0100
Message-ID: <2908877.jEbli3qftF@blindfold>
In-Reply-To: <10097404-fd3d-73a3-6e0a-658fe8385cd2@colorfullife.com>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <5256290.ff6uB8SQ02@blindfold>
 <10097404-fd3d-73a3-6e0a-658fe8385cd2@colorfullife.com>
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

Am Donnerstag, 30. November 2017, 18:41:52 CET schrieb Manfred Spraul:
> Hi Richard,
> 
> On 11/28/2017 10:00 PM, Richard Weinberger wrote:
> > Manfred,
> > 
> > 
> > Am Donnerstag, 23. November 2017, 23:03:28 CET schrieb Manfred Spraul:
> > 
> > I tied, but TBH I'm completely lost in all the data you throwing on me.
> 
> Understood, I generated way too much data.
> I have also confused all my coworkers :-(

No problem.
We will sort this out. :-)
 
> Let's keep it simple and concentrate on the
> garbage_collect_leb()/ubifs_scan issue.
> 
> > Let's recap, you trigger a corruption that happens only(!) when xattrs are
> > used?
> 
> Correct, I only see the corruption when xattr is used.

Good.

> > How is Fastmap involved in the game? If so, I want to know whether you can
> > trigger without Fastmap being enabled.
> 
> Correct, I have seen the corruption without FASTMAP.

Also Good.

> > Which one is the image that failed first with chk_fs enabled?
> > On a vanilla kernel...
> 
> I have used a modified MTDRAM: I have patched it so that it writes every
> ERASE and every WRITE into a log.
> Both the addresses and the data.
> First, I have created an initial image
> (ubiformat/ubiattach/ubimkvol/ubidetach).
> Then I did a dump of it (nanddump /dev/mtd0 > dump-before.bin)
> Then I enabled logging, and run the test load (ubiattach/mount/mount
> ecryptfs/<many touch/write/rm/mv commands>/umount/ubidetach).
> Then I created a dump of the final image. (nanddump /dev/mtd0 >
> dump-after.bin)

Okay.

> Then the obvious cross checks:
> Initial image+apply all commands from the log is identical to the final
> image.
> 
> Now I can use the log to create virtual power fail events:
> 
> What if a power failure happens after 168168 commands?
> Image:
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/image-168168.bin/d
> ownload
> 
> Logfile of a mount without chk_fs:
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/r-168168.txt/downl
> oad
> 
> What was the last write command?
> FUNC_WRITE_CHK(addr=0xd61000, len=0x800)
> 
> What would have been the next write command:
> FUNC_WRITE_CHK(addr=0xd61800, len=0x800)
> 
> Image after that command:
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/image-168169.bin/d
> ownload

Which file contains the MTD with chk_fs being enabled?

What did you set for CONFIG_MTDRAM_TOTAL_SIZE and CONFIG_MTDRAM_ERASE_SIZE?

> 
> Just to clarify:
> I have simulated power fails.
> A bit like ubi_dbg_power_cut, but instead of stopping further
> writes/erase commands, I created a log file.
> And now I can replay the log to an arbitrary point, and then mount the
> result.
> I have a total of 5 logs, and from these 5 logs, I did around 100k
> replays and mounted the results.
> 
> --
>      Manfred
> 
> P.S.: I'm doing final polishing of the modifications to mtdram. As soon
> as I have the internal release, I will send it to linux-mtd.

Wonderful. Your tool seems to be a good stresstest.
I'd love to see it upstream.

> P.P.S.: To avoid any brown paperbag bugs: mtd->_erase and mtd->_write
> are allowed to sleep, correct? At least, st_spi_fsm contains mutex_lock().

I always assumed that they can sleep and everything else would surprise me.

Thanks,
//richard
