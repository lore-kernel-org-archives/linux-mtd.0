Received: from xproxy.gmail.com ([66.249.82.196])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFSTV-00014M-FX
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 04:18:54 -0400
Received: by xproxy.gmail.com with SMTP id i30so202601wxd
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Sep 2005 01:18:35 -0700 (PDT)
Message-ID: <123a7499050914011265e32d56@mail.gmail.com>
Date: Wed, 14 Sep 2005 13:42:23 +0530
From: Nitin Kalra <nitinkalra12@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: jffs2 as a filesystem on Compact Flash-help!!
Reply-To: nitinkalra12@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all...
im new to jffs2 and need some help. im trying to put a jffs2 image on
a compact flash and then mount the CF (sdb2) and do basic op. like
read,write,modify on the mounted image.
i have done the following steps..
*     ./mkfs.jffs2 -d <path> -o <image-name>  (default erase size is 64 KiB=
)
*      insmod /lib/modules/2.6.12/kernel/drivers/mtd/devices/blkmtd.ko
device=3D/dev/sdb2  erasesz=3D64
*    ./flash_erase /dev/mtd0
*     dd if=3D<image-name> of=3D/dev/mtd0
*     mount -t jffs2 /dev/mtd0 /mnt/cf

at this last step when i chk the dmesg  it halts showing the message
"cleanmarker node found at 0x004c8c00  not first node in block (0x004c0000)=
"
"perhaps the file system was created with wrong erase size"
and some header file related messages...

well when i did the same steps by taking an additional hard-drive  it
worked fine but taking CF it is not doing fine.....

can any one suggest some method or where im wrong or with what
erasesize i should try making image or anything else....
thanks in advance.
nitin.
