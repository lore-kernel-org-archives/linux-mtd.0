Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KYDeW-00046C-GY
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 05:33:08 +0000
Subject: Re: [PATCH 1/2] Clean up of code found when adding support for >
	2GiB MTD devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce Leonard <brucle@earthlink.net>
In-Reply-To: <48AB3AAC.7030900@earthlink.net>
References: <48AB3AAC.7030900@earthlink.net>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Aug 2008 08:29:40 +0300
Message-Id: <1219814980.18027.123.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2008-08-19 at 14:27 -0700, Bruce Leonard wrote:
> These are just some code cleanups that I found while working on the MTD s=
ub-system.
> From: brucle <brucle@selinc.com>
> Date: Wed, 13 Aug 2008 17:16:48 -0700
> Subject: [PATCH] Code clean up preping for support of > 2GiB MTD devices
>=20
> Signed-off-by: Bruce D. Leonard <brucle@selinc.com>

For this clean-up patch,

Acked-by: Artem Bityutskiy <dedekind@infradead.org>

However, are you shure it is against the mtd-2.6.git tree?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
