Received: from vw-hfger.navico.com ([81.89.228.210])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SJYu4-0000Bs-N9
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2012 23:30:45 +0000
From: Tom Isaacson <Tom.Isaacson@navico.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Exposing NAND chip information
Date: Sun, 15 Apr 2012 23:20:25 +0000
Message-ID: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>
Content-Language: en-NZ
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=
=0A=
Our production software needs to record the NAND chip type used in producti=
on so we have a record in case we get problems later. The information we ne=
ed is printed out by nand_get_flash_type(), e.g.:=0A=
  NAND device: Manufacturer ID: 0x98, Chip ID: 0xd1 (Toshiba NAND 128MiB 3,=
3V 8-bit)=0A=
My plan is to add some files to the /sys tree to expose this information. B=
ut the only part of that information stored is the device name, in mtd_info=
.name. Is there any reason why I shouldn't add the manufacturer name and ID=
 and the chip ID to mtd_info so they can be accessed later on? Or should I =
add them to mxd_mtd_s (in nand_base.c) and keep it local?=0A=
=0A=
Also, when I add the files to the /sys tree is there any naming convention =
I should follow? I was going to copy the way the eMMC device does it:=0A=
  manfid - Manufacturer ID=0A=
  devid - Chip ID=0A=
  manf_name - Manufacturer name=0A=
  dev_name - Chip name=0A=
=0A=
Thanks for any help.=0A=
=0A=
Tom Isaacson=0A=
Senior Software Developer=0A=
Navico=0A=
