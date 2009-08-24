Received: from smtpin1.mailsecure.in ([121.241.224.1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfYyH-0003e7-BA
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 12:48:29 +0000
Message-ID: <4A928C83.2090904@tataelxsi.co.in>
Date: Mon, 24 Aug 2009 18:20:11 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Mounting Flash Partition
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

I have created a new partition in flash by editing the following=20
structure. I have added the 3 item(CONFIG ). field.

static struct mtd_partition partition_info[]=3D{
    {
        .name =3D "Bootloader",
        .size =3D 0x40000,
        .offset =3D 0
    },
      {
        .name =3D "JFFS",
        .size =3D 0x730000,
          .offset =3D 0x40000
    },
{
      .*name =3D "CONFIG",
        .size =3D 0x50000,
       .offset =3D 0x770000*
}

}


I wanted to get the 3rd partition mounted as config directory in the=20
ramdisk. How can i mount this? What is the Linux command for mounting a=20
partition in flash.?


Expecting help on this!!!!!

Thanks
Rahanesh
