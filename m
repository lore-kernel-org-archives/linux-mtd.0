From: David Woodhouse <dwmw2@infradead.org>
To: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>
In-Reply-To: <B70A50D07063384EB9BCE3330D18414F024CCE28@nonameb.ptu.promise.com>
References: <B70A50D07063384EB9BCE3330D18414F024CCE28@nonameb.ptu.promise.com>
Content-Type: text/plain
Date: Tue, 16 May 2006 00:02:37 +0100
Message-Id: <1147734157.2571.20.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-15 at 10:14 -0700, Lakshmi N. Sundararajan wrote:
> Hello Team:
> I have an AMD 32MB/64Ksector block and a SPANSION 32MB/128Ksector block
> FLASH chips.
> 
> I create partitions on both of them, to align on the 128KB boundary.
> Now, can I create a jffs2 filesystem once, and make it run on both of
> them successfully? Is there any issues that makes the same image not 
> to run on both of them?
> 
> I also see an option eraseblock whose size is default to 64KB. I guess
> this needs to match the sector block size, but it can be made a multiple
> of 64KB also right (on the AMD Flash with 64KB sector size, can it also be
> chosen to be 128KB)?

The important rule is that data nodes must not cross from one eraseblock
to another. So you should tell mkfs.jffs2 that your erasesize is 64KiB,
and the resulting image will work on both devices. 

Make sure you omit 'cleanmarkers' from the image, because the device
with 128KiB erase blocks won't enjoy having a marker at the start _and_
in the middle of each block :)

> BTW, I also see BADMAGIC JFFS2 partition not recognized, expected magic
> 0x1984 got something else from jffs2_scan_eraseblock() on bootup
> sometimes.
> What does this really mean? And sometimes the boot is successfull.
> Sometimes the system hangs (Cannot mount root). Infact the root 
> filesystem is not even JFFS2 it is compressed ext2. But during 
> the initialization, other jffs2 partitions are mounted.

You mean that sometimes it complains about failing to mount JFFS2 even
when it's actually supposed to be mounting a compressed ext2? Or it
mounts the ext2 and then fails later when the boot scripts are supposed
to be mounting the JFFS2 file systems?

-- 
dwmw2
