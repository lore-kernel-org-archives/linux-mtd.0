Received: from smtpin2.mailsecure.in ([121.241.224.3])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeRuU-0007rQ-Cq
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 11:03:58 +0000
Message-ID: <4A8E7F6B.1090803@tataelxsi.co.in>
Date: Fri, 21 Aug 2009 16:35:15 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Writing mtdblock
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

Now from Linux i need to flash a new jffs image to mtdblock2 itself.=20
Is it possible?  How can we do this?


=20
Please help me on this. I am very new to Linux


Thanks
Rahanesh
