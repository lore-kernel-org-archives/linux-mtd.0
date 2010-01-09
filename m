Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTkGy-0001rn-RK
	for linux-mtd@lists.infradead.org; Sat, 09 Jan 2010 22:59:13 +0000
Received: by fxm22 with SMTP id 22so22915186fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Jan 2010 14:59:06 -0800 (PST)
Subject: Re: confusion UBI overhead and volume size calculations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea60912210757q22ee209fi24363e9f236c3597@mail.gmail.com>
References: <dbdb2ea60912210757q22ee209fi24363e9f236c3597@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 00:58:51 +0200
Message-Id: <1263077931.7315.99.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello,

On Mon, 2009-12-21 at 10:57 -0500, twebb wrote:
> I'm very confused about the calculations for determining max-leb-cnt
> argument for mkfs.ubifs and vol_size for ubinize cfg file.
> 
> I have a 4GiB MLC nand device that has a 64M reserved area from
> 0x0-0x04000000.  The rest, 0x04000000-0x100000000 (4032M), is
> dedicated to a single MTD partition.  A single UBI device will attach
> to the single MTD partition and have 4 volumes.  I'm using mkfs.ubifs
> and ubinize at build time to create a single UBI image to be flashed
> to the MTD device.

Sounds OK, except that UBI / UBIFS might not be fully MLC-ready, see
here: http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

> The four volumes are...
> vol1 = 352M
> vol2 = 352M
> vol3 = 352M
> vol4 = 2976M

There is some UBI overhead. It reserves 2 PEBs for the volume table,
some amount for bad block handling (defaults to 1%), etc. This is
described here:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead

So basically UBI will take about 4 + 0.01 * 8064 = 85 PEBs, where
8064 PEBs comes from your 4032MiB / 512KiB.

Note, this 1% is taken from the amount of _good_ PEBs. 8064 is when
there are no bad PEBs at all, so this is the absolute maximum number.

> The device data sheet specifies that the minimum valid block count is
> 7992 (of 8192 possible), so it seems like I should reserve 200 blocks
> (100M) to allow for this.

Here we talk about factory-marked bad PEBs. Your data sheet specifies
that a new NAND chip will have 0-200 bad blocks.

It is important to understand that UBI will reserve 1% of good PEBs
anyway. It does not matter how many factory-marked bad PEBs you have.

But for MLC 1% is probably too small. This default was selected for SLC.
However, I've never worked with real raw MLC NAND flashes, so I do not
know.

Anyway, you have a dilemma of how big vol4 has to be. The answer is - of
course you should count only on minimum amount of good PEBs, i.e. 7864. 

> My questions are:
> 1.  How does the 100M reserved for "potentially bad blocks" get
> handled when calculating the vol_size for each volume in the .cfg
> file?  I'd like to leave vol1-3 intact and only take space from vol4.
> Would the vol_sizes be as follows?
> 
> vol1 vol_size = 352M
> vol2 vol_size = 352M
> vol3 vol_size = 352M
> vol4 vol_size = 2976M-100M = 2876M

Not exactly. You specify volume size in megabytes. Your PEB size is
512KiB, but LEB size will be smaller because of UBI headers. I do not
know your NAND flash's page size. But if it is 4KiB, LEB size will be
512KiB - 8KiB = 504KiB. This means that 352MiB of the "UBI space" will
"eat" 716 PEBs, not 704 PEBs as you calculated.

Let's re-calculate.

1. Your have 8064 PEBs.
2. Your LEB size is 504KiB. This basically means that each your PEB
gives you 504KiB of "UBI space", not 512KiB.
3. Your flash can have up to 200 factory-marked bad PEBs. This means
that in the worst case your will have 7864 PEBs.
4. UBI will reserve 4 + 0.01 * 7864 ~ 83 PEBs, this means that you will
actually have only 7781 PEBs for your needs.
5. You want vol1 to be 352MiB, this is about 352MiB / 504KiB ~ 716PEBs.
6. So for vol1 - vol3 you will "spend" 716 * 3 = 2148PEBs.
7. And now you have 7781 - 2148 = 5633 PEBs left for vol4.
8. 5633 PEBs will give you about 5633 * 504KiB ~ 2772MiB of "UBI space".
9. This means for vol4 you will have _minimum_ 2772MiB.

You are free to similarly calculate the maximum - just drop step 3.

If my assumption about the NAND page size is wrong, you will need to
re-calculate as well.

This means you ubinize.cfg will look like this (not testes! can contain
mistakes!):

[volume1]
mode=ubi
image=vol1.img
vol_id=0
vol_size=352MiB
vol_type=dynamic
vol_name=vol1

[volume2]
mode=ubi
image=vol2.img
vol_id=1
vol_size=352MiB
vol_type=dynamic
vol_name=vol2

[volume3]
mode=ubi
image=vol3.img
vol_id=2
vol_size=352MiB
vol_type=dynamic
vol_name=vol3

[volume4]
mode=ubi
image=vol4.img
vol_id=3
vol_size=2772MiB
vol_type=dynamic
vol_name=vol4
vol_flags=autoresize

See: http://www.linux-mtd.infradead.org/faq/ubi.html#L_ubi_mkimg

This means that all your devices will have vol4 of exactly the same
size. And because most of the chips will have much less than 200
factory-marked bad PEBs, you will have some amount of extra available
space, which will basically be unused.

However, you may want to have fixed vol1-vol3 sizes (352MiB), and use
all the rest of the available PEBs for vol4. In this case it will be
_minimum_ 2772MiB, but in most cases a little larger (calculate
yourself).

If you do want this, use the "autoresize" flag for vol4:

vol_flags=autoresize

With the autoresize flag, when UBI attaches the flash for the first
time, it will re-size vol4 automatically to make it occupy all the
available space.

Read here:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_autoresize

> 2.  How is the overhead calculation from the linux-mtd site used in
> determining the vol_sizes?  ("The UBI overhead is (B + 4) * SP + O *
> (P - B - 4) i.e., this amount of bytes will not be accessible for
> users.")

I think I have elaborated above. If you still have questions, see here:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead

and ask specific questions please.

> 3.  Is max-leb-cnt simple the vol_size/LEB_size?

Please, refer here:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt

In your case, for vol1-vol3:

352MiB / 504KiB ~ 716 LEBs. And this is your max-leb-cnt.

But for UBIFS only "power-of-2" boundaries matter, this means you can
safely use max-leb-cnt = 1023. From the performance POW this will be the
same as max-leb-cnt = 716.

So, I recommend max-leb-cnt = 1023.

For vol4, your _minimum_ size is 2772MiB, so 2772MiB / 504KiB ~ 5633
LEBs. But if you use the auto-resize flag, your maximum vol4 size will
be a bit larger. Please, calculate yourself similarly.

However, you can just use max-leb-cnt = 8191.

> I'm really lost on this.  I'd appreciate any input anyone may have on this.

Yes, I can believe this stuff is confusing for newcomers. Sorry for
these complexities, exposed on you. The thing is that all this stuff is
very bound to the physical flash geometry. And because we try to work on
all kinds of flashes, you have to specify so many parameters.

P.S.: it is 00:50 here, I could make a type / mistake in my
calculations. But you should grasp the ideas.

HTH

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
