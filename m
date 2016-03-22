Received: from dub004-omc3s23.hotmail.com ([157.55.2.32])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiNcf-0005bo-P2
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2016 14:49:36 +0000
Message-ID: <DUB128-W1B9618CEFDEE4D2DDF6C89C800@phx.gbl>
From: David Binderman <dcb314@hotmail.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: linux-next/include/linux/mtd/pfow.h: possible poor sequence of
 conditionals ?
Date: Tue, 22 Mar 2016 14:49:06 +0000
Content-Type: text/plain; charset="iso-8859-1"
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

Hello there=2C=0A=
=0A=
> [linux-next/include/linux/mtd/pfow.h:133]: (style) Expression is always f=
alse because 'else if' condition matches previous condition at line 130.=0A=
> [linux-next/include/linux/mtd/pfow.h:136]: (style) Expression is always f=
alse because 'else if' condition matches previous condition at line 130.=0A=
=0A=
Source code is=0A=
=0A=
=A0=A0=A0 if (prog_status & 0x03)=0A=
=A0=A0=A0=A0=A0=A0=A0 printk(KERN_NOTICE"DSR.9=2C8: (11) Attempt to program=
 invalid "=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "half=
 with 41h command\n")=3B=0A=
=A0=A0=A0 else if (prog_status & 0x02)=0A=
=A0=A0=A0=A0=A0=A0=A0 printk(KERN_NOTICE"DSR.9=2C8: (10) Object Mode Progra=
m attempt "=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "in region with C=
ontrol Mode data\n")=3B=0A=
=A0=A0=A0 else if (prog_status &=A0 0x01)=0A=
=A0=A0=A0=A0=A0=A0=A0 printk(KERN_NOTICE"DSR.9=2C8: (01) Program attempt in=
 region "=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "with=
 Object Mode data\n")=3B=0A=
=0A=
Maybe something like=0A=
=0A=
=A0=A0=A0 switch (prog_status & 0x03)=0A=
=A0=A0=A0 {=0A=
=A0=A0=A0=A0=A0=A0=A0 case 0x03:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 printk()=3B break=3B=0A=
=A0=A0=A0=A0=A0=A0=A0 case 0x02:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 printk()=3B break=3B=0A=
=A0=A0=A0=A0=A0=A0=A0 case 0x01:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 printk()=3B break=3B=0A=
=A0=A0=A0 }=0A=
=0A=
might be better code.=0A=
=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
 		 	   		  =
