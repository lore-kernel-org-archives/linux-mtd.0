Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5WPW-0003O2-Si
 for linux-mtd@lists.infradead.org; Thu, 18 Jun 2015 09:47:04 +0000
From: Kamil Debski <Kamil.Debski@imgtec.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: NAND/OneNAND/SPI NAND bad block management
Date: Thu, 18 Jun 2015 09:46:39 +0000
Message-ID: <616819EF2EBFD445AEF36EFF651655B6AB9336@hhmail02.hh.imgtec.org>
References: <616819EF2EBFD445AEF36EFF651655B6AB8BB1@hhmail02.hh.imgtec.org>
 <20150617172026.GF4917@ld-irv-0074>
In-Reply-To: <20150617172026.GF4917@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Ionela Voinescu <Ionela.Voinescu@imgtec.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 "peterpandong@micron.com" <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, Peter,

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: 17 June 2015 18:20
> To: Kamil Debski
> Cc: linux-mtd@lists.infradead.org; ezequiel@vanguardiasur.com.ar;
> kyungmin.park@samsung.com; peterpandong@micron.com; Ionela
> Voinescu
> Subject: Re: NAND/OneNAND/SPI NAND bad block management
>=20
> On Thu, Jun 11, 2015 at 03:57:00PM +0000, Kamil Debski wrote:
> > Hi,
>=20
> Hi!
>=20
> > I am currently working on the SPI NAND framework. I noticed that there
> > was quite a lot of discussion on this topic.
> >
> > It seems that the necessary task to do first is to make some
> > modification to the bad block management. It is necessary to separate
> > it from the NAND core, as the same bad block handling would be used by
> > the SPI NAND core.
> >
> > My question regarding this is following. OneNAND core also needs BBM
> > and implements it on its own. The design of BBM in OneNAND core is
> > very similar to NAND core - there are also two files onenand_base.c
> > and onenand_bbt.c.  The latter was actually derived from nand_bbt.c. I
> > am pretty sure OneNAND would be also benefit from using a generic BBM.
> > I did not find OneNAND mentioned in the previous discussion about
> > separating bad block management from the NAND core [1]. Was there any
> > reason why it was left out, or was it just overlooked?
>=20
> OneNAND development is essentially dead, AFAICT. I don't know if anyone
> still uses it, but I haven't really seen significant patches from anyone
> on that code in a long time. So I figure it's better to leave it alone,
> until someone actually has hardware to test and a desire to work on it.

I see. My idea was to separate all the possible common code to follow the
saying that less code is better. Though, you might be right that, it's bett=
er to
leave OneNAND alone.

> (I see you sent patches just recently; do you have hardware to test it?)

I have a device which used SPI NAND and can get my hands on a board with NA=
ND, but unfortunately I have no access to any boards with OneNAND. This may=
 be a good argument to keep out of OneNAND :)
=20
> > The file include/linux/mtd/bbm.h contains the struct bbm_info, which
> > seems as a good place to store the parameters and state of the BBM. I
> > am not sure about creating a new struct nand_bbt for that reason;
> > especially that struct bbm_info is already used by the OneNAND core.
> > I would go for embedding a struct bbm_info * in struct mtd_info, such
> > that it wouldn't be necessary to create wrappers.
>=20
> I suppose that's possible, but as I mentioned, we aren't really equipped
> to rework OneNAND at the moment, so it may be best to keep them
> separate.

Right.

> > I am working on the patches and should send them out soon. I am quite
> > new to mtd, so I am sure you'll have quite a few comments on this
> > topic and the patches :)
>=20
> Glad to see you interested in the topic. You might do best to comment
> on and/or test existing solutions, though, rather than rewrite them.

The thing is that I missed the recent patch by Peter Pan that you mentioned=
 below.

>=20
> > Best wishes,
> > Kamil Debski
> >
> > [1] http://lists.infradead.org/pipermail/linux-mtd/2015-
> January/057639.html
> >
> > Other useful links:
> > - previous attempt at the SPI NAND framework by Ezequiel Garcia
> > http://lists.infradead.org/pipermail/linux-mtd/2014-
> December/056763.html
> > - successive attempt at the SPI NAND framework by Peter Pan
> > http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
>=20
> You're missing Peter Pan's latest revision:
>=20
> http://lists.infradead.org/pipermail/linux-mtd/2015-May/059183.html
>=20
> I'd appreciate if you could make an argument why we should consider your
> solution instead of just focusing on his.

As I mentioned above - I missed the most recent patch by Peter Pan. No one =
mentioned this in reply to my previous email, thus I started to work on my =
patches :)

I had a browse through Peter Pan's code and it looks good. I would like to =
apply it on my development branch, however I have some trouble with this.

Peter, can you tell me which branch did you use as the base for your patch?=
 I tried applying to v4.0, v4.1-rc8 and master and nand_bbt branches on htt=
p://git.infradead.org/users/norris/linux-mtd.git.

>=20
> Regards,
> Brian

Best wishes,
Kamil Debski
