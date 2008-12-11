Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAr7f-0005gs-Gw
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 19:22:55 +0000
Subject: Re: [PATCH] [UBI] 1/4 UBI volume notifications - UBI changes
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@gmail.com
In-Reply-To: <1228987532.7622.66.camel@hp.diimka.lan>
References: <1228759160.7622.28.camel@hp.diimka.lan>
	<1228818989.13686.172.camel@sauron>
	<1228938622.7622.60.camel@hp.diimka.lan>
	<1228975678.13686.367.camel@sauron>
	<1228987532.7622.66.camel@hp.diimka.lan>
Content-Type: text/plain; charset=utf-8
Date: Thu, 11 Dec 2008 21:20:16 +0200
Message-Id: <1229023216.13686.391.camel@sauron>
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

On Thu, 2008-12-11 at 12:25 +0300, dmitry pervushin wrote:
> > > > I do not understand this change. The point is to prevent anyone fro=
m
> > > > opening the volume before it is completely initialized. What you do=
 -
> > > > you allow the volume to be opened while it is in the middle of
> > > > initialization, which is wrong. E.g., what if the initialization fa=
ils
> > > > at some point?
> > > >=20
> > > > And this change does not seem to be relevant to this patch.
> > > This change is absolutely needed :)
> > > Well, the sequence of steps is as follows:
> > > 1. uif_init calls ubi_add_volume
> > > 2. ubi_add_volume notifies everyone about volume adding
> > > 3. (successful exit is not interested to us)
> > > 4. in case of errors reported by uif_init ubi_attach_mtd_dev calls
> > > ubi_kill_volumes
> > > 5. ubi_kill_volumes calls ubi_free_volume, which notifies everyone ab=
out
> > > volume deleting.
>=20
> Isn't it better then to protect the critical section in uif_init and
> open_volume by mutexes?

May be. If you need this, feel free to send a patch. But it would not
give you much, because you would have to call your notifiers _outside_
the mutexes, i.e. at the very end of the attach function.

>  Now it looks as you are adding volumes on
> non-existing-yet device.

Right. For a short period of time during the attach process you may see
volumes which you cannot really open (you get -ENODEV). That was not a
problem so far, and it was just easier to implement things this way.

If you want to improve this and make the opening processes wait on a
mutex - please, go ahead. But I doubt you really need this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
