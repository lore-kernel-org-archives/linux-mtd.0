Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R96ai-0002kF-0x
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2011 02:43:17 +0000
Received: by wyi11 with SMTP id 11so882940wyi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Sep 2011 19:43:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <891190.21758.qm@web30201.mail.mud.yahoo.com>
References: <891190.21758.qm@web30201.mail.mud.yahoo.com>
Date: Wed, 28 Sep 2011 22:43:11 -0400
Message-ID: <CAPBSBxrMsY6wH=LCzHaDie-MJQ1Bnqxj+fipH5OUSXKaXKW7Og@mail.gmail.com>
Subject: Re: U-Boot: using nand write to flash an ubi image, ubi part fails
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Lars Michael <lh_post@yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 1, 2011 at 3:57 AM, Lars Michael <lh_post@yahoo.com> wrote:
> Hello,
>
> Using mkfs.ubifs and ubinize I have created an image with 5 volumes. In L=
inux I could flash it using "ubiformat /dev/mtd1 -f /root/ubi.img" and atta=
ch it using "ubiattach /dev/ubi_ctrl -m 1". It worked.
>
> In production I would prefer to write the image from U-Boot. So in U-Boot=
 I used "nand erase" then "nand write" to flash the image. Then I want to a=
ttach by "ubi part" command - but this fails: "UBI error: ubi_init: UBI err=
or: cannot initialize UBI, error -17"
>

Basically, this isn't a valid combination: "nand write" doesn't know
anything about UBI, and a UBIFS image isn't suitable for flashing
directly to NAND - it expects to sit on top of UBI.

There are 2 ways to get it working:

1. Don't use "nand write".  If U-Boot is built with UBI support, you
can use "ubi write" to write a UBI image to flash.  I _think_ you can
use this to overwrite an existing volume with a new image, preserving
ECs (haven't tried it myself).  It certainly works fine to write a new
image to blank flash.

2. Use the "ubinize" tool to create an image suitable for writing
directly to NAND.  This takes a UBIFS image and "wraps" it to turn it
into a UBI image, which you can then use with "nand write".

I've used both these methods to write UBIFS images to flash within
U-Boot, and the 2nd method also works with industrial NAND
programmers.

Hope this helps

--=20
Matthew L. Creech
