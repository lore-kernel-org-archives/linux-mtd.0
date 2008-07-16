Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KIzFE-0000qa-HO
	for linux-mtd@lists.infradead.org; Wed, 16 Jul 2008 05:08:04 +0000
Subject: Re: [ubi][wl] the W/R performance of my wear-leveling unit 2
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1215763483.2784.85.camel@localhost.localdomain>
References: <1215763483.2784.85.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 16 Jul 2008 08:06:10 +0300
Message-Id: <1216184770.29469.44.camel@sauron>
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

On Fri, 2008-07-11 at 16:04 +0800, xiaochuan-xu wrote:
> one other thing forgeted,
> the threshold value is 4096 for current UBI, and 100 for mine

Could you please first send a patch which only removes the protection
trees. It should not contain any other unnecessary change, just
protection tree removal.

Everything should work fine without the protection tree, because it is
just an optimization. The performance should drop I guess.

After you have succeeded providing a small and clean prot. tree removal
patch, we may continue with further WL re-working.

Please, test your patch as well. Run the UBI tests which you may find
in mtd-utils.git/tests/ubi-tests/.

Thanks.=20

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
