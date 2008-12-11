Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LArF4-0006pK-Ue
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 19:30:35 +0000
Subject: Re: ubiattach fails with bad VID header offset 2048, expected 512 ???
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
In-Reply-To: <4941188A.30303@runbox.com>
References: <4941188A.30303@runbox.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 11 Dec 2008 21:28:23 +0200
Message-Id: <1229023703.13686.398.camel@sauron>
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

On Thu, 2008-12-11 at 08:41 -0500, Cal Page wrote:
> ubiattach fails with bad VID header offset 2048, expected 512 ???
>=20
> The is the first thing out of the box. It reads block 0 to get the=20
> ubi_ec_hdr then parses it.

I guess you generated an image with wrong sub-page size?

> UBI DBG (pid 2785): ctrl_cdev_ioctl: attach MTD device
> UBI: attaching mtd12 to ubi0
> UBI DBG (pid 2785): io_init: min_io_size      2048
> UBI DBG (pid 2785): io_init: hdrs_min_io_size 512
> UBI DBG (pid 2785): io_init: ec_hdr_alsize    512
> UBI DBG (pid 2785): io_init: vid_hdr_alsize   512
> UBI DBG (pid 2785): io_init: vid_hdr_offset   512
> UBI DBG (pid 2785): io_init: vid_hdr_aloffset 512
> UBI DBG (pid 2785): io_init: vid_hdr_shift    0
> UBI DBG (pid 2785): io_init: leb_start        2048
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048

You have 512 bytes sub-pages, so UBI expects the volume ID header to be
at offset 512.

Probably these sections should give you some understanding how and at
which offsets the headers are stored:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead
http://www.linux-mtd.infradead.org/faq/ubi.html#L_ubi_mkimg
http://www.linux-mtd.infradead.org/faq/ubi.html#L_find_min_io_size

Anyway, if you want to force UBI to use other position for the VID
header, there are UBI module options for this. Take a look at what
'modinfo ubi' tells.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
