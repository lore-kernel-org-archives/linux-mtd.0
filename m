Received: from vw-hfger.navico.com ([81.89.228.210])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SM6Oj-00065H-Uc
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 23:40:55 +0000
Message-ID: <B36E81988B048A4FA3600EDE585F756BD123D1@EXCH02-AKLNZ.MARINE.NET.INT>
Date: Sun, 22 Apr 2012 23:40:41 +0000
From: Tom Isaacson <Tom.Isaacson@navico.com>
Subject: RE: Exposing NAND chip information
To: Artem Bityutskiy <dedekind1@gmail.com>,  Florian Fainelli
 <ffainelli@freebox.fr>
References: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>,
 <1335105890.28267.27.camel@brekeke>
In-Reply-To: <1335105890.28267.27.camel@brekeke>
Content-Language: en-NZ
MIME-Version: 1.0
Content-Type: text/plain;charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If you have a need to have them in mtd_info - probably you can add=0A> =
those. Just add/document a way to detect that the chip does not have=0A> =
this data. E.g., all zeroes or -1. I mean, NORs might not have the IDs.=0A=
I think zeroes would make more sense.=0A=0A>> Also, when I add the files =
to the /sys tree is there any naming=0A>> convention I should follow? I w=
as going to copy the way the eMMC=0A>> device does it:=0A>>   manfid - Ma=
nufacturer ID=0A>>   devid - Chip ID=0A>>   manf_name - Manufacturer name=
=0A>>   dev_name - Chip name=0A=0A>Should we put all ID's to the same fil=
e instead? Or at lease=0A>manfid/manf_name and devid/dev_name pairs to wa=
ste less RAM because each=0A>sysfs file cunsumes several KiBs of RAM AFAI=
R (struct inode alone is=0A>several KiB). Also if you add sysfs files - d=
o not forget to document=0A>them id Documentation/ABI and CC Greg KH.=0A=0A=
The documentation for sysfs (http://lxr.linux.no/linux+v3.3.2/Documentati=
on/filesystems/sysfs.txt) says:=0A"Attributes should be ASCII text files,=
 preferably with only one value per file. It is noted that it may not be =
efficient to contain only one value per file, so it is socially acceptabl=
e to express an array of values of the same type."=0ASo if we want to com=
bine we should do it the first way - both IDs in one file, both strings i=
n another:=0A  id - Manufacturer and Chip ID (tab separated)=0A  name - M=
anufacturer and Chip name (tab separated)=0A=0ATom=0A
