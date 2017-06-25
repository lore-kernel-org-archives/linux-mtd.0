Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPAWj-0001KC-FX
 for linux-mtd@lists.infradead.org; Sun, 25 Jun 2017 16:36:47 +0000
Date: Sun, 25 Jun 2017 18:36:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Kyungmin Park
 <kyungmin.park@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: Stop directly calling master ->_xxx() hooks
 from mtdpart code
Message-ID: <20170625183622.5417b3b4@bbrezillon>
In-Reply-To: <20170625160113.11860-1-boris.brezillon@free-electrons.com>
References: <20170625160113.11860-1-boris.brezillon@free-electrons.com>
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

Le Sun, 25 Jun 2017 18:01:12 +0200,
Boris Brezillon <boris.brezillon@free-electrons.com> a =C3=A9crit :

> The MTD layer provides several wrappers around mtd->_xxx() hooks. Call
> these wrappers instead of directly dereferencing the associated ->_xxx()
> pointer.
>=20
> This change has been motivated by another rework letting the core
> handle the case where ->_read/write_oob() are implemented but not
> ->_read/write(). In this case, we want mtd_read/write() to fall back to
> ->_read/write_oob() when ->_read/write() are NULL. The problem is, =20
> mtdpart is directly calling the ->_xxx() instead of using the wrappers,
> thus leading to a NULL pointer exception.
>=20
> Even though we only need to do the change for part_read/write(), going
> through those wrappers for all kind of part -> master operation
> propagation is a good thing, because other wrappers might become
> smarter over time, and the duplicated check overhead (parameters will
> be checked at the partition and master level instead of only at the
> partition level) should be negligible.

Hm, this one is conflicting with Rafal's work on part parsers, but
before I send a v3 rebased on l2-mtd/master I'd like to have feedback
on the changes done here.

>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - new patch needed to fix a NULL pointer dereference BUG
> ---
>  drivers/mtd/mtdpart.c | 71 ++++++++++++++++++++++-----------------------=
------
>  1 file changed, 31 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index ea5e5307f667..11486ec6cab0 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -68,8 +68,7 @@ static int part_read(struct mtd_info *mtd, loff_t from,=
 size_t len,
>  	int res;
> =20
>  	stats =3D part->master->ecc_stats;
> -	res =3D part->master->_read(part->master, from + part->offset, len,
> -				  retlen, buf);
> +	res =3D mtd_read(part->master, from + part->offset, len, retlen, buf);
>  	if (unlikely(mtd_is_eccerr(res)))
>  		mtd->ecc_stats.failed +=3D
>  			part->master->ecc_stats.failed - stats.failed;
> @@ -84,15 +83,15 @@ static int part_point(struct mtd_info *mtd, loff_t fr=
om, size_t len,
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> =20
> -	return part->master->_point(part->master, from + part->offset, len,
> -				    retlen, virt, phys);
> +	return mtd_point(part->master, from + part->offset, len, retlen, virt,
> +			 phys);
>  }
> =20
>  static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> =20
> -	return part->master->_unpoint(part->master, from + part->offset, len);
> +	return mtd_unpoint(part->master, from + part->offset, len);
>  }
> =20
>  static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
> @@ -103,8 +102,7 @@ static unsigned long part_get_unmapped_area(struct mt=
d_info *mtd,
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> =20
>  	offset +=3D part->offset;
> -	return part->master->_get_unmapped_area(part->master, len, offset,
> -						flags);
> +	return mtd_get_unmapped_area(part->master, len, offset, flags);
>  }
> =20
>  static int part_read_oob(struct mtd_info *mtd, loff_t from,
> @@ -132,7 +130,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t=
 from,
>  			return -EINVAL;
>  	}
> =20
> -	res =3D part->master->_read_oob(part->master, from + part->offset, ops);
> +	res =3D mtd_read_oob(part->master, from + part->offset, ops);
>  	if (unlikely(res)) {
>  		if (mtd_is_bitflip(res))
>  			mtd->ecc_stats.corrected++;
> @@ -146,48 +144,43 @@ static int part_read_user_prot_reg(struct mtd_info =
*mtd, loff_t from,
>  		size_t len, size_t *retlen, u_char *buf)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_read_user_prot_reg(part->master, from, len,
> -						 retlen, buf);
> +	return mtd_read_user_prot_reg(part->master, from, len, retlen, buf);
>  }
> =20
>  static int part_get_user_prot_info(struct mtd_info *mtd, size_t len,
>  				   size_t *retlen, struct otp_info *buf)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_get_user_prot_info(part->master, len, retlen,
> -						 buf);
> +	return mtd_get_user_prot_info(part->master, len, retlen, buf);
>  }
> =20
>  static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
>  		size_t len, size_t *retlen, u_char *buf)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_read_fact_prot_reg(part->master, from, len,
> -						 retlen, buf);
> +	return mtd_read_fact_prot_reg(part->master, from, len, retlen, buf);
>  }
> =20
>  static int part_get_fact_prot_info(struct mtd_info *mtd, size_t len,
>  				   size_t *retlen, struct otp_info *buf)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_get_fact_prot_info(part->master, len, retlen,
> -						 buf);
> +	return mtd_get_fact_prot_info(part->master, len, retlen, buf);
>  }
> =20
>  static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		size_t *retlen, const u_char *buf)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_write(part->master, to + part->offset, len,
> -				    retlen, buf);
> +	return mtd_write(part->master, to + part->offset, len, retlen, buf);
>  }
> =20
>  static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		size_t *retlen, const u_char *buf)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_panic_write(part->master, to + part->offset, len,
> -					  retlen, buf);
> +	return mtd_panic_write(part->master, to + part->offset, len, retlen,
> +			       buf);
>  }
> =20
>  static int part_write_oob(struct mtd_info *mtd, loff_t to,
> @@ -199,30 +192,29 @@ static int part_write_oob(struct mtd_info *mtd, lof=
f_t to,
>  		return -EINVAL;
>  	if (ops->datbuf && to + ops->len > mtd->size)
>  		return -EINVAL;
> -	return part->master->_write_oob(part->master, to + part->offset, ops);
> +	return mtd_write_oob(part->master, to + part->offset, ops);
>  }
> =20
>  static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
>  		size_t len, size_t *retlen, u_char *buf)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_write_user_prot_reg(part->master, from, len,
> -						  retlen, buf);
> +	return mtd_write_user_prot_reg(part->master, from, len, retlen, buf);
>  }
> =20
>  static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
>  		size_t len)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_lock_user_prot_reg(part->master, from, len);
> +	return mtd_lock_user_prot_reg(part->master, from, len);
>  }
> =20
>  static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
>  		unsigned long count, loff_t to, size_t *retlen)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_writev(part->master, vecs, count,
> -				     to + part->offset, retlen);
> +	return mtd_writev(part->master, vecs, count, to + part->offset,
> +			  retlen);
>  }
> =20
>  static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
> @@ -231,7 +223,7 @@ static int part_erase(struct mtd_info *mtd, struct er=
ase_info *instr)
>  	int ret;
> =20
>  	instr->addr +=3D part->offset;
> -	ret =3D part->master->_erase(part->master, instr);
> +	ret =3D mtd_erase(part->master, instr);
>  	if (ret) {
>  		if (instr->fail_addr !=3D MTD_FAIL_ADDR_UNKNOWN)
>  			instr->fail_addr -=3D part->offset;
> @@ -257,51 +249,51 @@ EXPORT_SYMBOL_GPL(mtd_erase_callback);
>  static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_lock(part->master, ofs + part->offset, len);
> +	return mtd_lock(part->master, ofs + part->offset, len);
>  }
> =20
>  static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_unlock(part->master, ofs + part->offset, len);
> +	return mtd_unlock(part->master, ofs + part->offset, len);
>  }
> =20
>  static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_is_locked(part->master, ofs + part->offset, len);
> +	return mtd_is_locked(part->master, ofs + part->offset, len);
>  }
> =20
>  static void part_sync(struct mtd_info *mtd)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	part->master->_sync(part->master);
> +	mtd_sync(part->master);
>  }
> =20
>  static int part_suspend(struct mtd_info *mtd)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_suspend(part->master);
> +	return mtd_suspend(part->master);
>  }
> =20
>  static void part_resume(struct mtd_info *mtd)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	part->master->_resume(part->master);
> +	mtd_resume(part->master);
>  }
> =20
>  static int part_block_isreserved(struct mtd_info *mtd, loff_t ofs)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
>  	ofs +=3D part->offset;
> -	return part->master->_block_isreserved(part->master, ofs);
> +	return mtd_block_isreserved(part->master, ofs);
>  }
> =20
>  static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
>  	ofs +=3D part->offset;
> -	return part->master->_block_isbad(part->master, ofs);
> +	return mtd_block_isbad(part->master, ofs);
>  }
> =20
>  static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
> @@ -310,7 +302,7 @@ static int part_block_markbad(struct mtd_info *mtd, l=
off_t ofs)
>  	int res;
> =20
>  	ofs +=3D part->offset;
> -	res =3D part->master->_block_markbad(part->master, ofs);
> +	res =3D mtd_block_markbad(part->master, ofs);
>  	if (!res)
>  		mtd->ecc_stats.badblocks++;
>  	return res;
> @@ -319,13 +311,13 @@ static int part_block_markbad(struct mtd_info *mtd,=
 loff_t ofs)
>  static int part_get_device(struct mtd_info *mtd)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	return part->master->_get_device(part->master);
> +	return __get_mtd_device(part->master);
>  }
> =20
>  static void part_put_device(struct mtd_info *mtd)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> -	part->master->_put_device(part->master);
> +	__put_mtd_device(part->master);
>  }
> =20
>  static int part_ooblayout_ecc(struct mtd_info *mtd, int section,
> @@ -353,8 +345,7 @@ static int part_max_bad_blocks(struct mtd_info *mtd, =
loff_t ofs, size_t len)
>  {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> =20
> -	return part->master->_max_bad_blocks(part->master,
> -					     ofs + part->offset, len);
> +	return mtd_max_bad_blocks(part->master, ofs + part->offset, len);
>  }
> =20
>  static inline void free_partition(struct mtd_part *p)
