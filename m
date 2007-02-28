Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMReQ-0003XK-QF
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 11:27:39 -0500
Subject: Re: [RFC] [PATCH] UBI: convert to kthread API
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200702281548.11627.alexs@linux.vnet.ibm.com>
References: <200702271450.41167.alexs@linux.vnet.ibm.com>
	<200702280915.26914.alexs@linux.vnet.ibm.com>
	<1172657053.17031.20.camel@sauron>
	<200702281548.11627.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 28 Feb 2007 18:13:49 +0200
Message-Id: <1172679229.17031.28.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-28 at 15:48 +0100, Alexander Schmidt wrote:
> On Wednesday 28 February 2007, Artem Bityutskiy wrote:
> > C. The stuff which stops the thread is _debugging_ stuff and you may
> > remove it if it causes troubles. I will add something like "do not spaw=
n
> > the thread" debugging option later when I need it.
>=20
> I have finished a patch which removes the sysfs write function and has
> some further simpifications. The code is still in its own background unit=
,
> so please comment on moving it or not. I will send "try 2" then.

I don't get it what you mean, just send the patch I take a look.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
