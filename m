Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kmiaw-00039Q-Bu
	for linux-mtd@lists.infradead.org; Mon, 06 Oct 2008 05:25:22 +0000
Subject: Re: [RFC] Support for > 2Gib MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OFBFC97F2E.8869DAF6-ON882574D7.006EFDFB-882574D7.00713C5B@selinc.com>
References: <OFBFC97F2E.8869DAF6-ON882574D7.006EFDFB-882574D7.00713C5B@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 06 Oct 2008 08:24:48 +0300
Message-Id: <1223270688.8051.78.camel@sauron>
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

On Fri, 2008-10-03 at 13:36 -0700, Bruce_Leonard@selinc.com wrote:
> Here's a rough idea of what I'm thinking.  In .../include/mtd/mtd-abi.h=20
> add new 64 bit structs like this:
>=20
> +struct erase_info_user_64 {
> +       uint64_t start;
> +       uint64_t length;
> +}
>=20
> +struct mtd_info_user_64 {
> +       ...
> +       uint32_t flags;
> +       uint64_t size;
> +       ...
> +}
>=20
> These new structs would be identical to the old ones execept for the type=
s=20
> on a few fields.

Please, add something like
uint8_t padding[128]; /* Reserved for future, should be zeroed */
to the new data structures.

>   To indicate that the new 64 bit interface is to be used=20
> I would introduce a new flag for 'struct mtd_info_user_XX->flags',=20
> something like this:
>=20
> #define MTD_LARGE_SIZE 0x4000

No need for this. Because you'll change size of data structures and
their layout, this is not going to be compatible anyway.

> In .../include/linux/mtd.h I would add new fields as follows:
>=20
> struct erase_info {
>         ...
>         u_int32 fail_addr;
> +       u_int64_t addr_64;
> +       u_int64_t len_64;
> +       u_int64_t fail_addr_64;
>         u_long time;
>         ...
> }
>=20
> struct mtd_info {
>         ...
>         u_int32_t size;
> +       u_int64_t size_64;
>         u_int32_t erasesize;
>         ...
> }

This is what I would avoid doing. I would try to make size 64-bit and
amend all MTD users if needed.

> Plus a few new IOCTLs for getting info to/from user space if people want=20
> to use it.

I do not mind ioctl for this, but dwmw2 expressed a desire to do this
via sysfs instead of ioctl...

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
