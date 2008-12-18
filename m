Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LDGms-0001BW-Ll
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 11:11:27 +0000
Subject: Re: [PATCH] [UBI] 1/5 - UBI notifications, take two
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@gmail.com
In-Reply-To: <1229598476.7900.62.camel@hp.diimka.lan>
References: <1229339635.7900.21.camel@hp.diimka.lan>
	<1229349879.4911.45.camel@sauron>
	<1229543636.7900.53.camel@hp.diimka.lan>
	<1229585500.17960.99.camel@sauron>
	<1229598476.7900.62.camel@hp.diimka.lan>
Content-Type: text/plain; charset=utf-8
Date: Thu, 18 Dec 2008 13:11:43 +0200
Message-Id: <1229598703.17960.104.camel@sauron>
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

On Thu, 2008-12-18 at 14:07 +0300, dmitry pervushin wrote:
> On Thu, 2008-12-18 at 09:31 +0200, Artem Bityutskiy wrote:
> > On Wed, 2008-12-17 at 22:53 +0300, dmitry pervushin wrote:
> > > > So you call notifiers from withing spin-locks. Are they really bloc=
king
> > > > notifiers? Note, if you call any UBI kernel API function from the
> > > > notifier, you'll deadlock. E.g., if you call 'ubi_get_device_info()=
',
> > > > you'll deadlock on 'ubi_devices_lock'. Did you test your code?
> > > >=20
> > > > I guess you should prohibit recursion and pass full UBI device/volu=
me
> > > > information _inside_ the notifier. And the subsystems which work ab=
ove
> > > > UBI should never _open_ UBI volumes from within notifiers. E.g., th=
e
> > > > "simple FTL" stuff should open the UBI volume only when the
> > > > corresponding FTL block device is opened, not in the notifier.
> > > Although it is a good idea and it will save some time for notified
> > > modules -- it won't help me. The block device created by ftl could be
> > > opened immediately after creating, err.., actually, in the middle of
> > > creating - e.g., to read partition table.
> > >=20
> > > The ubi_enum_volumes could open the volume with the flag
> > > UBI_OPEN_INTERNAL and thus release spinlock when calling notifiers.
> >=20
> > You may introduce a "ubi_get_volume(struct ubi_info *ubi, int vol_id)"
> > function, similar to the existing "ubi_get_device(int ubi_num)"
> > function. However, it looks like you may just use UBI_READONLY instead.
> > It will not prevent the "notifyees" to open the volume in UBI_READWRITE
> > mode.
> But will prevent opening in UBI_EXCLUSIVE. OK, get_volume/put_volume
> looks as the right way to go.

It will prevent exlusive, as well as get/put must prevent exclusive, so
there should be no difference for you at all. Exclusive is used when the
module is removed or re-sized, and there must be zero users if these
operations are performed.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
