Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRPO8-0004zS-Ij
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 11:44:40 +0000
Subject: Re: ubiupdatevol
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jelle Martijn Kok <jmkok@youcom.nl>
In-Reply-To: <4A5DBBB0.9050203@youcom.nl>
References: <4A5DBBB0.9050203@youcom.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 14:44:19 +0300
Message-Id: <1247744659.11353.131.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 13:21 +0200, Jelle Martijn Kok wrote:
> Why is it not possible to write directly to a static volume ?
> eg. perform "wget http://server.com/kernel.bin -O /dev/ubi0_2"

Because the update operation needs to know the size of the data
you are going to write. But if you know the size, you can do
something like:

wget -o - http://server.com/kernel.bin | ubiupdatevol -s X /dev/ubi0_2

> ubiupdatevol first performs a ioctl + UBI_IOCVOLUP (with the size) and 
> then starts writing normally. Why not allow for open, write, close 
> without this ioctl ?

I think because we want to know the data size in advance. This is
because we store total data size in the VID header for static volume,
so we should know it early. I do not remember where this comes from,
though. We could avoid doing this though, and store it in the volume
table only, though.

I mean, glance at 'struct ubi_vid_hdr'. There is the 'data_size'
field. And this is the fundamental reason why we want to know 
the volume size beforehand.

I think this is because IBM guys (haver at all) did not want to read
the volume table in their boot loader. The wanted to read only VID
headers, ignore those PEBs which do not belong to the static volume
where they store the kernel. And I think this all comes from the
4 KiB limitation for the boot loader they had.

And I think I had a small fight with the guys where I said this
should be stored in the volume table, not in the headers. But they
won the battle.

But you can implement a more flexible update. This would require
on flash format changes, but this is doable. We have UBI version
field in 'struct ubi_ec_hdr', so you can increment it, and make
new UBI behave like the old one for v1 images and like the new
one for v2 images. But old UBI systems would be unable to attach
v2 images.

> This gives 2 related issues:
> 1) ubi_start_update must be called - which is normally called by 
> ioctl(fd, UBI_IOCVOLUP, &bytes). I could imagine that "ubi_start_update" 
> (upd.c) is called at the time the (static) volume is opened for writing. 
> (inside the "vol_cdev_open" in cdev.c)
> 2) the amount of bytes is not available/known on front. The amount of 
> bytes is store "vol->upd_bytes" which is used to limit and to know when 
> the amount of data to be written to an ubi volume has been reached. At 
> that time, the LEB is written and the update marker is removed.
> However why not write the final LEB and remove the update marker inside 
> "vol_cdev_release". As a "vol_cdev_release" is (and should) always 
> follow the last write.
> 
> If you think this would be a correct change to UBI and also viable (am I 
> overlooking something ?) I would be willing to make the changes and sent 
> them to you (for inspection).

Sure, but the amount of work/changes is larger than you described.
But you may do this. You should be just very careful about
backward-compatibility. But this is doable. Just question of how badly
you need this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
