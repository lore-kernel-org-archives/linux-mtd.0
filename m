Received: from nm14-vm0.bullet.mail.ird.yahoo.com ([77.238.189.193])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S0vJ4-0008Db-Bt
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2012 13:35:31 +0000
Message-ID: <1330090528.12272.YahooMailNeo@web29011.mail.ird.yahoo.com>
Date: Fri, 24 Feb 2012 13:35:28 +0000 (GMT)
From: Patrick <kpa_info@yahoo.fr>
Subject: UBI: infinite error loop
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Reply-To: Patrick <kpa_info@yahoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear mailing-list,=0A=0AI am still trying to use UBI and UBIFS on my board =
running a 3.0.21 kernel.=0A=0AWhen I am doing an the ubiattach -p /dev/mtd4=
 command I have the following infinite error loop:=0A=0A=0AUBI error: ubi_i=
o_read: error -74 (ECC error) while reading 512 bytes from PEB 4059:512, re=
ad 512 bytes=0AUBI warning: ubi_io_read_vid_hdr: bad CRC at PEB 4059, calcu=
lated 0x9f1c9c0d, read 0x9f1c1c0d=0AUBI warning: ubi_eba_copy_leb: error 4 =
while reading VID header back from PEB 4059=0AUBI: run torture test for PEB=
 4059=0AUBI: PEB 4059 passed torture test, do not mark it as bad=0AUBI erro=
r: ubi_io_read: error -74 (ECC error) while reading 512 bytes from PEB 4059=
:512, read 512 bytes=0AUBI: run torture test for PEB 4059=0AUBI: PEB 4059 p=
assed torture test, do not mark it as bad=0AUBI warning: ubi_io_read_vid_hd=
r: bad CRC at PEB 4059, calculated 0x42cdb8ed, read 0xff402946=0AUBI warnin=
g: ubi_eba_copy_leb: error 4 while reading VID header back from PEB 4059=0A=
UBI: run torture test for PEB 4059=0AUBI: PEB 4059 passed torture test, do =
not mark it as bad=0AUBI error: ubi_io_read: error -74 (ECC error) while re=
ading 512 bytes from PEB 4059:512, read 512 bytes=0AUBI: run torture test f=
or PEB 4059=0A....=0A=0A=0AI don't think it's normal that this error loop i=
nfinitely again and again...=0A=0AAny help is appreciated !=0A=0AThanks in =
advance=0A=0APatrick=0A
