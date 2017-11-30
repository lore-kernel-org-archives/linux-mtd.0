Received: from smtp4.nedap.com ([213.160.213.85])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKQfU-0008N5-Af
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 15:22:31 +0000
To: linux-mtd@lists.infradead.org
From: Jaap de Jong <jaap.dejong@nedap.com>
Subject: Mounting issue with old rootfs and new kernel
Message-ID: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
Date: Thu, 30 Nov 2017 16:22:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'm hoping for some pointers.

I have this a created with openembedded classic.

It works just fine when running with an old kernel (2.6.35)

Now with the same rootfs and a newer kernel (4.9.28) it damages the old 
rootfs in such a way that it becomes unusable.

This is the error it shows:

                         [    1.523437] ubi0 error: 
ubi_read_volume_table: the layout volume was not found
                         [    1.531250] ubi0 error: ubi_attach_mtd_dev: 
failed to attach mtd3, error -22
                         [    1.539062] UBI error: cannot attach mtd3
                         [    1.546875] Kernel panic - not syncing: VFS: 
Unable to mount root fs on unknown-block(0,0)
                         [    1.546875] Rebooting in 1 seconds..RomBOOT

As far as I can see the kernel configuration seems to be ok.

Any ideas?

Thanks!

Jaap
