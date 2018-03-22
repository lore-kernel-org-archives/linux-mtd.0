Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ez1lY-0007hS-5l
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 15:04:35 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Timo Ketola <timo@exertus.fi>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: UBI assert failed in ubi_wl_init
Date: Thu, 22 Mar 2018 16:05:52 +0100
Message-ID: <7511413.bof9RI5LLK@blindfold>
In-Reply-To: <f18eea07-c2c5-cb61-e8d9-73b0b654645c@exertus.fi>
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <CAFLxGvwyxJT8BtuPTJRonPhNnJ5mRtqda3H3u7bDTOsx7cRvtw@mail.gmail.com>
 <f18eea07-c2c5-cb61-e8d9-73b0b654645c@exertus.fi>
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

Timo,

Am Donnerstag, 22. M=E4rz 2018, 14:57:57 CET schrieb Timo Ketola:
> On 21.03.2018 00:02, Richard Weinberger wrote:
> > Timo,
> >=20
> > On Fri, Mar 16, 2018 at 2:34 PM, Timo Ketola <timo@exertus.fi> wrote:
> >> On 18.02.2018 22:31, Richard Weinberger wrote:
> >>> Okay. That's a bit odd. Maybe my analysis is wrong. Can you try the
> >>> following, replay the image to your NAND and attach again.
> >>> Then you should get the same UBI assert a second time.
> >>=20
> >> Of course I can but what would be the difference to simple rebooting? I
> >> get the assertion failure on every boot from the second one onwards.
> >> Before I commit to that one, let's look what I found recently.
> >>=20
> >> I already tried the replay but bumped into ECC errors. Due to that and
> >> other things I switched the kernel to Freescale IMX 4.9.74 with Bounda=
ry
> >> fixes. I reduced the size of the user partition to 1800M and got rid of
> >> the 'could not get any free erase block' and 'Unable to write new
> >> fastmap' errors. The assertion failures from the second boot onwards
> >> remained.
> >>=20
> >> I wondered why I'm not seeing the same issue with my smaller 64M system
> >> mtd. Then I reduced the user partition to 48M and the mtd to 64M and t=
he
> >> issue vanished. Then I kept the partition at 48M but restored the mtd
> >> size to 1800M and the issue returned. If I make the mtd size 0x4e680000
> >> or smaller there is no issue. If I make it 0x4e6a0000 or larger the
> >> issue is there. Every time I erased the NAND and burned a fresh image.
> >>=20
> >> What do you want me to do next?
> >=20
> > Did you verify the image or not? :)
> > I asked you do to so because the image you sent me does not make sense
> > and I'm not sure whether I can trust it.
> > Hence I asked for a double-check.
>=20
> Ok, sorry.
>=20
> Here is a dump after the second boot:
>=20
> https://drive.google.com/open?id=3D1oa2lV_OB_tC-SX_c4jylnMXK6x1xhj2o
>=20
> After I dumped it I erased the whole mtd, wrote the dump back there,
> dumped another dump and verified that it was identical with the first
> one. Then I rebooted and observed that the issue was still there just as
> before.

This image contains a Fastmap, but it is invalid.
The image has a length of 2079326208 bytes, your PEB size is 128KiB.
Therefore PEB count is 15864.
But the Fastmap references PEBs 15865, 15866 and 15867.

This explains the failing assert, Fastmap talks about PEBs which are unknow=
n=20
to UBI.

Can it be that your mtd partition layout is bad/broken?

Thanks,
//richard

=2D-=20
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
