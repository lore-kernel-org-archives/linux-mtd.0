Received: from smtpin1.mailsecure.in ([121.241.224.1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfRzh-0002it-J4
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 05:21:30 +0000
Message-ID: <4A9223BA.4020201@tataelxsi.co.in>
Date: Mon, 24 Aug 2009 10:53:06 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Unale to  get MTD device info
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have four mtdblocks in my flash .
mtdblock0 -> Primary bootloader
mtdblock1 -> uboot
mtdblock2 -> JFFS
mtdbloack3-> config

During Linux booting , it mounts mtdblock2 to a temp folder which can be=20
seen as a part of ramdisk(root file system of linux)

Now from Linux i need to flash a new jffs image to mtdblock2 itself.

With the support from this mailing list i have copied mtd-utilities=20
package into Linux. Now i have flash_eraseall and flash_cp commands.

But when i run flash_eraseall  i gett the following error


flash_eraseall: /dev/mtdblock1: *unable to get MTD device info

*Please help on this!!!!!!!

Thanks
Rahanesh
