Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GcIWD-0007FI-4q
	for linux-mtd@lists.infradead.org; Tue, 24 Oct 2006 05:24:23 -0400
Subject: Re: [PATCH] MTD: fix printk format warning
From: Artem Bityutskiy <dedekind@infradead.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20061023214826.d54fc7c6.randy.dunlap@oracle.com>
References: <20061023214826.d54fc7c6.randy.dunlap@oracle.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 24 Oct 2006 12:24:10 +0300
Message-Id: <1161681850.3260.167.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: akpm <akpm@osdl.org>, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-10-23 at 21:48 -0700, Randy Dunlap wrote:
> (may be a gcc phenomenon)
> Fix printk format warning:
> drivers/mtd/maps/physmap.c:93: warning: long long unsigned int format, lo=
ng unsigned int arg (arg 2)
>=20
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

... snip ...

>       	printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8ll=
x\n",
> -	    (unsigned long long)dev->resource->end - dev->resource->start + 1,
> +	    (unsigned long long)(dev->resource->end - dev->resource->start + 1)=
,
>  	    (unsigned long long)dev->resource->start);

Hmm, AFAIK

"(unsigned long) dev->resource->end - dev->resource->start + 1" should=20

end up with unsigned long, so why not to fix gcc instead?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
