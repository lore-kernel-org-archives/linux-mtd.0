Received: from mx2.netapp.com ([216.240.18.37])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKPmk-0000pF-Kd
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 03:08:24 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: FW: JFFS2 Utility?
Date: Wed, 30 Jan 2008 19:07:41 -0800
Message-ID: <521D420437D1FD4CA77F1B71E3C4FB8D035D86C1@exsvl03.hq.netapp.com>
From: "Venkatapuram, Nagaraj" <Nagaraj.Venkatapuram@netapp.com>
To: <ricard.wanderlof@axis.com>, <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I downloaded mtd-utils-1.1.0 tar ball from the link mentioned below =
and I did a make. I ran into following compilation errors. Has any body =
got any insight as to what the problem could be ? Obviously, function =
definitions are missing and as a result the build is failing.

gcc -I./include -O2 -Wall -g -c -o compr_lzo.o compr_lzo.c -g =
-Wp,-MD,./.compr_lzo.c.dep
compr_lzo.c:29:23: lzo/lzo1x.h: No such file or directory
compr_lzo.c: In function `jffs2_lzo_cmpr':
compr_lzo.c:54: warning: implicit declaration of function =
`lzo1x_999_compress'
compr_lzo.c:56: `LZO_E_OK' undeclared (first use in this function)
compr_lzo.c:56: (Each undeclared identifier is reported only once
compr_lzo.c:56: for each function it appears in.)
compr_lzo.c: In function `jffs2_lzo_decompress':
compr_lzo.c:74: warning: implicit declaration of function =
`lzo1x_decompress_safe'
compr_lzo.c:76: `LZO_E_OK' undeclared (first use in this function)
compr_lzo.c: In function `jffs2_lzo_init':
compr_lzo.c:95: `LZO1X_999_MEM_COMPRESS' undeclared (first use in this =
function)make: *** [compr_lzo.o] Error 1
rm doc_loadbios.o flash_erase.o mkfs.jffs.o nanddump.o ftl_format.o =
ftl_check.o

Thanks,
Nagaraj

-----Original Message-----
From: Tallam, Sreenivas=20
Sent: Wednesday, January 30, 2008 5:25 PM
To: Venkatapuram, Nagaraj
Subject: FW: JFFS2 Utility?

 Thanks
Sreen

-----Original Message-----
From: Ricard Wanderlof [mailto:ricard.wanderlof@axis.com]=20
Sent: Wednesday, December 19, 2007 11:56 PM
To: Tallam, Sreenivas
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Utility?


It is not difficult to build from source. A tarball of the source can be =
found here:

ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.1.0.tar.bz2

Download, unpack, and do 'make' to build them.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
