Subject: Re: [PATCH][nandsim]Fix RAM wasting via kmalloc (take 2)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0810291313140.30280@casper.infradead.org>
References: <alpine.LFD.1.10.0810291313140.30280@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Sat, 01 Nov 2008 11:35:52 +0200
Message-Id: <1225532153.26460.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-29 at 13:14 +0000, Alexey Korolev wrote:
> @@ -437,6 +440,8 @@ static int alloc_device(struct nandsim *ns)
>  	for (i =3D 0; i < ns->geom.pgnum; i++) {
>  		ns->pages[i].byte =3D NULL;
>  	}
> +	ns->nand_pages_slab =3D kmem_cache_create("nandsim",
> +						ns->geom.pgszoob, 0, 0, NULL);

Sorry, but how about checking for errors here?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
