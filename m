Received: from zmamail03.zma.compaq.com ([161.114.64.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eDxD-0003zA-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 13:05:47 +0100
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: tiny JFFS2 Reader
Date: Mon, 12 Aug 2002 08:05:45 -0400
Message-ID: <D99C1FB421989A40818B6370E31870940283B428@tayexc19.americas.cpqcorp.net>
From: "Hicks, Jamey" <Jamey.Hicks@hp.com>
To: "Tino Keitel" <tino.keitel@innominate.com>,
	<linux-mtd@lists.infradead.org>
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


> -----Original Message-----
> From: Tino Keitel [mailto:tino.keitel@innominate.com]
> Sent: Monday, August 12, 2002 2:56 AM
> To: linux-mtd@lists.infradead.org
> Subject: Re: tiny JFFS2 Reader
>=20
>=20
> On Sat, Aug 10, 2002 at 16:30:19 -0000, sriram  neelakandan wrote:
> > Hi group,
> > I am looking for a tiny jffs2 reader that can read a file from a=20
> > jffs2 partition..
> > the code in jffs2reader.c in the MTD utils tar
> > mtd-20000704.tar.gz (hope this is the latest)
> > does not have the logic to read beyond the first node of the=20
> > file.
>=20
> There was a project called load_kernel at
> http://russ.dhs.org/load_kernel.html, but this web server=20
> doesn't exist
> anymore. It contains all code to look for a file called "linux" on a
> cramfs oder jffs2 image and read it (including zlib decompression).
> Maybe you want to contact the author (try Russ.Dill@asu.edu). I could
> also send you the archive.

This code has also been incorporated into our bootldr: =
http://www.handhelds.org/feeds/bootldr has binaries and source.

Jamey
