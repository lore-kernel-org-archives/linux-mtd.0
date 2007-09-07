Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITWgb-0006cg-UC
	for linux-mtd@lists.infradead.org; Fri, 07 Sep 2007 01:47:25 -0400
Subject: Re: General performance of NAND operations i.e mount and ls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20070906160357.GG2164@z1.synertronixx>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
	<20070906084418.GC2164@z1.synertronixx>
	<1189069864.14370.34.camel@sauron> <1189077119.14370.52.camel@sauron>
	<20070906160357.GG2164@z1.synertronixx>
Content-Type: text/plain; charset=utf-8
Date: Fri, 07 Sep 2007 08:47:14 +0300
Message-Id: <1189144034.14370.73.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-06 at 18:03 +0200, Konstantin Kletschke wrote:
> > may you please go to Device Drivers--->Memory Technology Device (MTD)
> > support--->UBI - Unsorted block images---> in menuconfig and enable "UB=
I
> > debugging", "UBI debugging messages", and "Extra self-checks" and try
> > again? Then send what UBI prints. I'll try to figure out what is wrong.
>=20
> Well after half an hour I got this:

It is long because you enabled paranoid checks. One of them scans whole
media and makes sure it is really empty and contains only 0xFFs. You may
disable paranoid checks to make it faster.

> UBI DBG: attach_mtd_dev: attaching mtd4 to ubi0: VID header offset 0 data=
 offset 0
> UBI DBG: io_init: min_io_size      2048
> UBI DBG: io_init: hdrs_min_io_size 512
> UBI DBG: io_init: ec_hdr_alsize    512
> UBI DBG: io_init: vid_hdr_alsize   512
> UBI DBG: io_init: vid_hdr_offset   512
> UBI DBG: io_init: vid_hdr_aloffset 512
> UBI DBG: io_init: vid_hdr_shift    0
> UBI DBG: io_init: leb_start        2048
> UBI DBG: io_init: leb_size         129024
> UBI DBG: io_init: ro_mode          0
> UBI DBG: ubi_scan: scanning is finished

Yeah, your flash driver is not OK. It reports 2 in mtd->subpage_sft, but
it is unable to write in sub-page chunks (512 bytes) - it returns -EIO.=20

You should either teach it to write sub-pages (preferable) or report 0
in mtd->subpage_sft, which would mean "no sub-page support".

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
