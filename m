Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KDKsr-0003Py-Lk
	for linux-mtd@lists.infradead.org; Mon, 30 Jun 2008 15:01:38 +0000
Subject: Re: UBIFS error (pid 4687): compr_init: cannot inittialize
	compressor zlib, error -2
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1214829850.2771.2.camel@localhost.localdomain>
References: <1214829850.2771.2.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Mon, 30 Jun 2008 17:59:29 +0300
Message-Id: <1214837969.6573.53.camel@sauron>
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

Hi,

On Mon, 2008-06-30 at 20:44 +0800, xiaochuan-xu wrote:
> I have created a UBI layer on top of mtd and create a volumes in
> 2.6.26-rc5-01191-g23baa5b-dirty.
> and when i met such error when i modprobe ubifs:
> =20
> FATAL: Error inserting ubifs
> (/lib/mdules/2.6.26-rc5-01191-g23baa5b-dirty/kernel/fs/ubifs/ubifs.ko):
> Unknown symbol in module, or unknown parameter (see dmesg)

Did you run depmod -a
=20
> I've try to install zlib module,but I only found a similar module named
> zlib_deflate=20
> which is useless for the problem. Maybe seting CONFIG_UBIFS_FS_ZLIB =3D n
> can solve this problem.

You need "deflate" and "zlib_deflate" modules.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
