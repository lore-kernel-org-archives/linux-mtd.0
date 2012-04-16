Received: from vw-hfger.navico.com ([81.89.228.210])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SJvhe-0005LQ-TZ
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 23:51:27 +0000
From: Tom Isaacson <Tom.Isaacson@navico.com>
To: Florian Fainelli <ffainelli@freebox.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: Exposing NAND chip information
Date: Mon, 16 Apr 2012 23:51:20 +0000
Message-ID: <B36E81988B048A4FA3600EDE585F756BD0F7AC@EXCH02-AKLNZ.MARINE.NET.INT>
References: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>,
 <8396132.PHseJUhzUe@bender>
In-Reply-To: <8396132.PHseJUhzUe@bender>
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

> I have the exact same requirement and cooked up a patch to do this for NA=
ND:=0A=
> http://patchwork.ozlabs.org/patch/94407/=0A=
=0A=
Ah, your patch shows you've added the sysfs files in mtdcore.c, which means=
 they'll show up in:=0A=
/sys/class/mtd/..=0A=
The code I've done adds them in mxc_nd2.c (the device I have) so they appea=
r in:=0A=
/sys/devices/platform/mxc_nandv2_flash.0/..=0A=
Obviously this only works for one type of flash right now, but I was thinki=
ng of extending all the separate uses of DEVICE_ATTR and manage_sysfs_files=
() to call back to a generic sysfs function in nand_base.c so these new par=
ameters appear for all NAND devices.=0A=
I can't find anything online that gives a guide to where files should be ad=
ded to sysfs - is there such a thing, or do people just make it up as they =
go along?=0A=
=0A=
> however, to be complete it would also need to expose such informations fo=
r SPI=0A=
> and NOR flashes, which I have not done yet.=0A=
=0A=
I don't have access to those devices so I can't test any code I might attem=
pt.=0A=
=0A=
Tom=0A=
