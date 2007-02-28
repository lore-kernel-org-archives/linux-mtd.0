Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMM2P-0007UL-41
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 05:27:59 -0500
Subject: Re: [RFC] [PATCH] UBI: convert to kthread API
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200702280915.26914.alexs@linux.vnet.ibm.com>
References: <200702271450.41167.alexs@linux.vnet.ibm.com>
	<1172599497.3885.2.camel@zod.rchland.ibm.com>
	<1172599889.17031.9.camel@sauron>
	<200702280915.26914.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 28 Feb 2007 12:04:13 +0200
Message-Id: <1172657053.17031.20.camel@sauron>
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

On Wed, 2007-02-28 at 09:15 +0100, Alexander Schmidt wrote:
> Basically, with using the kthread api, it is still neccessary to have the
> following functions:
>=20
> 1) start the thread with kthread_create()
> 2) a main loop for the thread
> 3) enqueue work in the pending work list
> 4) kill/stop the thread
>=20
> As 3) is only done by the wear leveling unit, the code could be moved
> there, IMO. Starting and stoping the thread could also be done in the
> wl init and close functions, so it seems sensible to move everything to
> the wear leveling unit.
>=20
> A point that causes complexity in the code is that we have two ways of
> stopping the thread:
>=20
> 1) If ubi goes into read only mode or if the thread is disabled via sysfs=
,
> the thread is put to sleep, pending works are not finished
> 2) If ubi is shut down, the thread finishes all pending works and then
> exits.
>=20
> An enhancement here would be to remove the sysfs functionality, and make
> the thread exit when going in ro_mode, while still not finishing the
> pending work (it is not possible to leave ro_mode during runtime, right?)

My unsorted points:

A. Well, at the moment we switch to RO mode if we hit an error and do
not know how to handle it. And yes, at the moment it is forever, but
later we may want to add a sysfs entry to leave the RO mode, for example
jwb already wants it.

B. Also, at the moment UBI does not work if the bgt is killed, but this
is not nice and will be fixed at some point - we should be able to do
everything if the thread is killed.

C. The stuff which stops the thread is _debugging_ stuff and you may
remove it if it causes troubles. I will add something like "do not spawn
the thread" debugging option later when I need it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
