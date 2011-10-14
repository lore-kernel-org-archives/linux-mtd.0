Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REfkM-0003Mc-MO
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 11:16:15 +0000
Received: by wwg9 with SMTP id 9so671007wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 04:16:12 -0700 (PDT)
Subject: Re: ubi vol_size and lots of bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Date: Fri, 14 Oct 2011 14:15:43 +0300
In-Reply-To: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
References: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318590949.12351.116.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniel,

On Mon, 2011-10-10 at 13:09 +0100, Daniel Drake wrote:
> One outstanding issue we have is that on some laptops, when switching
> from jffs2 to ubifs, the laptop simply does not boot (root fs mounting
> difficulties).
> 
> One case of this is when there are a large number of bad blocks on the
> disk, during boot we get:
> [   76.855427] UBI error: vtbl_check: too large reserved_pebs 7850,
> good PEBs 7765
> [   76.867878] UBI error: vtbl_check: volume table check failed:
> record 0, error 9

Would be great if you also attached full kernel log with UBI debugging
enabled and probably build messages enabled. Just makes it easier when
you can see UBI output about the flash geometry, etc. 

> With so many bad blocks, this is likely a problematic nand or a
> corrupt BBT. However, jffs2 worked in this situation, and (with many
> of our laptops in remote places) it would be nice for us to figure out
> how to make ubifs handle it as well.
> 
> 
> There are other cases of this error in the archive, and people have
> generally solved it by using a smaller vol_size in the ubinize config.
> Am I right in saying that reserved_pebs is computed from the vol_size
> specified in the ubinize config?
> 
> I guess "good PEBs" is calculated from the amount of non-bad blocks
> found during the boot process.

Yes, I believe it is just amount of non-bad eraseblocks.

> This suggests that using vol_size is unsafe for installations such as
> ours, where while we do know the NAND size in advance, we also want to
> support an unknown, high number of bad blocks which will vary
> throughout the field.

But this is why the autoresize flag was introduce.

When creating UBI image, you have to know how big your volume has to be.
At least you need to know the _minimum_ size. And you should use this
minimum volume size in your ubinize config file.

> I found a note in the UBI FAQ where it says vol_size can be excluded
> and it will be computed to be the size of the input image, and then
> the autoresize flag can be used to expand the partition later.
> Excluding vol_size in this way indeed solves the problem and the
> problematic laptop now boots.

Well, you probably need some free space as well. Just come up with
some minimum number, say 300MiB and use this number for volume size in
ubinize, and use autoresize flag.

In this case, when you flash this image to your device, UBI will
automatically resize this volume to the maximum possible size.

> So, am I right in saying that for an installation such as OLPC, where
> resilience to strange NAND conditions involving high numbers of bad
> blocks is desired, it is advisable to *not* specify vol_size in
> ubinize.cfg?

Yes, I think you can do this, I think.

> (If so I'll send in a FAQ update for the website.)
> 
> The one bit I don't understand is what happens if another block goes
> bad later. If the autoresize functionality has modified reserved_pebs
> to represent the exact number of good blocks on the disk (i.e.
> reserved_pebs==good_PEBs), next time a block goes bad the same
> reserved_pebs>good_PEBs boot failure would be hit again. But I am
> probably missing something.

Autorisize will not occupy the PEBs reserved for bad block handling.

Dunno how much you looked into UBI code, but it works roughly like this:

1. avail_pebs = good_pebs
2. read volume table, and avail_pebs -= reserved_pebs for each volume,
   i.e., we subtract the amount of PEB which all volumes absolutely
   require.
3. initialize other subsystems, and subtract EBA_RESERVED_PEBS=1,
   WL_RESERVED_PEBS=1. IOW, every subsystem subtracts amount of PEBs
   it requires to operate. E.g., Wear-levelling (WL) subsystem requires
   one eraseblock for its purposes, etc.
4. In 'ubi_eba_init_scan()' function we calculate the normal amount of
   PEBs which we reserve for bad blocks handling (default is 1%), and
   subtract that amount from avail_pebs. If avail_peb's is already
   very small, it will become zero in this case.
5. At the very end, we increase the autoresize-marked volume by what
   is left in avail_pebs.

IOW, autoresize will not touch PEBs reserved for BB handling.

Remember, UBIFS also does autoresize automatically, but it is limited by
what you specified with -c option to mkfs.ubifs. So specify large enough
number, but not too large, because the larger it is, the more space
UBIFS will reserve for LPT. But only power-of-2 boundaries make
difference for UBIFS. IOW, 4000 and 4095 LEBs in -c are equivalent from
UBIFS POW. But 4095 and 4096 make a difference.

So whatever you specify for -c (say -c X), you can make that to be
"-c roundup_pow_of_two(X) - 1" and this will not affect anything. 
But "roundup_pow_of_two(X)" will make UBIFS image a bit larger.

I think this info is in the web size in a more readable form.

Sorry if my reply is very messy, feel free to ask questions.

-- 
Best Regards,
Artem Bityutskiy
