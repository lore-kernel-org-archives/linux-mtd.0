Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dfVRo-0005dr-2D
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 18:11:15 +0000
Date: Wed, 9 Aug 2017 20:10:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: linux-mtd@lists.infradead.org, sgtandel
 <sanjay.tandel@rockwellcollins.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
Message-ID: <20170809201047.57fd6976@bbrezillon>
In-Reply-To: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Arnd for the memcpy_to/fromio aspects.

Hi Matt,

Subject should be something like "mtd: map: support 16-bit block
transfers"

Le Fri,  4 Aug 2017 08:02:20 -0500,
Matt Weber <matthew.weber@rockwellcollins.com> a =C3=A9crit :

> From: sgtandel <sanjay.tandel@rockwellcollins.com>
>=20
> This patch adds 16-bit I/O memory write function (map_copy_to16) in map-r=
am
> driver. map-ram driver's block write function(i.e map_copy_to) uses
> memcpy_toio() function for block transfer. memcpy_toio() is limited to do
> single byte write, irrespective of bankwidth.

That's not true. Depending on the platform (+ config options)
memcpy_to/fromio() can be a simple redirection to memcpy, and
memcpy is likely to be optimized to do 32bit or 64bit accesses when
possible (IOW, when alignment allows it).=20

> Therefore,
> added map_copy_to16() function to be used by map-ram driver for block
> transfers for chips that only supports word(16-bit) transfers. map-ram
> driver's single entity read/write functions (such as map_read and
> map_write) use bankwidth property(provided by DTS entry) and calls
> appropriate readb/readw/readq function. For block write, there was no such
> implementation found in map-ram driver. So map_copy_to() calls memcpy_toio
> (which in turn calls writeb) for all block write, irrespective of
> bankwidth.

You're kind of repeating what was said above.

> So wrong or corrupted data might be written into flash memory in
> case chips that does not support 8-bit write.

It's likely to be arch and buffer alignment dependent (see my
explanation about memcpy_to/fromio() being a simple redirection to
memcpy on some architectures).

> This patch adds a condition
> in block write function (map_copy_to) to call map_copy_to16(), if bankwid=
th
> is 2. This patch also adds map_copy_from16() function to be used for 16-b=
it
> block read operation. map-ram driver's block read function
> (i.e map_copy_from) uses memcpy_fromio() function for all block read,
> irrespective of bankwidth. memcpy_fromio is limited to do single byte rea=
d.
> Therefore, Added map_copy_from16() function to be used by map-ram driver
> for block read for chips that only supports word(16-bit) transfers.
> map-ram driver's single entity read/write functions (such as map_read and
> map_write) already use bankwidth property(provided by DTS entry) and calls
> appropriate readb/readw/readq function. For block read, there was no such
> implementation found in map-ram driver. So map_copy_from() calls
> memcpy_fromio() (which in turn calls writeb) for all block write,
> irrespective of bankwidth. This patch adds a condition in block read
> function (i.e map_copy_from) to call map_copy_from16(), if bankwidth is 2.

Come on! You repeat the same thing again but for the other direction.
I'm sure you can shrink the commit message and make it clearer.

Also, while you're at it, can you please re-format the commit message
to make it readable. Right now it's a huge block of text without any
blank line or line break.

>=20
> Signed-off-by: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  include/linux/mtd/map.h | 62 +++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
> index 3aa56e3..3d7a296 100644
> --- a/include/linux/mtd/map.h
> +++ b/include/linux/mtd/map.h
> @@ -449,17 +449,77 @@ static inline void inline_map_write(struct map_info=
 *map, const map_word datum,
>  	mb();
>  }
> =20
> +static void map_copy_from16(void *to, void __iomem *from, size_t count)

You're in a source header and you define a function. If 2 source files
include the same header you'll face a duplicate symbol at link time.
This function should be inlined.

> +{
> +	const unsigned char *t =3D to;
> +
> +	if (!(IS_ALIGNED((u32)from, sizeof(u16)))) {
> +		from =3D (void __iomem *)ALIGN((u32)from, sizeof(u16))
> +							- sizeof(u16);
> +		*(u8 *)t =3D (u8)((readw(from) & 0xff00) >> 8);
> +		count--;
> +		t++;
> +		from +=3D 2;
> +	}
> +	while (count >=3D 2) {
> +		*(u16 *)t =3D readw(from);
> +		count -=3D 2;
> +		t +=3D 2;
> +		from +=3D 2;
> +	};
> +	while (count > 0) {
> +		*(u8 *)t =3D (u8)(readw(from) & 0x00ff);
> +		count--;
> +		t++;
> +		from++;
> +	}
> +}
> +
>  static inline void inline_map_copy_from(struct map_info *map, void *to, =
unsigned long from, ssize_t len)
>  {
>  	if (map->cached)
>  		memcpy(to, (char *)map->cached + from, len);
> +	else if (map_bankwidth_is_2(map))
> +		map_copy_from16(to, map->virt + from, len);
>  	else
>  		memcpy_fromio(to, map->virt + from, len);

We're likely to face the same problem with map_bankwidth_is_4()
(AKA 32bit busses), right? Why not patching the code to handler this
case?

BTW, I'm not sure what kind of guarantees are provided by
memcpy_to/fromio(), but I'd expect them to optimize things when they
can, so they might use 32bit or 64bit accesses when alignment
authorizes it. Will that work correctly even on 8bit chips?

>  }
> =20
> +static void map_copy_to16(void __iomem *to, const void *from, size_t cou=
nt)

Ditto -> static inline void


> +{
> +	const unsigned char *f =3D from;
> +	u16 d;
> +
> +	if (!(IS_ALIGNED((u32)to, sizeof(u16)))) {
> +		to =3D (void __iomem *)ALIGN((u32)to, sizeof(u16))
> +							- sizeof(u16);
> +		d =3D (readw(to) & 0x00ff) | ((u16)(*(const u8 *)f) << 8);
> +		writew(d, to);
> +		count--;
> +		to +=3D 2;
> +		f++;
> +	}
> +	while (count >=3D 2) {
> +		writew(*(const u16 *)f, to);
> +		count -=3D 2;
> +		to +=3D 2;
> +		f +=3D 2;
> +	};
> +	while (count > 0) {
> +		d =3D (readw(to) & 0xff00) | (u16)(*(const u8 *)f);
> +		writew(d, to);
> +		count--;
> +		to++;
> +		f++;
> +	}
> +}
> +
>  static inline void inline_map_copy_to(struct map_info *map, unsigned lon=
g to, const void *from, ssize_t len)
>  {
> -	memcpy_toio(map->virt + to, from, len);
> +	if (map_bankwidth_is_2(map))
> +		map_copy_to16(map->virt + to, from, len);
> +	else
> +		memcpy_toio(map->virt + to, from, len);
>  }
> =20
>  #ifdef CONFIG_MTD_COMPLEX_MAPPINGS
