Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JPYLB-0001H3-Mm
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 07:17:11 +0000
Subject: Re: [2.6 patch] make mtd/nand/cs553x_nand.c:part_probes[] static
From: Mart Raudsepp <mart.raudsepp@artecdesign.ee>
To: Adrian Bunk <bunk@kernel.org>
In-Reply-To: <20080213213010.GX3383@cs181133002.pp.htv.fi>
References: <20080213213010.GX3383@cs181133002.pp.htv.fi>
Content-Type: text/plain; charset=utf-8
Date: Thu, 14 Feb 2008 09:16:47 +0200
Message-Id: <1202973407.4560.3.camel@martr-gentoo.artec>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


=C3=9Chel kenal p=C3=A4eval, K, 2008-02-13 kell 23:30, kirjutas Adrian Bunk=
:
> This patch makes the needlessly global part_probes[] static.
>=20
> Signed-off-by: Adrian Bunk <bunk@kernel.org>

Acked-by: Mart Raudsepp <mart.raudsepp@artecdesign.ee>

Note that many other drivers in mtd/nand have the same part_probes array
global instead of static.
