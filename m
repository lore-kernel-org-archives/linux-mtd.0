Received: from nm9.bullet.mail.sp2.yahoo.com ([98.139.91.79])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RYL9n-0003tC-NW
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 17:19:48 +0000
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
 <1310988807.20738.44.camel@sauron>
 <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
 <1313411391.2583.22.camel@sauron>
 <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
Message-ID: <1323278383.39855.YahooMailNeo@web114617.mail.gq1.yahoo.com>
Date: Wed, 7 Dec 2011 09:19:43 -0800 (PST)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Re: UBIFS Corruption
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Reginald Perrin <reggyperrin@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=0A>>  1. You enabled all UBIFS debugging messages which are too verbose=
 and=0A>>  not needed. Do not enable them because they "push out" the =0A> =
interesting=0A>>  diagnostic messages from the kernel printk ring buffer.=
=0A>> =0A=0A=0AArtem,=0A=0AI'm trying to get a good log, but seem to have i=
ssues getting the right configuration. =A0Currently, I have these config se=
ttings:=0ACONFIG_MTD_UBI=3Dy=0ACONFIG_MTD_UBI_WL_THRESHOLD=3D4096=0ACONFIG_=
MTD_UBI_BEB_RESERVE=3D1=0ACONFIG_UBIFS_FS=3Dy=0ACONFIG_UBIFS_FS_XATTR=3Dy=
=0ACONFIG_UBIFS_FS_LZO=3Dy=0ACONFIG_UBIFS_FS_ZLIB=3Dy=0ACONFIG_UBIFS_FS_DEB=
UG=3Dy=0ACONFIG_UBIFS_FS_DEBUG_MSG_LVL=3D0=0A=0A=0A=0ABooting shows:=0A[ =
=A0 =A04.860000] UBI: background thread "ubi_bgt1d" started, PID 355=0AUBI =
device number 1, total 749 LEBs (96638976 bytes, 92.2 MiB), available 0 LEB=
s (0 bytes), LEB size 129024 bytes (126.0 KiB)=0A[ =A0 =A05.004000] UBIFS: =
recovery needed=0A[ =A0 =A05.580000] UBIFS error (pid 357): ubifs_recover_l=
eb: garbage=0A[ =A0 =A05.584000] UBIFS error (pid 357): ubifs_scanned_corru=
ption: corruption at LEB 498:81920=0A[ =A0 =A05.588000] UBIFS error (pid 35=
7): ubifs_scanned_corruption: first 8192 bytes from LEB 498:81920=0A[ =A0 =
=A05.616000] UBIFS error (pid 357): ubifs_recover_leb: LEB 498 scanning fai=
led=0A=0A=0A=0AWhen I do a dmesg, I get:=0Aroot:/> dmesg=0Afffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff =A0................................=0A=
[ =A0 =A05.608000] 00001460: ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff =A0................................=0A(snip)=0A[ =
=A0 =A05.616000] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff =A0................................=0A[ =A0 =A05.61=
6000] UBIFS error (pid 357): ubifs_recover_leb: LEB 498 scanning failed=0A[=
 =A0 =A05.620000] UBIFS DBG (pid 359): ubifs_bg_thread: background thread "=
ubifs_bgt1_0" stops=0A=0A=0A=0AThis is pretty much the start of the log:=0A=
=0Aroot:/> head -n 20 /var/log/messages=A0=0AJan =A01 12:38:28 syslogd star=
ted: BusyBox v1.16.2=0AJan =A01 12:38:28 kernel: [ =A0 =A05.608000] 0000148=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0A=0A=0A=0AI can actually pull the imag=
e off the flash (using JTAG), it's about 20MB. =A0When I've tried to mount =
this in the past on my PC, I get a mount error and can't get more informati=
on. =A0We would be willing to share (under NDA), and contract assistance, i=
f required. =A0=0A=0AIs this any better?=0A
