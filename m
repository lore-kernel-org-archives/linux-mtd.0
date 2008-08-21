Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW8av-00044F-80
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 11:44:50 +0000
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: jaredeh@gmail.com
In-Reply-To: <48AD0126.1050609@gmail.com>
References: <48AD0126.1050609@gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 21 Aug 2008 14:40:38 +0300
Message-Id: <1219318838.18027.68.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-08-20 at 22:46 -0700, Jared Hulbert wrote:
> +	err =3D zlib_inflateReset(&stream);
> +	if (err !=3D Z_OK) {
> +		printk(KERN_ERR "zlib_inflateReset error %d\n", err);
> +		zlib_inflateEnd(&stream);
> +		zlib_inflateInit(&stream);
> +	}

Jared,

just FYI, are you aware that LZO which is also present in the kernel is
much faster on decompress than zlib, while its compression is only
slightly worse?

I do not remember the digits, but last time I tested UBIFS, LZO
decompression was about 3 times faster than zlib on OMAP3. This depends
on architecture, etc of course. This may matter a lot if one is fighting
for faster system boot-up. So you might consider supporting LZO as well.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
