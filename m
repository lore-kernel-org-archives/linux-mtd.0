Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U0Vsc-0007Th-1o
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2013 11:31:02 +0000
Message-ID: <1359545452.23758.0.camel@hornet>
Subject: Re: [PATCH] mtd: physmap_of: Fix map name when "linux, mtd-name" is
 absent
From: Pawel Moll <pawel.moll@arm.com>
To: Florian Fainelli <florian@openwrt.org>
Date: Wed, 30 Jan 2013 11:30:52 +0000
In-Reply-To: <5108FEE9.4040805@openwrt.org>
References: <1359542256-19135-1-git-send-email-pawel.moll@arm.com>
 <5108FEE9.4040805@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-01-30 at 11:07 +0000, Florian Fainelli wrote:
> > Commit d68cbdd4fb04d2b756ad53c22f36943167b16340 "mtd: physmap_of:
> > allow to specify the mtd name for retro compatiblity" introduced
> > a "linux,mtd-name" property to override map names, but when
> > this property is absent (so of_property_read_string() returns
> > value !=3D 0) an uninitialized value is used (as mtd_name is not
> > set). This may lead to kernel oopses when the name is
> > derefernced, eg:
> >
> > Unable to handle kernel NULL pointer dereference at virtual address 000=
00001
> > pgd =3D 80004000
> > [00000001] *pgd=3D00000000
> > Internal error: Oops: 5 [#1] SMP ARM
> > Modules linked in:
> > CPU: 3    Not tainted  (3.8.0-rc5+ #644)
> > PC is at strcmp+0x4/0x30
> > LR is at parse_cmdline_partitions+0x54/0x2f8
> >
> > Fixed by initializing the variable to NULL.
>=20
> This is the 3rd time such a patch is submitted.
>=20
> 1358446932-7238-1-git-send-email-stef.van.os@prodrive.nl
> df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il
>=20
> Fortunately it is now in linux-mtd:
> http://git.infradead.org/linux-mtd.git/commit/7dfe4be351e81656ca1068e5d4e=
ad235c7ba94b1

Great, thanks for letting me know!

Pawel
