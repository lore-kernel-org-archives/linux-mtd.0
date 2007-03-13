Received: from wr-out-0506.google.com ([64.233.184.226])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HRFDT-0007fH-P8
	for linux-mtd@lists.infradead.org; Tue, 13 Mar 2007 22:11:38 +0000
Received: by wr-out-0506.google.com with SMTP id i11so2654501wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Mar 2007 15:01:30 -0700 (PDT)
Message-ID: <79ac09b60703131451t2cfff54ckb3663057e282fe5f@mail.gmail.com>
Date: Tue, 13 Mar 2007 16:51:26 -0500
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: mounting jffs2 on NOR flash
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

The easiest way I found to create a jffs2 on my NOR flash is to first
mount my rootfs as NFS, then I created a jffs2 fs using

flash_eraseall /dev/mtd3
mkfs.jffs2 -e 256KiB -o /dev/mtd3

Then I added the line "/dev/mtdblock3 /var jffs2 rw 0 0" to my fstab
(NFS root) and reboot.
An ls after this shows that my /var shows the / fs. How is that possible?

This is my /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00040000 "boot"
mtd1: 00180000 00040000 "kernel"
mtd2: 00640000 00040000 "root"
mtd3: 00400000 00040000 "var"
mtd4: 00400000 00040000 "str"

Am I doing something incorretly?

I did the same thing but booting from mtd2 rootfs and the same thing,
everything in /var gone and /var is the same as /.

I need help.
Thanks.
