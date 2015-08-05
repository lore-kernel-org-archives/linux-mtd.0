Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN699-0004J1-Jj
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 21:22:48 +0000
Message-ID: <1438809724.6328.18.camel@embedded.rocks>
Subject: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Date: Wed, 05 Aug 2015 23:22:04 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

after updating a custom build Linux Kernel from 4.0.8 to 4.1.4 my
system fails to attach an MTD partition. Note, that everything worked
fine with Linux Kernels before 4.1.

The error message is:
	ubi_wl_get_peb: Unable to get a free PEB from user WL pool
	autoresize: cannot auto-resize volume 0

The MTD partition has a size of 36 MB. The UBIFS image is created with:
	mkfs.ubifs -v -F -m 2048 -e 124KiB -c 264 -d user -o user.ubifs

The UBI image is created with:
	ubinize -v -o data.ubi -m 2048 -p 128KiB ubinize.ini

ubinize.ini:
    [user]
    mode=ubi
    image=user.ubifs
    vol_id=0
    vol_type=dynamic
    vol_name=user
    vol_flags=autoresize


It works, if I replace the vol_flags with vol_size=32480KiB. But that's
not a final solution for me.

Any idea what is wrong here?

Best regards
Jörg Krause
