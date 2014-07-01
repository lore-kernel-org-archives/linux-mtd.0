Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1z2Y-0002h6-Gw
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:28:11 +0000
Message-ID: <1404224842.6841.104.camel@sauron.fi.intel.com>
Subject: Re: General question about mounting mtdblock device
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: "Riyaz R, Syed Ismail" <SyedIsmail.RiyazR@trane.com>
Date: Tue, 01 Jul 2014 17:27:22 +0300
In-Reply-To: <F7D25D0F1F13E04EA375953DC5214A6002DA4B47@DM1PRD7301MB016.mgdir.irco.com>
References: <F7D25D0F1F13E04EA375953DC5214A6002DA4B47@DM1PRD7301MB016.mgdir.irco.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-06-23 at 14:57 +0000, Riyaz R, Syed Ismail wrote:
> Is it safe to do a flash_eraseall and nandwrite a jffs2 image on a mtdblock that is not unmounted cleanly, then mount to a new mount point.
> i.e,
> 1)mount -t jffs2 /dev/mtdblock2 /mnt/1/
> 2)flash_eraseall -j /dev/mtd2
> 3)nandwrite -p /dev/mtdblock2 jffs2_image
> 4)mount -t jffs2 /dev/mtdblock2 /mnt/1/

Changing the contents of the flash while it is mounted is not safe and
will to I/O errors.

> The mount point is different.

The difference is at the VFS level, JFFS2 will basically "see" one flash
device mounted.

>  This is just a workaround to account for *if* umount doesn't work.
> 
> Will the 2nd mount result in nand corruption, since both are accessing
> same nand space. Specifically, will reboot in such a scenario cause
> problems, since both will try to sync and unmounts at the time.

You can create as many mount points as you want, VFS will take care of
that.

But when the media is mounted, you should not change it directly.

-- 
Best Regards,
Artem Bityutskiy
