Received: from [213.97.115.166] (helo=drkitkat.Hispafuentes.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15TllK-0006DY-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Aug 2001 15:53:47 +0100
To: linux-mtd@lists.infradead.org
Subject: Problems with NAND support
From: juan@hispafuentes.com (Juan Ramon Jimenez)
Date: 06 Aug 2001 17:00:02 +0200
Message-ID: <m34rrlfd3h.fsf@drkitkat.Hispafuentes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

--=20

   Hi all

    We are trying to compile a kernel with MTD support but we have
some problems to get it. We have probed with several kernel sources
(2.4.3, 2.4.6, 2.4.7) and with the same sources replacing the mtd
files with the cvs directory files from infredead.org. In both cases
we have the same results: We only can get a kernel image if we don't
enable NAND device support.  The problem is that we really need it. Do
you know why?

Also we have seen that we _must_ set a value for 'physical start
address of flash mapping' But we have read in 'mtd-jffs-HOWTO.txt':

   ' If you leave the address blank (or just don't enable the advanced=20
     options), the code will *auto probe*. This works quite well (at=20
     least for me). Try it first.'

What's the problem then?


   We have used  gcc 2.96 and egcs 2.91.66 with a Red Hat 7.0 (kernel
2.2.17-8)=20=20

   Any comment or solution will be welcome. Thanks
   J


                                ///
                               (@ @)
 ------------------------oOO----(_)----OOo-------------------------

 - No comas todo lo que puedes, no gastes todo lo que tienes,
   no creas todo lo que oigas, no digas todo lo que sabes.
   - Proverbio chino.

 ------------------------------------------------------------------

 =A4=BA=B0=B0=BA=A4=F8,=B8=B8,=F8=A4=BA=B0=B0=BA=A4=F8,=B8=B8,=F8=A4=BA=B0`=
=B0=BA=A4=F8,=B8

    Juan Ram=F3n Jim=E9nez Garc=EDa
    Hispafuentes
    Tfno 91 4575330
    jjimenez@aucland.com
    juan@hispafuentes.com

 =A4=BA=B0=B0=BA=A4=F8,=B8=B8,=F8=A4=BA=B0=B0=BA=A4=F8,=B8=B8,=F8=A4=BA=B0`=
=B0=BA=A4=F8,=B8
