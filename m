Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HzuCC-0007qB-NK
	for linux-mtd@lists.infradead.org; Sun, 17 Jun 2007 08:49:34 -0400
Subject: Re: ubi: Error freeing ubi->vtbl while unloading
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0706150301v33006e58h9a86c1f126437e32@mail.gmail.com>
References: <9b52d64c0706150301v33006e58h9a86c1f126437e32@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sun, 17 Jun 2007 15:49:27 +0300
Message-Id: <1182084567.4403.17.camel@sauron>
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

On Fri, 2007-06-15 at 15:31 +0530, Vinit Agnihotri wrote:
> I downloaded latest git & backported ubi to make it work in linux
> kernel 2.6.18.3.
>=20
> Machine details
>  AMD opteron 64bit SMP, linux kernel version 2.6.18.3
>=20
> However while unloading ubi I discovered slab corruption. Ths problem
> is as follows.
>=20
> ubi->vtbl is allocated using vmalloc() in vtbl.c empty_create_lvol(),
> but it is freed in build.c with kfree()

Thanks, fixed the patch, added Signed-off-by and committed.=20

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
