Received: from nm24-vm0.bullet.mail.bf1.yahoo.com ([98.139.213.161])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R9U1B-0003DR-Qg
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2011 03:44:10 +0000
Message-ID: <1317354248.25348.YahooMailClassic@web160616.mail.bf1.yahoo.com>
Date: Thu, 29 Sep 2011 20:44:08 -0700 (PDT)
From: Lars Michael <lh_post@yahoo.com>
Subject: U-Boot: using nand write to flash an ubi image, ubi part fails
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <CAPBSBxrMsY6wH=LCzHaDie-MJQ1Bnqxj+fipH5OUSXKaXKW7Og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

--- On Thu, 29/9/11, Matthew L. Creech <mlcreech@gmail.com> wrote:=0A> On W=
ed, Jun 1, 2011 at 3:57 AM, Lars=0A> Michael <lh_post@yahoo.com> wrote:=0A>=
 > Using mkfs.ubifs and ubinize I have created an image=0A> with 5 volumes.=
 In Linux I could flash it using "ubiformat=0A> /dev/mtd1 -f /root/ubi.img"=
 and attach it using "ubiattach=0A> /dev/ubi_ctrl -m 1". It worked.=0A> >=
=0A> > In production I would prefer to write the image from=0A> U-Boot. So =
in U-Boot I used "nand erase" then "nand write"=0A> to flash the image. The=
n I want to attach by "ubi part"=0A> command - but this fails: "UBI error: =
ubi_init: UBI error:=0A> cannot initialize UBI, error -17"=0A> >=0A> =0A> B=
asically, this isn't a valid combination: "nand write"=0A> doesn't know=0A>=
 anything about UBI, and a UBIFS image isn't suitable for=0A> flashing=0A> =
directly to NAND - it expects to sit on top of UBI.=0A=0AHi Matthew,=0A=0AI=
 agree, which is why I used ubinize to create a UBI image (with 5 UBIFS ima=
ges) and then tried to write that image.=0A=0A> There are 2 ways to get it =
working:=0A> =0A> 1. Don't use "nand write".=A0 If U-Boot is built with=0A>=
 UBI support, you=0A> can use "ubi write" to write a UBI image to flash.=A0=
 I=0A> _think_ you can=0A> use this to overwrite an existing volume with a =
new image,=0A> preserving=0A> ECs (haven't tried it myself).=A0 It certainl=
y works=0A> fine to write a new=0A> image to blank flash.=0A>=0A> 2. Use th=
e "ubinize" tool to create an image suitable for=0A> writing=0A> directly t=
o NAND.=A0 This takes a UBIFS image and=0A> "wraps" it to turn it=0A> into =
a UBI image, which you can then use with "nand=0A> write".=0A=0AThis is wha=
t I am doing (or plan to do). But to get it to work, I need=0Athe space fix=
up feature for the nand write in U-Boot. I got that feature in Linux, so in=
 Linux it works. Unfortunately it is not easy to patch =0Athat one in my 20=
09.08 U-Boot.=0A=0AThanks for your comments.=0A=0ARegards=0ALars
