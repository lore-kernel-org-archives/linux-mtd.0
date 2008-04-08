Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj1da-0003Rd-07
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 00:24:34 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: joern@logfs.org
Subject: Re: [patch 2/15] fs/logfs/logfs_abi.h
Date: Tue, 8 Apr 2008 02:24:17 +0200
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833002@logfs.org>
In-Reply-To: <20080401181332.853833002@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200804080224.18014.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi J=F6rn,

Great to see a new version finally posted again!

A few things that I spotted looking through this header,
I hope I can find some time to look throught the other files
as well.

On Tuesday 01 April 2008, joern@logfs.org wrote:
> --- /dev/null	2008-04-02 16:29:12.813336657 +0200
> +++ linux-2.6.24logfs/fs/logfs/logfs_abi.h	2008-04-01 21:02:34.980239877 =
+0200
> @@ -0,0 +1,523 @@
> +/*
> + * fs/logfs/logfs.h

The comment doesn't match the file name, and the file name doesn't
match the purpose -- you are not defining an "application" binary
interface but rather the medium format, with the small exception
of the chattr flags.

> +#ifndef fs_logfs_logfs_abi_h
> +#define fs_logfs_logfs_abi_h

Everyone else uses capital letters for these.

> +/*
> + * LOGFS_HEADERSIZE is the size of a single header in the object store,
> + * LOGFS_MAX_OBJECTSIZE the size of the largest possible object, includi=
ng
> + * its header,
> + * LOGFS_SEGMENT_RESERVE is the amount of space reserved for each segmen=
t for
> + * its segment header and the padded space at the end when no further ob=
jects
> + * fit.
> + */
> +#define LOGFS_HEADERSIZE	(0x1c)
> +#define LOGFS_SEGMENT_HEADERSIZE (0x18)
> +#define LOGFS_MAX_OBJECTSIZE	(LOGFS_HEADERSIZE + LOGFS_BLOCKSIZE)
> +#define LOGFS_SEGMENT_RESERVE	(LOGFS_HEADERSIZE + LOGFS_MAX_OBJECTSIZE -=
 1)

The comment makes it sound like the last line should be

#define LOGFS_SEGMENT_RESERVE (LOGFS_SEGMENT_HEADERSIZE + LOGFS_MAX_OBJECTS=
IZE - 1)

> +/**
> + * struct logfs_disk_dentry - on-medium dentry structure
> + *
> + * @ino:			inode number
> + * @namelen:			length of file name
> + * @type:			file type, identical to bits 12..15 of mode
> + * @name:			file name
> + */
> +struct logfs_disk_dentry {
> +	__be64	ino;
> +	__be16	namelen;
> +	__u8	type;
> +	__u8	name[LOGFS_MAX_NAMELEN];
> +} __attribute__((packed));

With LOGFS_MAX_NAMELEN =3D=3D 255, this data structure is not aligned to 64
bits, which means that accessing the inode number requires unaligned
memory accesses when you have an array of logfs_disk_dentry structures
on the medium. Is that intentional?

If you add another 32 bits here, you don't need the __packed any more.

> +/**
> + * struct logfs_object_header - per-object header in the ostore
> + *
> + * @crc:			crc32 of header, excluding data_crc
> + * @len:			length of data
> + * @type:			object type, see above
> + * @compr:			compression type
> + * @ino:			inode number
> + * @bix:			block index
> + * @data_crc:			crc32 of payload
> + */
> +struct logfs_object_header {
> +	__be32	crc;
> +	__be16	len;
> +	__u8	type;
> +	__u8	compr;
> +	__be64	ino;
> +	__be64	bix;
> +	__be32	data_crc;
> +} __attribute__((packed));

Similarly, this structure contains 8 byte members but has a smaller
size.

	Arnd <><
