Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXcZF-00089h-54
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 17:10:49 +0000
Received: by wyf23 with SMTP id 23so1343533wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Jun 2011 10:10:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308298294.13535.3.camel@phoenix>
References: <1308298176.13535.1.camel@phoenix>
	<1308298294.13535.3.camel@phoenix>
Date: Fri, 17 Jun 2011 10:10:42 -0700
Message-ID: <BANLkTi=MiT1PrcJMdAfegTg74BQYNHC2fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: onenand/samsung.c: fix build error
From: Brian Norris <computersforpeace@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Jun 17, 2011 at 1:11 AM, Axel Lin <axel.lin@gmail.com> wrote:
> - =A0 =A0 =A0 err =3D mtd_device_parse_register(&info->mtd, NULL, 0,
> + =A0 =A0 =A0 err =3D mtd_device_parse_register(onenand->mtd, NULL, 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdata ? pdata->parts : NUL=
L,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdata ? pdata->nr_parts : =
0);

Wouldn't it be just the same (and shorter) to use "mtd" instead of
onenand->mtd? Like:

       err =3D mtd_device_parse_register(mtd, NULL, 0,
                     pdata ? pdata->parts : NULL,
                     pdata ? pdata->nr_parts : 0);

Brian
