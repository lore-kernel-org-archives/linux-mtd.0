Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Em8dc-0000no-24
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2005 06:48:10 -0500
Date: Tue, 13 Dec 2005 13:47:52 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
Message-ID: <20051213114752.GA9165@angel.research.nokia.com>
References: <439C33D2.506@yandex.ru>
	<1134367675.3152.9.camel@localhost.localdomain>
	<439D5159.4030704@yandex.ru>
	<1134455209.7346.12.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1134455209.7346.12.camel@localhost.localdomain>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, "zhao,
	forrest" <forrest.zhao@intel.com>
Subject: Re: EBH question 1
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zhao

I tried CVS head (Dec 12).  I used 2.6.14.3 on x86 and Nandsim.  2.6.14
requires removal of the second NULL argument (parent) to class_device_create() 
call to make it work.

I erased the partition with flash_eraseall (I tried both -j and without).
I mounted the partition, copied big file (libc) onto it, unmounted, and then
mounted again.

All messaged are directed to console, When I mount the file system
again, I get:

  # mount -t jffs2 /dev/mtdblock0 /mnt
  ...
  Dec 13 12:53:15 slayer kernel: Node at 0x00001e30 with length 0x000008e0 would run over the end of the erase block 
  Dec 13 12:53:15 slayer kernel: Perhaps the file system was created with the wrong erase size? Reject to mount.
  Dec 13 12:53:15 slayer kernel: [JFFS2 DBG] (3602) jffs2_do_mount_fs: build_fs failed
  mount: /dev/mtdblock0: can't read superblock

I can reproduce the same problem on an Arm based test board with 
2.6.15-rc4 with Nandsim and Onenandsim. On 2.6.15 class_device_create()
call works out of the box and no editing is needed.

Jarkko Lavinn
