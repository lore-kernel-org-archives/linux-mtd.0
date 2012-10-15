Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TNmOK-0008QX-An
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 15:15:42 +0000
Message-ID: <1350314130.5769.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: use list_move_tail instead of list_del/list_add_tail
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Date: Mon, 15 Oct 2012 18:15:30 +0300
In-Reply-To: <CAPgLHd_AHHe7=H18K54LvbiS0M7_w1vTMOxwwxgVdRaiXNN-OA@mail.gmail.com>
References: <CAPgLHd_AHHe7=H18K54LvbiS0M7_w1vTMOxwwxgVdRaiXNN-OA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tRnwX2uJOF5+MjvTCJEn"
Mime-Version: 1.0
Cc: richard@nod.at, yongjun_wei@trendmicro.com.cn, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tRnwX2uJOF5+MjvTCJEn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-09 at 14:14 +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> Using list_move_tail() instead of list_del() + list_add_tail().
>=20
> dpatch engine is used to auto generate this patch.
> (https://github.com/weiyj/dpatch)
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Pushed to linux-ubi.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-tRnwX2uJOF5+MjvTCJEn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfCiSAAoJECmIfjd9wqK0DUUP/1V4hLIYHK81ac+KlW/oNFiy
8H2QSbPCfJhS6hsIXpKOOZ/09M1qbt+J0klUyKShnqr2ZbrBmrJgr+1KcYWYYn5u
o2RCuq//IV8YCuINZVmOyt+FoK1ooueKSXQnKXZNPo14Z9oqyzlGkHgLygh1Df8P
HaC2zU4SO+XnSiveYlqVYrf/EOarYUYbFb9JZHg6UxqfHJUr7eIAeSkB/rjEwPNX
ifhU2AO5H4VNaHrfAvQAP+GGOHQhTrl52Z42Da80fmWxSr3Jjnfl7e5Ml1E2XPI+
sistT7laUmTvTFhet0ajBu2cHkyKxVZaonoHbrqQy30ONk7ORaqfvE4miKDN4wuJ
g6P3ye9VJJSuZ37OjOHDNhOFlN0R694Ld5/hHbMxJDxuvLw0r0qS9PM2bR8p4cDc
WswqZ+BIer98uiJi7wJZJDEGDfHlpDh+OksYeytXLCuiBj0+4JPVV3RyzYZtU3cl
NQ9/u07dOBuFMkFe8BLQ2HkVL8fSHoSmrRDryJDhHhrBG9Xgfdplv9pZhSYwfcsq
HFeRhemRDd5pdlBJmuBB2azg+eKzsfwbRrZySLzY4qAeBev8mvIhPNZViLrYLU1N
4lVxX4WnkEtnjA6vPCBK9lXp47ZdRONUMDO+DTTmODFjgZfc40t4F4UY4HpKtFP5
AAHtWF0CPJzBapzSSV5l
=7VKN
-----END PGP SIGNATURE-----

--=-tRnwX2uJOF5+MjvTCJEn--
