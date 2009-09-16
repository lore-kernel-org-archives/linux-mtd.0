Received: from smtpin1.mailsecure.in ([121.241.224.1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnucP-0003yu-PG
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 13:32:27 +0000
Message-ID: <4AB0E954.9090708@tataelxsi.co.in>
Date: Wed, 16 Sep 2009 19:04:12 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Unable to get MTD info
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

I am trying to use fw_printenv and fw_setenv . These commands will help=20
me to set an uboot environment variable.

I have compiled the code and fw_printenv executable is formed.

On Executing it i got an error


Cannot get MTD information : Inappropriate ioctl for device


what might be the issue? Have any one used this?

The contents of config file are shown below...

# MTD device name   Device offset   Env. size   Flash sector size =20
 /dev/mtd0                        0x0000      0x1000      0x10000

Any idea?


Thanks
Rahanesh
