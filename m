Received: from qw-out-1920.google.com ([74.125.92.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGLPY-0002be-LX
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 23:48:41 +0000
Received: by qw-out-1920.google.com with SMTP id 5so143357qwc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Dec 2009 15:48:35 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 3 Dec 2009 18:48:35 -0500
Message-ID: <dbdb2ea60912031548u32f1700fp8fd105ea8e0ff937@mail.gmail.com>
Subject: ubifs attach error
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm getting the following error running ubifs on an ARM system running
linux-2.6.28:

[    6.658441] UBI: attaching mtd6 to ubi3
[    6.662463] UBI: physical eraseblock size:   524288 bytes (512 KiB)
[    6.668733] UBI: logical eraseblock size:    516096 bytes
[    6.674166] UBI: smallest flash I/O unit:    4096
[    6.678872] UBI: VID header offset:          4096 (aligned 4096)
[    6.684912] UBI: data offset:                8192
[   11.091011] UBI error: vtbl_check: too large reserved_pebs 3121,
good PEBs 3072
[   11.098331] UBI error: vtbl_check: volume table check failed:
record 0, error 9
[   11.106979] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22
[   11.115048] UBI error: ubi_init: cannot attach mtd6
[   11.121599] UBI: mtd3 is detached from ubi0
[   11.127121] UBI: mtd4 is detached from ubi1
[   11.132691] UBI: mtd5 is detached from ubi2
[   11.137316] UBI error: ubi_init: UBI error: cannot initialize UBI, error -22

Could anyone offer any input on this error?

Thanks,
twebb
