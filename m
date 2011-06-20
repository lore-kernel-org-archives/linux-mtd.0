Received: from smail6.alcatel.fr ([64.208.49.42])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYak4-00049l-Fz
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 09:26:01 +0000
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 20 Jun 2011 11:25:34 +0200
Subject: RE: NAND OOB data.
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4D634@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andy Kennedy wrote:
>=20
> I have overwritten my OOB data, to the point where all blocks=20
> are seen as bad.  What do I do to recover from this?

If you're using u-boot then you can use the 'nand scrub' command which wipe=
s all of the data from NAND, including OOB data. Only problem with that is =
you will lose any factory marked bad block markers, but sounds like in your=
 current situation that isn't much of a concern for you. :o)

>=20
> Thanks,
> Andy

Thanks

Adam=
