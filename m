Received: from mx1.prosoftsystems.ru ([212.23.72.203])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OOOHN-0007Ex-2X
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 05:01:42 +0000
From: Alexander Pazdnikov <pazdnikov@prosoft.ural.ru>
To: <linux-mtd@lists.infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: ubifs became broken on contigous power-fails
Date: Tue, 15 Jun 2010 11:02:01 +0600
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<1274694991.22999.52.camel@localhost>
	<1276352575.19028.121.camel@localhost>
In-Reply-To: <1276352575.19028.121.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201006151102.01851.pazdnikov@prosoft.ural.ru>
Reply-To: pazdnikov@prosoftsystems.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 12 =D0=B8=D1=8E=D0=BD=D1=8F 2010=
 20:22:55 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Artem Bityutskiy =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Mon, 2010-05-24 at 12:56 +0300, Artem Bityutskiy wrote:
> > On Mon, 2010-05-24 at 15:50 +0600, Alexander Pazdnikov wrote:
> > > > Could you enable debugging messages when mounging it after power
> > > > cuts? The messages generate a lot of noise, so you need to disable
> > > > them before starting the real test. The idea is to get UBIFS
> > > > debugging messages when errors occur.
> > >
> > > Sorry, I've hurried up, and after applying your pathes reflash all of
> > > the devices with new firmware.
> > > But I'll setup some devices with all firmware to catch this issue
> > > again.
> > >
> > > > I never had time to really dig this and fix. Would be nice if you
> > > > could do this because I will unlikely have time in the nearest
> > > > future, but I can help you.
> > >
> > > Thank you, I'll continue testings and can supply with debug
> > > information.
> > >
> > > > One think you can do is to make sure you do not fill UBIFS
> > > > completely, then you will avoid hitting these budgeting bugs, also
> > > > known as ENOSPC issues (I think btrfs uses this terminology).
> > >
> > > In the issue above there is 11% used space and 89% free space.
> > > I've got this issue only when mounting fs in RO and then remounting it
> > > in RW.
> >
> > OK. Try my patch. Also, it is worth running your tests with UBIFS extra
> > self checks enabled.
>=20
> Did it help?
>=20
Artem, thank you very much, yes - it helped, all of 10 testing devices=20
survived with repeatable powerfails (1,2,3,4,5,6,7,8,9,10 minutes in this=20
sequence) for a week.
Now we leave 3 devices for this test.

Appologize me, please, I've not tested again for the RO-RW recovery on remo=
unt=20
with this patch to supply you with debug info.

=2D-=20
Best Regards,
Alexander Pazdnikov
