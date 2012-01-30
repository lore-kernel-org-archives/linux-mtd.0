Received: from antispam02.maxim-ic.com ([205.153.101.183])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrmfw-0002B5-Tk
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 08:33:22 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] ubinfo: fix `--all' for non-consecutive device numbers
Date: Mon, 30 Jan 2012 09:32:13 +0100
References: <1327563110-23966-1-git-send-email-computersforpeace@gmail.com>
 <201201260953.04349.brian.foster@maxim-ic.com>
 <CAN8TOE9hvxBGG40P9RV=-1r9m3wrYGOnBUFvBmZk3nn-8=RAnw@mail.gmail.com>
In-Reply-To: <CAN8TOE9hvxBGG40P9RV=-1r9m3wrYGOnBUFvBmZk3nn-8=RAnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201201300932.14012.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 January 2012 19:28:59 Brian Norris wrote:
> On Thu, Jan 26, 2012 at 12:53 AM, Brian Foster <brian.foster@maxim-ic.com=
> wrote:
> > [ ... ] looking at the mtd-utils v1.4.6 =E2=80=98mtdinfo.c=E2=80=99,
> >  is there a similar issue there?  But I have no idea
> >  how you could get non-consecutive MTD device numbers?
>=20
> Yeah, there is a problem there. It's a little more difficult to see,
> but it can happen.
>=20
> Suppose you have /dev/mtd0 on your system, then you can get an error
> with the following sequence:
>=20
> # modprobe mtdram
> # modprobe nandsim
> # rmmod mtdram
> # mtdinfo --all
> ...
> mtdinfo: error!: mtd1 does not correspond to any existing MTD device

 Ah, Ok!  I had a similar thought over the weekend,
 and before seeing your e-mail tried to set-up the
 situation up on one of our SoC evaluation boards,
 using our H/W drivers.  But for some reason those
 drivers won't unload  =E2=80=94 I should look into that =E2=80=94
 and then saw your e-mails ....

> I'm sending a quick patch set for this.

 Yeah, saw it, seemed Ok to me.  Thanks.

cheers!
	-blf-

=2D-=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated Products      |  Web:  http://www.maxim-ic.com/
