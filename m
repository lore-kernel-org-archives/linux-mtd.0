Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwFVF-0002Gl-6O
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 15:36:30 +0000
Date: Wed, 24 Aug 2011 17:36:24 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
In-Reply-To: <CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1108241709350.13510@lnxricardw.se.axis.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron> <20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
	<Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
	<CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 23 Aug 2011, Brian Norris wrote:

> On Mon, Aug 22, 2011 at 11:48 PM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
>>>>> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
>>>>>> 1) Broken "noecc" writes; `nandwrite -n -o' does not work on my
>>>>>> =A0 hardware, at least, without these patches
>>
>> This particular issue was fixed in a patch by Peter Wippich on June 6th:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2011-June/036016.html
>
> Right, I actually found this patch already and have it lined up in my
> test kernel, but apparently my issue is separate.
>
>> I could test patch 1 of this set to see if it accomplishes the same thin=
g,
>> but initially to me it seems that the issue has already been fixed, albe=
it
>> perhaps not pushed yet?
>
> I am now doubting that my fix will solve your problem like Peter
> Wippich's patch did. I believe the problem I am having is specifically
> related to my NAND controller's characteristics (how it handles ECC).
>
> So for hardware on which Peter's fix solves your problems, I suppose I
> would be interested mostly in seeing if my patch *breaks* your build.
> FYI, I already see an issue for those who use both the builtin
> `nand_write_page_raw()' and `nand_write_buf()' functions. It can be
> fixed if you amend my patch with the following. I can resend later,
> but test these for breakage if you can!

Ok. I tried applying patch #1 of your patch set, to a tree in which=20
Peter's patch has already been applying, to see what would happen. I had a=
=20
problem in that in the mtdchar.c I have it looks like this:

      memset(chip->oob_poi, 0xff, mtd->oobsize);
      nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
      status =3D chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
      memset(chip->oob_poi, 0xff, mtd->oobsize);

whereas your patch looks like it was made against a version which lacks=20
the memsets. First I thought it was because I was running an older kernel=
=20
(2.6.35), but I looked at HEAD of the linux-2.6 and mtd-2.6 trees at=20
git.infradead.org, and it's the same there. So I'm not sure exactly which=
=20
version your patch was made against. Perhaps it's obvious to someone but=20
not me right now.

Nevertheless, after applying the patch, as you suspected, using 'nandwrite=
=20
-o -n' fails, in this case the application hangs after outputting

Writing data to block 0

After applying the following patch from your email, 'nandwrite -o -n'=20
initially appears to work, however upon closer inspection the oob's of all=
=20
the written pages are all-ff, i.e. the oob's are never written.

> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1898,7 +1898,8 @@ out:
> static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *c=
hip,
>                                const uint8_t *buf)
> {
> -       chip->write_buf(mtd, buf, mtd->writesize);
> +       if (buf)
> +               chip->write_buf(mtd, buf, mtd->writesize);
>        chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> }
>

Now, this may all be nonsense as as I mentioned I'm not sure that I've had=
=20
the right version to start with. The memsets bug me, as they would explain=
=20
the all-ff's stuff, but I don't really feel like just experimenting.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
