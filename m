Received: from [208.28.249.7] (helo=ktc_internet)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aPy8-0000XQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 23:34:45 +0000
Subject: Re: NAND flash and JFFS(2)
To: gleixner@autronix.de
Cc: David Woodhouse <dwmw2@infradead.org>,
	jffs-dev@axis.com,
	linux-mtd@lists.infradead.org
Message-ID: <OF2342AFB5.08DD24E0-ON88256B5D.0081B9A3@LocalDomain>
From: Steve_Chen@kingston.com
Date: Mon, 11 Feb 2002 15:42:25 -0800
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Thomas,
I have two questions regarding the layout scheme in oob.

1. What does "page data valid flag" mean ?  How do you use it ?
2. If jffs2 detects a bad block, does it set a flag in one of the bytes=
 in
oob ?  I suppose we don't want to use byte 05 (bad block status) which =
was
set by the chip manufacturer.

Thanks.

Regards,
Steve




Thomas Gleixner <gleixner@autronix.de>@axis.com on 02/11/2002 11:28:09 =
AM

Please respond to gleixner@autronix.de

Sent by:  owner-jffs-dev@axis.com


To:   David Woodhouse <dwmw2@infradead.org>
cc:   jffs-dev@axis.com, linux-mtd@lists.infradead.org

Subject:  Re: NAND flash and JFFS(2)

On Monday, 11. February 2002 16:48, Thomas Gleixner wrote:

> I reflected this question again and we should do this very careful be=
fore
> implemetation. If we choose the same layout, somebody would be able t=
o
> implement the SmartMedia DOS fs on top of SmartMedia and raw NAND fla=
sh.
> I personally have not interest in this fs, it's ok for MP3 players an=
d
> digicams but not for industrial use.

I had a look at the nand driver, where we have to do some changes anywa=
y to

support a different ECC address. To get the flexibility to use either a=

JFFS2
specific ECC scheme or a different scheme like the SmartMedia DOS-FAT i=

will
add a array to the nand structure, which holds the positions of the ECC=

bytes
inside the spare area and a flag, which can be used to support the virt=
ual
pagesize of 512 Byte for small NAND devices (if anybody is going to
implement
this).
The filesystem driver can set the ECC byte positions, so they match it'=
s
requirements. We could add config options to select a default ECC schem=
e,
so
we have access to the chip as char device too. I'm not sure if we need =
this

really.
So we have the flexibility to do what we want and we don't prevent anyb=
ody
from implementing a different system.

I will try it with the following scheme tonight:

SmartMedia and raw NAND 512 byte pagesize
Byte 0-3=A0=A0=A0=A0=A0=A0=A0=A0ECC part 1
Byte 4=A0=A0 =A0=A0=A0=A0=A0=A0=A0 page data valid flag
Byte 5=A0=A0 =A0=A0=A0=A0=A0=A0=A0 bad block status
Byte 6-7 =A0=A0=A0=A0=A0=A0=A0ECC part 2
Byte 8-15=A0=A0=A0=A0=A0=A0cleanmarker

SmartMedia and raw NAND 256 Byte pagesize
Byte 0-2=A0=A0=A0=A0=A0=A0=A0=A0ECC
Byte 3=A0=A0 =A0=A0=A0=A0=A0=A0=A0 spare
Byte 4=A0=A0 =A0=A0=A0=A0=A0=A0=A0 page data valid flag
Byte 5=A0=A0 =A0=A0=A0=A0=A0=A0=A0 bad block status
Byte 6-7=A0=A0=A0=A0=A0=A0=A0=A0cleanmarker

I have both card types so i can verify that it works.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de

To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
the body of a message to majordomo@axis.com


=
