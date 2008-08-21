Received: from moutng.kundenserver.de ([212.227.126.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW9DN-0004OD-K0
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 12:24:33 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: jaredeh@gmail.com
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Thu, 21 Aug 2008 14:24:31 +0200
References: <48AD00E6.2070505@gmail.com>
In-Reply-To: <48AD00E6.2070505@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808211424.31966.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>,
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

On Thursday 21 August 2008, Jared Hulbert wrote:
> +static inline u64 axfs_bytetable_stitch(u8 depth, u8 *table, u64 index)
> +{
> +=A0=A0=A0=A0=A0=A0=A0u64 i;
> +=A0=A0=A0=A0=A0=A0=A0u64 output =3D 0;
> +=A0=A0=A0=A0=A0=A0=A0u64 byte =3D 0;
> +=A0=A0=A0=A0=A0=A0=A0u64 j;
> +=A0=A0=A0=A0=A0=A0=A0u64 bits;
> +
> +=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < depth; i++) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0j =3D index * depth + i;
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bits =3D 8 * (depth - i - 1=
);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0byte =3D table[j];
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0output +=3D byte << bits;
> +=A0=A0=A0=A0=A0=A0=A0}
> +=A0=A0=A0=A0=A0=A0=A0return output;
> +}
> +
> +#define AXFS_GET_BYTETABLE_VAL(desc,index) \
> + =A0axfs_bytetable_stitch(((struct axfs_region_desc)(desc)).table_byte_d=
epth,\
> + =A0(u8 *)((struct axfs_region_desc)(desc)).virt_addr, index)
> +

This bytetable stuff looks overly complicated, both the data structure and
the access method. It seems like you are implementing your own custom Huffm=
an
compression with this.

Is the reasonn for the bytetable just to pack numbers efficiently, or do you
have a different intention?

Did you see a significant size benefit over simply storing all metadata as
uncompressed data structures like in cramfs?

Have you considered storing simple dentry/inode data in node_type=3D=3DComp=
ressed
nodes?

	Arnd <><
