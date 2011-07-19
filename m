Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjBnM-00033A-QP
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 15:01:15 +0000
Received: by iyn15 with SMTP id 15so4686991iyn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2011 08:01:10 -0700 (PDT)
Subject: Re: Regression in handling of unsafe UBI shutdown
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Mack <zonque@gmail.com>
Date: Tue, 19 Jul 2011 18:02:27 +0300
In-Reply-To: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
References: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311087753.20738.101.camel@sauron>
Mime-Version: 1.0
Cc: Sven Neumann <s.neumann@raumfeld.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-07-19 at 15:57 +0200, Daniel Mack wrote:
> Hey,
> 
> we're facing a new behaviour with 3.0-rc7 kernels wrt UBI file systems
> that are not properly unmounted on shut down. The newest kernel we're
> using in production is 2.6.36.4, and this version doesn't show the
> effect.
> 
> When our devices boot up, the bootloader (U-Boot) initializes its UBI
> code, reads in the uImage from the root partition and executes it.
> This worked very well in thousands of installations previously (with
> kernels up to version 2.6.36.4), and generally, it still does work
> well with the latest cutting edge when the kernel is shut down
> properly and unmounts the UBI partitions safely. However, if the power
> is removed out of a sudden from a running system, U-Boot now doesn't
> like the FS anymore upon the next boot:
> 
> 
> Creating 1 MTD partitions on "nand0":
> 0x00120000-0x08000000 : "mtd=3"
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: attached mtd1 to ubi0
> UBI: MTD device name:            "mtd=3"
> UBI: MTD device size:            126 MiB
> UBI: number of good PEBs:        1014
> UBI: number of bad PEBs:         1
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     2
> UBI: available PEBs:             8
> UBI: total number of reserved PEBs: 1006
> UBI: number of PEBs reserved for bad PEB handling: 10
> UBI: max/mean erase counter: 4/3
> UBIFS: recovery needed
> Error reading superblock on volume 'ubi:RootFS'!
> UBIFS not mounted, use ubifs mount to mount volume first!
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!
> 
> 
> Hence my question is: were there any radical changes in the UBI/UBIFS
> code on the kernel side that make older code not like the new content
> anymore?

Not sure if there were radical changes, but please, enable UBIFS
debugging and provide UBIFS messages. Here are some hints:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy
