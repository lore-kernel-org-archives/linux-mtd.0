Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FbJ0W-0000jb-N2
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 11:11:25 -0400
Received: by ug-out-1314.google.com with SMTP id u40so145029ugc
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 May 2006 08:11:14 -0700 (PDT)
Message-ID: <625fc13d0605030811h664d2330o53fc9cefd7a93bff@mail.gmail.com>
Date: Wed, 3 May 2006 10:11:14 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Dmitry Bazhenov" <atrey@emcraft.com>
In-Reply-To: <625fc13d0605030807q43ee416bo8cb1dcf9f2a71645@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <200605031556.37660.atrey@emcraft.com> <44589BCE.2060402@yandex.ru>
	<200605031828.51552.atrey@emcraft.com>
	<625fc13d0605030807q43ee416bo8cb1dcf9f2a71645@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/3/06, Josh Boyer <jwboyer@gmail.com> wrote:
>
> What Artem was asking is if it was physically possible to have a
> file/directory with 4294967296 versions to being with.  Take a 1 byte
> file as an example.  If that was the only file on the whole device,
> and you had that many versions of it you'd have:
>
> 68 bytes overhead per version + 1 byte of data per version =3D
> 296352743424 bytes required to store.
>
> That's 276 GiB.  Which isn't even sane for JFFS2 anyway.

Of course, that's the worst possible case and you can run into
situations where not all of those nodes are on flash.

I shouldn't do math before having coffee.

josh
