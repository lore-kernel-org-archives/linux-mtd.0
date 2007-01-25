Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HA9pl-0005p2-1m
	for linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 14:00:32 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200701241019.27470.alexs@linux.vnet.ibm.com>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 25 Jan 2007 20:16:34 +0200
Message-Id: <1169748994.9477.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Wed, 2007-01-24 at 10:19 +0100, Alexander Schmidt wrote:
> I am currently implementing a per volume update marker for UBI.
> It would be nice to know if you are interested in this feature and if you
> have remarks about my concept.
>=20
> The main reason I see for implementing this feature is that the current u=
pdate
> marker blocks updates to all volumes if the update marker is pending. So =
the
> user needs to interfere after an update has been interrupted. We saw this
> problem for example when mirroring volumes at boot time. Another point is
> that pending update markers on removed volumes are avoided. While reprodu=
cing
> this error case, i got some kernel panics from the current kernel.
>=20
> My suggestion to solve these problems is to include a per volume update m=
arker
> in the volume table (both in ram and on flash), and to let the user perfo=
rm
> updates on all volumes, while still marking volumes with pending update
> markers as corrupted to avoid reading of corrupted/incomplete data. In my
> first implementation, I used a free (marked as "padding") byte in the vol=
ume
> table and added the function "ubi_vmt_updvol()" to volmgmt.c. This functi=
on
> gets called by the functions for starting and finishing updates with the
> appropriate flags and sets or removes the update marker from the volume
> table.


The patch in general (did not look closely to the details) looks good
for me. But are you sure you want this patch? It was a requirement from
your team to implement the update marker. Note, your patch means that
the boot-loader needs to read and interpret the volume table which
increases its size.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
