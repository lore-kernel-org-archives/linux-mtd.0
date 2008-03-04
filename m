Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWTiF-0000xL-CK
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 09:45:31 +0000
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10803040140q2d4801d5m4271cadcaa55579@mail.gmail.com>
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<bae050c10803040140q2d4801d5m4271cadcaa55579@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 04 Mar 2008 11:40:21 +0200
Message-Id: <1204623622.23706.22.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-03-04 at 17:40 +0800, Nancy wrote:
> Hi,
>     UBI block device layer's basic function finally OK now.
>=20
>     Please, replace the "ubi_new.diff" with "ubi_blk_ok.diff"
>=20
>     Next to do:
>           1,  fix ubi->ref_count
>           2,  when write a LEB, do not read the old mapped LEB to
> write_cache, only read needed pages  to hance speed.

Hi,

could you please send patches inline? It is what people normally do
and it is easier to reply and comment the patches this way.

Also, I do not think we need this common "blktrans" module for UBI at
all, it just does not seem to make much sense.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
