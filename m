Received: from sdcmail02.amcc.com ([198.137.200.90])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqEGO-0005Kl-VW
	for linux-mtd@lists.infradead.org; Tue, 22 Sep 2009 22:55:17 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] [JFFS2] Fix csize integer overflow issue due to truncation
Date: Tue, 22 Sep 2009 15:55:02 -0700
Message-ID: <0CA0A16855646F4FA96D25A158E299D606FFE9B4@SDCEXCHANGE01.ad.amcc.com>
In-Reply-To: <1253392841.6317.37.camel@macbook.infradead.org>
References: <25217471.1985431251223831787.JavaMail.nabble@isper.nabble.com>
	<0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
	<1253392841.6317.37.camel@macbook.infradead.org>
From: "Victor Gallardo" <vgallardo@amcc.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: Prodyut Hazarika <phazarika@amcc.com>, linux-mtd@lists.infradead.org,
	Feng Kan <fkan@amcc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>=20
> Apologies for the delay. I'm slightly concerned that your patch
> increases the size of the 'struct jffs2_tmp_dnode_info', and we've
> previously taken care to _shrink_ that structure. We have _lots_ of
> these.
>=20
> Can you test this alternative approach instead, please?
>=20

Tested it on my system. Your patch works.

-Victor Gallardo
