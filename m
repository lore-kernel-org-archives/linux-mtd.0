Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dkRDn-0001FC-Lp
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 08:41:10 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nandsim: remove debugfs entries in error path
Date: Wed, 23 Aug 2017 10:40:50 +0200
Message-ID: <1623948.djWz6fnlGP@blindfold>
In-Reply-To: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
References: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 23. August 2017, 09:03:04 CEST schrieb Uwe Kleine-K=F6nig:
> The debugfs entries must be removed before an error is returned in the
> probe function. Otherwise another try to load the module fails and when
> the debugfs files are accessed without the module loaded, the kernel
> still tries to call a function in that module.
>=20
> Fixes: 5346c27c5fed ("mtd: nandsim: Introduce debugfs infrastructure")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
