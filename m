Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HSYqB-0008Dl-6O
	for linux-mtd@lists.infradead.org; Sat, 17 Mar 2007 09:21:02 -0400
Subject: Re: how can I use MTD partition with large size ( >= 4G bytes)?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0703170542t2ccd0db4p71c62760874d7829@mail.gmail.com>
References: <BAY107-F20DDEF29A5BA389380A768ED700@phx.gbl>
	<625fc13d0703170542t2ccd0db4p71c62760874d7829@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 17 Mar 2007 15:20:53 +0200
Message-Id: <1174137653.11927.18.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Tian Jin <tad2k@msn.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-03-17 at 07:42 -0500, Josh Boyer wrote:
> > I've tried to modify the data type of mtd->size to usinged long long, b=
ut
> > kernel can not be compiled successfully=C2=A3=C2=ACIs there any solutio=
n for this?
>=20
> Not at the moment.  MTD doesn't support things greater than 4GiB.
Yeah.

We should re-work whole MTD and make it use (eraseblock number):(offset
withing eraseblock) addresses, instead of absolute offsets. This implies
changing interfaces. For the in-kernel ones it is not a problem. For the
userspace ones it is. I guess we should just invent new userspace API,
while preserving the old one. This is a great opportunity to dispose of
ancient junk at once.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
