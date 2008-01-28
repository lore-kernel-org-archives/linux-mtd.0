Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJWlq-0004F1-N0
	for linux-mtd@lists.infradead.org; Mon, 28 Jan 2008 16:23:48 +0000
Subject: Re: [PATCH] UBI: introduce atomic LEB change ioctl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <20080125152829.591def16@zod.rchland.ibm.com>
References: <20080124165453.30169.40332.sendpatchset@golum>
	<20080125152829.591def16@zod.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 28 Jan 2008 18:22:46 +0200
Message-Id: <1201537366.4262.2.camel@sauron>
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

On Fri, 2008-01-25 at 15:28 -0600, Josh Boyer wrote:
> Could you explain a bit more?  What exactly does "atomic" mean?
>=20
> This seems like it's similar to volume update, only on a LEB level
> right? If so, could you make volume update just use this or somehow
> combine them?
>=20
> Maybe I've just been away from UBI too long.  It sounds cool, but I
> don't fully understand what the intention is.

Josh,

I've updated the UBI documentation in order to answer your question. Any
documentation improvements and spelling fixes are welcome.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
