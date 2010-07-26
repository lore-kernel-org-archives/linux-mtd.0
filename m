Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdG9B-00068t-2G
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 05:22:42 +0000
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 08:21:54 +0300
Message-ID: <1280121714.14917.40.camel@localhost>
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

Hi,

On Thu, 2010-07-22 at 14:37 -0400, Matthew L. Creech wrote:
> Hi,
> 
> I have some UBI[FS]-based devices that I keep getting this warning on,
> and I'm wondering if someone could help me to understand what it means
> (and how to fix it).  Here's an example syslog snippet:
> 
> Jan  1 00:00:32 kernel: UBI: attaching mtd1 to ubi0
> Jan  1 00:00:32 kernel: UBI: physical eraseblock size:   131072 bytes (128 KiB)
> Jan  1 00:00:32 kernel: UBI: logical eraseblock size:    129024 bytes
> Jan  1 00:00:32 kernel: UBI: smallest flash I/O unit:    2048
> Jan  1 00:00:32 kernel: UBI: sub-page size:              512
> Jan  1 00:00:32 kernel: UBI: VID header offset:          512 (aligned 512)
> Jan  1 00:00:32 kernel: UBI: data offset:                2048
> Jan  1 00:00:32 kernel: UBI warning: ubi_eba_init_scan: cannot reserve
> enough PEBs for bad PEB handling, reserved 75, need 81
> Jan  1 00:00:32 kernel: UBI: attached mtd1 to ubi0
> Jan  1 00:00:32 kernel: UBI: MTD device name:            "ubi"
> Jan  1 00:00:32 kernel: UBI: MTD device size:            1019 MiB
> Jan  1 00:00:32 kernel: UBI: number of good PEBs:        8117
> Jan  1 00:00:32 kernel: UBI: number of bad PEBs:         35
> Jan  1 00:00:32 kernel: UBI: max. allowed volumes:       128
> Jan  1 00:00:32 kernel: UBI: wear-leveling threshold:    4096
> Jan  1 00:00:32 kernel: UBI: number of internal volumes: 1
> Jan  1 00:00:32 kernel: UBI: number of user volumes:     1
> Jan  1 00:00:32 kernel: UBI: available PEBs:             0
> Jan  1 00:00:32 kernel: UBI: total number of reserved PEBs: 8117
> Jan  1 00:00:32 kernel: UBI: number of PEBs reserved for bad PEB handling: 75
> Jan  1 00:00:32 kernel: UBI: max/mean erase counter: 2/1
> Jan  1 00:00:32 kernel: UBI: image sequence number: 0
> Jan  1 00:00:32 kernel: UBI: background thread "ubi_bgt0d" started, PID 197
> 
> Everything seems okay, except for that complaint about not being able
> to reserve enough PEBs.  I'm not sure why I get this, or what I can do
> about it.  A search turns up this thread:
> 
> http://patchwork.ozlabs.org/patch/42566/
> 
> which implies that one of the UBI volumes was too large & didn't leave
> enough space for reserved PEBs.  But I don't think that applies to me,
> or what I could do about it.  My bring-up process is as follows:

UBI wants 1% of PEBs to be reserved for bad block handling.

> =====
> 1. My bootloader partition is 5MB out of 1GB, and the rest of NAND is
> a UBI partition housing a single UBIFS filesystem.  That's 8152 blocks
> @ 128kB each (ignoring OOB).

OK.

> 2. I create my UBIFS image with:
> 
> mkfs.ubifs -m 2048 -e 129024 -c 8152 -x lzo -U -v -r ./.tmp/ -o ubifs.img
> 
> The only thing I'm unsure about is the "-c 8152", but since that's the
> *maximum* LEB count, I'd assumed it was okay to leave it as the full
> size of my NAND partition.  (I don't know how many blocks are bad, so
> otherwise I'll have to pessimistically limit the size & waste space)

This looks ok, including -c

> 3. I create a UBI image (suitable for flashing) with:
> 
> ubinize -o ubi.img -m 2048 -p 128KiB -m 2048 -s 512 ubi.cfg
> 
> The file ubi.cfg is as follows:
> 
> [ubifs-container]
> mode=ubi
> image=ubifs.img
> vol_id=0
> vol_size=100MiB
> vol_type=dynamic
> vol_name=container
> vol_flags=autoresize
> 
> Since autoresize is set, presumably vol_size doesn't have much effect,
> correct?  My understanding is that when the device boots for the first
> time, it'll see the autoresize flag and expand the volume size to fill
> whatever space is available after accounting for bad blocks (nearly
> 1019MB).

Yes. But in the log you sent I do not see any message about autoresize
happening - UBI prints them.

Just in case, about autoresize:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_autoresize

Also, search for word "reserved" on that page, you may get more info
about what is this PEB reservation is - but in short, it is to handle
bad PEBs.

> 4. I add ECC info and use a hardware NAND programmer to flash the device.
> =====

Does it erase whole flash before writing the image? I see that your
image sequence number is 0, which means you probably use old ubi tools.
Please, use the latest ubinize - it should pick random sequence number,
or you may use -Q option.

The reason why we introduced this was to detect situation when you have
flash with valid UBI image, then flash new image on top, but do not
erase the eraseblocks you did not flash. This may also happen due to an
error while flashing or interrupted flashing.

If the old and new image sequence numbers are different, UBI will notice
this. Otherwise it may silently accept the "mixed" image and you may
end-up with strange errors.

It does not look like this is the case for you, but still, make sure
your image sequence numbers are not always zero, to play safe.

> 
> Does this all look correct?  Or are my options wrong in one of these steps?

Look correct.

When you see this warning, can you mount UBIFS? Does it look OK?

> I'm mainly trying to understand what this particular warning means,
> and ensure that my procedure is correct.  I'm having other UBI-related
> problems on this platform, and want to be sure that this isn't the
> cause before I dig further into other possibilities.
> 
> Any help is appreciated, thanks!

Can you please enable UBI debugging messages and also "Additional UBI
initialization and build messages" and attach a log? See this writing
for help: http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
