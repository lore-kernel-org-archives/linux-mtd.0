Received: from smtpin1.mailsecure.in ([121.241.224.1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqlJM-0006SO-6h
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 10:12:32 +0000
Message-ID: <4ABB468D.9050009@tataelxsi.co.in>
Date: Thu, 24 Sep 2009 15:44:37 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Mounting Entire Flash
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

Hi All,

Currently I have 4 mtd partitions in Flash. They are all seen under /dev=20
directory as mtd0 mtd1 mtd2 and mtd3.

mtd0-> Uboot + Itz Environment
mtd1-> JFFS
mtd2-> Config files
mtd3-> Not used

I am currently trying to implement Image upgradation.

I will need to update JFFS, uboot and Config files from Linux.

I am currently achieving this through  flash_eraseall and dd  command .

To Update U-boot First i will do a

flash_eraseall /dev/mtd0 and then
dd if=3Duboot.bin of=3D/dev/mtd0 count=3Dsize;

and similarly for all individual partitions.

But If i have a combined image as combined.bin  how do i update the=20
entire flash .

Is it possible to see entire flash as /dev/mtd  . i can very well=20
extract individual images from combined image and reflash to respective=20
partitions.

But it would be generic if  we are able write to entire flash not to=20
individual partitions.

Is it possible to Write to entire flash as such.

Thanks
Rahanesh
=20
