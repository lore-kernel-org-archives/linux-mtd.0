Received: from [202.109.126.231] (helo=support-smartpc.com.cn)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DkqT-0002m4-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2001 11:13:10 +0000
Message-ID: <A56A8E5E02CBD511881800306E002CCA24B12B@mrspdc.mrs.com.cn>
From: =?utf-8?B?eGlhb2xpdS5tYW8g5q+b5puJ5p+z?= <xiaoliu.mao@mic.com.tw>
To: linux-mtd@lists.infradead.org
Subject: =?utf-8?B?562U5aSNOiBCb290aW5nIGZyb20gRGlzayBPbiBDaGlwIDIwMDA=?=
Date: Tue, 11 Dec 2001 19:23:20 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

There seems to be a tool named doc_lilo . It can boot system from doc .

-----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: joao.filgueira@copel.com =
[mailto:joao.filgueira@copel.com]
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: =
2001=E5=B9=B412=E6=9C=8811=E6=97=A5 19:52
=E6=94=B6=E4=BB=B6=E4=BA=BA: linux-mtd@lists.infradead.org
=E4=B8=BB=E9=A2=98: Booting from Disk On Chip 2000


I have a SBC-8241 mainboard with a 8Mbytes Disk on Chip on it.
I am using kernel 2.4.16 with MTD and NTFL support enabled.
I used FDISK to create a 7Mbytes partition in /dev/ntfla1 and formated =
it
with mke2fs .
My problem is that  either LILO nor GRUB are making my DiskOnChip =
bootable.
I=E2=80=B2ve got GRUB FSF 0.90, compiled it and applied the patch from =
the CVS
repository. When i try to use the utility DOC_LOADBIOS i get a "ioctl:
MEMGETINFO error" message.
What should be my next step ?

Joao Alfredo Filgueira/
Brazil.)=C3=AE=C3=84=C3=84=C3=83v+=1C=C2=BA=C3=8B"=EF=BF=A0y=C5=A1=C5=A0=
X=C2=A7=E2=80=9AX=C2=AC=C2=B6=1Bm=C2=A7=C3=BF=C3=A5=C5=A0=C3=8Bl=C5=A0w=C3=
=ABi=C3=97=C5=A1v=C5=A0=C3=A0=C3=BEf=EF=BF=A0=E2=80=93f=C2=A7=C3=BEX=C2=AC=
=C2=B6)=C3=9F=EF=BF=A1=C3=B9b=C5=BE=C3=ACf
