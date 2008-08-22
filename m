Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWTRg-00083L-9U
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 10:00:40 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Fri, 22 Aug 2008 12:00:25 +0200
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
	<48AE22F5.3000309@lougher.demon.co.uk>
In-Reply-To: <48AE22F5.3000309@lougher.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808221200.26052.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?windows-1252?q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 22 August 2008, Phillip Lougher wrote:
> >=20
> > This looks very nice, but could use some comments about how the data is
> > actually stored on disk. It took me some time to figure out that it act=
ually
> > allows to do tail merging into compressed blocks, which I was about to =
suggest
> > you implement ;-). Cramfs doesn't have them, and I found that they are =
the
> > main reason why squashfs compresses better than cramfs, besides the def=
ault
> > block size, which you can change on either one.
>=20
> Squashfs has much larger block sizes than cramfs (last time I looked it=20
> was limited to 4K blocks), and it compresses the metadata which helps to=
=20
> get better compression. =A0But tail merging (fragments in Squashfs=20
> terminology) is obviously a major reason why Squashfs gets good compressi=
on.

The *default* block size in cramfs is smaller than in squashfs, but they bo=
th
have user selectable block sizes. I found the impact of compressed metadata
to be almost zero. I hacked up a mksquashfs to avoid tail merging, and found
that the image size for squashfs and cramfs is practically identical if you
use the same block size and no tail merging.

> The AXFS code is rather obscure but it doesn't look to me that it does=20
> tail merging. =A0The following code wouldn't work if the block in questio=
n=20
> was a tail contained in a larger block. =A0It assumes the block extends t=
o=20
> the end of the compressed block (cblk_size - cnode_offset).

yes, I thought the same thing when I first read that code, and was about
to send a lengthy reply about how it should be changed when I saw that
it already does exactly that ;-).

	Arnd <><
