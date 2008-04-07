Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JiqGv-0000Y5-4s
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 12:16:26 +0000
Subject: Re: choosing a file system to use on NAND/UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080407112010.GA8942@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron> <20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron> <20080407073227.GA6317@cloud.net.au>
	<1207555006.8040.76.camel@sauron> <20080407112010.GA8942@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 15:15:34 +0300
Message-Id: <1207570534.8040.94.camel@sauron>
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

On Mon, 2008-04-07 at 21:20 +1000, Hamish Moffatt wrote:
> Is that the CRC of one whole page of each block?

Only of the headers, which are 64 bytes.

> > I have 2 quick ideas about how to improve scan speed, but I am not sure
> > if they will help.
> >=20
> > 1. Currently what UBI is doing is: read EC header, check it, read VID
> > header, check it. So we run mtd->read() 2 times (it might help to run i=
t
> > 1 time because EC and VID headers go one after the other): read EC and
> > VID headers in one go, check them. We might do this soon.
>=20
> How much is read each time - just a few bytes? Are those reads
> duplicated by the CRC check?

Well, NAND allows reading it PAGE_SIZE units. So it reads whole page.
Your flash allows sub-page write, so UBI reads 2KiB for per each
eraseblock. Then The your CPU is doing ECC check.

> > Well, the only way is to use mkfs.ubifs for this. You may create an
> > empty image, put it to the media and that's it. Would you conceive
> > something else?
>=20
> I mean, I am preparing my root file system on my host and using
> mkfs.ubifs to generate an image which I write with ubiupdatevol. I found
> that zlib produced a smaller image.

That's right, zlib compresses better then lzo. But as I said, it is
slower, and reading files are slower, because de-compression is slower
in case of zlib.

> Also I found that the image can be compressed further with gzip or lzma.

Yes, because of several factors:
1. UBIFS (and JFFS2) does not compress meta-data.
2. UBIFS (and JFFS2) compresses 4KiB chunks of data independently.
Compression is better when you compress large chunks (which happens when
you use gzip or lzma), rather then small chunks.
3. The image has paddings, like paddings to the end of NAND page or to
the end of eraseblock. They also introduce more compressible data for
gzip.

> Could ubiupdatevol support on-the-fly decompression?
Err, why?

>  I will develop a
> patch if I have time.. I already patched flashcp to do this once.

Sorry, I am not sure what you mean here as well. What did your patch do?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
