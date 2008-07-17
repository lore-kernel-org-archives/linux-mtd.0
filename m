Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KJQ0T-0004ET-DQ
	for linux-mtd@lists.infradead.org; Thu, 17 Jul 2008 09:42:37 +0000
Subject: Re: [PATCH][UBI]:Remove the prot tree from the WL unit
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1216264662.2781.15.camel@localhost.localdomain>
References: <1216214483.2782.91.camel@localhost.localdomain>
	<1216217566.29469.62.camel@sauron>
	<1216218027.2782.97.camel@localhost.localdomain>
	<1216218036.29469.64.camel@sauron>
	<1216218971.2782.112.camel@localhost.localdomain>
	<1216219840.29469.81.camel@sauron>
	<1216264662.2781.15.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Thu, 17 Jul 2008 12:40:34 +0300
Message-Id: <1216287634.29469.97.camel@sauron>
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

On Thu, 2008-07-17 at 11:17 +0800, xiaochuan-xu wrote:
> I believe the next patch should modify the used tree, i.e., adding the
> @tempr element to @struct ubi_wl_entry and some relative sentences.
> Of course, a used tree special function refer to as @wl_used_tree_add()
> is in need. =20
>=20
> What do you think?

That's fine. Please, do this.

A thing for you to think about:
One thing I am concerned about is memory consumption. The temperature
is 'long long', so you add 64-bits to per-PEB objects. Do you think it
will be possible to make it 32-bit to reduce memory usage, and deal with
overflows somehow? Anyway, let's  leave it 64-bit for now and see what
we may do after this.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
