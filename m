Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA6AY-0000VH-7f
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2015 01:18:47 +0000
Received: by mail-pf0-x22b.google.com with SMTP id v86so56982881pfa.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 17:18:25 -0800 (PST)
Date: Fri, 18 Dec 2015 17:18:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Matt Kline <matthew.kline@flukenetworks.com>
Cc: linux-mtd@lists.infradead.org, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] Update UBIFS mounting instructions
Message-ID: <20151219011822.GZ10460@google.com>
References: <1427921758-10295-1-git-send-email-matthew.kline@flukenetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427921758-10295-1-git-send-email-matthew.kline@flukenetworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Garbage collecting old patches...

On Wed, Apr 01, 2015 at 01:55:58PM -0700, Matt Kline wrote:
> I recently spent several days attempting to mount a UBIFS image.
> Efforts were hampered by seemingly outdated documentation,
> the fact that much of the documentation was for UBI images,
> not UBIFS ones, and the fact that the image was for NOR memory and
> all documentation I found only referenced nandsim.
> 
> After some very kind help on IRC and from Artem Bityutskiy on the
> mailing list, I was able to figure things out. I think it is only
> fair that I contribute back and bring the web site up to date so
> others don't face the same stumbling blocks.
> 
> This patch includes the following changes:
> 
> - Acknowledge that udev _does_ now create a block device
>   automatically for MTD.
> 
> - Provide instructions for mounting standalone UBIFS images as well
>   as UBI images.
> 
> - Mention mtdram and its usefulness in mounting UBIFS images made
>   for NOR memory.
> 
> Signed-off-by: Matt Kline <matthew.kline@flukenetworks.com>

This looks pretty good to me (as in, it's a net positive). I know
Dongsheng Yang (and Richard?) has been working on some kind of user
space unpacker tools, so this might be out of date "soon". But when
isn't documentation out of date? :)

Anyway, pushed to mtd-www.git. Improvements are welcome from anyone
doing updates to this though!

Thanks,
Brian

> ---
>  faq/ubifs.xml | 81 +++++++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 54 insertions(+), 27 deletions(-)
> 
> diff --git a/faq/ubifs.xml b/faq/ubifs.xml
> index 8b61fc7..2b724f3 100644
> --- a/faq/ubifs.xml
> +++ b/faq/ubifs.xml
> @@ -894,10 +894,9 @@ embedded systems.</p>
>  modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa \
>                   third_id_byte=0x00 fourth_id_byte=0x15
>  
> -# MTD is not LDM-enabled and udev does not create device
> -# MTD device nodes automatically, so create /dev/mtd0
> -# (we assume that you do not have other MTD devices)
> -mknod /dev/mtd0 c 90 0
> +# udev should create MTD device nodes automatically.
> +# If it does not, we can create /dev/mtd0 manually with
> +# mknod /dev/mtd0 c 90 0
>  
>  # Load UBI module and attach mtd0
>  modprobe ubi mtd=0
> @@ -917,44 +916,65 @@ mount -t ubifs /dev/ubi0_0 /mnt/ubifs
>  <h2><a name="L_ubifs_extract">How do I extract files from an UBI/UBIFS image?</a></h2>
>  
>  <p>Unfortunately, at the moment there are no user-space tools which can
> -unwrap UBI and UBIFS images. UBIFS cannot be loop-back mounted as well,
> +unwrap UBI and UBIFS images. UBIFS cannot be loop-back mounted either,
>  because it does not work with block devices.</p>
>  
> -<p>However, there is a hacky way to unwrap UBI/UBIFS images. But you have
> -to make sure you have UBIFS support in your host machine. UBIFS is a relatively
> -new file system and is not supported by all Linux distributions. But at least
> -Fedora 11 does include it.</p>
> +<p>However, kernel modules exist that allow you to create a virtual MTD
> +onto which UBIFS can be mounted. You have two options:
> +<ol>
> +	<li><code>nandsim</code>, which can simulate various NAND devices.
> +	You can find an incomplete list of those devices
> +	<a href="../nand-data/nanddata.html">here</a>.
> +	To emulate a given device, pass its ID bytes via the module parameters
> +	<code>first_id_byte</code>, <code>second_id_byte</code>,
> +	<code>third_id_byte</code>, and <code>fourth_id_byte</code>.</li>
> +
> +	<li><code>mtdram</code>, which simulates a generic MTD.
> +	Use the module parameter <code>total_size</code> to specify the device size
> +	in KiB and <code>erase_size</code> to specify the erase block size in KiB.
> +	This module is useful for mounting UBIFS images made for NOR memory,
> +	which usually have a minimum I/O unit of 1 byte, as opposed to NAND
> +	devices which have a minimum unit of at least 512 bytes.
> +	See more information <a href="../doc/ubi.html#L_min_io_unit">here</a>.
> +	</li>
> +</ol>
> +These modules should be provided on most distributions released in the past
> +few years.</p>
>  
> -<p>Let's consider a simple example. Suppose you have an <code>ubi.img</code>
> -file. This is an UBI image, which contains a single UBI volume, which in turn
> -contains UBIFS file-system. In other words, this is an image which was
> -created using the <code>mkfs.ubifs</code> and <code>ubinize</code> tools,
> -just like it is described in <a href="ubifs.html#L_mkfubifs">this</a>
> -section (the image is created for a 256MiB NAND flash with 2KiB NAND page
> -size and which supports sub-pages). Here is what you can do:</p>
> +<p>Consider a simple example. Suppose you have some <code>ubifs.img</code>
> +file which contains a single UBIFS filesystem.
> +In other words, this is an image which was created using <code>mkfs.ubifs</code>,
> +as described in <a href="ubifs.html#L_mkfubifs">this</a> section. To mount it:</p>
>  
>  <pre>
> -# Create an 256MiB emulated NAND flash with 2KiB NAND page size
> -# (you should see the new MTD device in /proc/mtd)
> +# Create a virtual MTD by bringing up one of the kernel modules mentioned above.
>  modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa \
>                   third_id_byte=0x00 fourth_id_byte=0x15
>  
> -# MTD is not LDM-enabled and udev does not create device
> -# MTD device nodes automatically, so create /dev/mtd0
> -# (we assume that you do not have other MTD devices)
> -mknod /dev/mtd0 c 90 0
> +# udev should create MTD device nodes automatically.
> +# If it does not, we can create /dev/mtd0 manually with
> +# mknod /dev/mtd0 c 90 0
>  
> -# Copy the contents of your image to the emulated MTD device
> -dd if=ubi.img of=/dev/mtd0 bs=2048
> +# Format the device. IOSIZE should be the minimum I/O unit size passed
> +# via -s to mkfs.ubifs when the image was created.
> +ubiformat /dev/mtd0 -s $IOSIZE
>  
>  # Load UBI module and attach mtd0
>  modprobe ubi mtd=0
>  
> -# Mount UBIFS
> -mount -t ubifs /dev/ubi0_0 /mnt/ubifs
> +# Create a volume.
> +# -N names the volume and -s sets its size, in bytes, kilobytes (KiB),
> +# or megabytes (MiB). Make sure it is at least as large as the image.
> +ubimkvol /dev/ubi0 -N "My UBIFS volume name" -s $VOLSIZE
> +
> +# Apply our image to that volume
> +ubiupdatevol /dev/ubi0_0 ubifs.img
> +
> +# Mount it to any desired mount point
> +mount /dev/ubi0_0 /mnt/ubifs
>  </pre>
>  
> -<p>Now you have the file-system in <code>/mnt/ubifs</code>. Use
> +<p>Now you have the filesystem in <code>/mnt/ubifs</code>. Use
>  the following to get rid of it:</p>
>  
>  <pre>
> @@ -962,6 +982,13 @@ umount /mnt/ubifs
>  rmmod ubifs ubi nandsim
>  </pre>
>  
> +If you have an entire UBI image made with <code>ubinize</code>,
> +the process is simpler.
> +Write the image to the MTD via <code>ubiformat -f ubi.img</code>
> +(assuming that is the name of your image file).
> +You should be able to skip the instructions above after
> +<code>modprobe ubi mtd=0</code>, since
> +the UBI image should take care of the volume(s) itself.
>  
>  
>  <h2><a name="L_smaller_jrn">I need more space - should I make UBIFS journal smaller?</a></h2>
> -- 
> 2.3.4
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
