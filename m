Received: from fed1rmmtao06.cox.net ([68.230.241.33])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cy0Zz-00022r-42
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2005 23:32:56 -0500
Received: from laptop ([70.179.62.151]) by fed1rmmtao06.cox.net
	(InterMail vM.6.01.04.00 201-2131-117-20041022) with ESMTP
	id <20050207043249.EQAI5874.fed1rmmtao06.cox.net@laptop>
	for <linux-mtd@lists.infradead.org>; Sun, 6 Feb 2005 23:32:49 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Rick Adams <rgadams@cox.net>
To: linux-mtd@lists.infradead.org
Date: Sun, 6 Feb 2005 20:32:05 -0800
References: <E1CwefL-0002c2-JD@canuck.infradead.org>
In-Reply-To: <E1CwefL-0002c2-JD@canuck.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200502062032.05112.rgadams@cox.net>
Subject: Re: ST flashes 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 February 2005 02:56 am, linux-mtd-request@lists.infradead.=
org=20
wrote:

>Im using 2.4.19-rmk7-pxa1 ... i know its really old and all=20
>that ... but i have no options right now...
>but anyway..
<Here's my problem.
>I have two pxa 255 boards , one with ST flash and one with AMD.
>I configured them to use the lubbock flash driver , and made one=20
>partition for jffs2.

>But on the ST , the moment you power down the board ! , the next time ,=20
>it only mounts , but doesnt
>let me perform any fops. I keep getting I/O errors..for only write=20
>operations... read works , coz i could ls in the partition.
>It also doesnt let me format the partition.


Hi Ashwin

What's the part number of the Intel flash, is it a J or K version? The pa=
rt=20
number will look like 28FnnnJ3 where nnn is the size or 28FnnnKvv where n=
nn=20
is size an vv is voltage. These are the part numbers for the TSOP package=
,=20
for the BGA package the first part will be different but will have the J =
or K=20
designation. The J or K designation is the only thing that matters for th=
is=20
discussion the rest of the number isn't important. Intel is obsoleting th=
e J=20
part and replacing it with the K part. The version of the kernel and the=20
Lubbock board were built with J parts (before the K was around). The K is=
=20
"almost" identical to the J. One important difference is the the K part h=
as=20
all it's sectors locked at power up and the J has all it's sectors unlock=
ed.=20
If you have a driver written for the J and a board with a K part then thi=
s=20
could lead to the exact problem you talked about.

If this is your situation there are two possible fixes. One is to get a d=
river=20
that understands how to talk to a K, or modify the boot or initialization=
=20
code to unlock all the sector of the K at power up, and then it will func=
tion=20
exactly like a J. The other main feature the K has is the ability to burs=
t=20
read. This will improve some flash operations if the processor supports D=
MA=20
from flash and you modify the boot or initialization code to enable this=20
mode. I know the ARM9 core supports it, I don't know offhand if the xScal=
e=20
does. Anyhow the point is that the J driver lack of burst mode support on=
ly=20
has a performance implication and no functional one. The easiest thing is=
 to=20
just unlock all flash sectors of the K at power up and use the J driver.

If this isn't your situation (you don't have K parts) then never mind.
--=20
Rick Adams
rick@theptrgroup.com
