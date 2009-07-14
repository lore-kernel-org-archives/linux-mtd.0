Received: from snt0-omc2-s16.snt0.hotmail.com ([65.55.90.91])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQbEV-0005WJ-7P
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 06:11:25 +0000
Message-ID: <SNT121-W599BA236D8F485CFD021DB2230@phx.gbl>
From: "Laurent ." <sid6582@msn.com>
To: <dedekind@infradead.org>
Subject: RE: UBIFS Question
Date: Mon, 13 Jul 2009 23:11:17 -0700
In-Reply-To: <1247324158.20721.629.camel@localhost.localdomain>
References: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
	<1247324158.20721.629.camel@localhost.localdomain>
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem=2C

> OK. BTW=2C I've written a small article which should help people
> understand how UBI flashers should work=2C roughly:
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_format

Thanks.

For now=2C I am only going to use my flasher in factory=2C when the flash i=
s blank=2C
so I don't have to deal with erase counters.
However=2C your article will be useful when I will have to code
a firmware upgrader :-)

Related to the BBT and MTD in general=2C do I have to reserve a few blocks
outside the partitions=2C in case of one of the mirrored bbt goes bad ?
What does MTD do if it sees it could not update one of the two blocks ?
Does it grab a fresh block outside the partitions ? or can it pick a
block from anywhere (since that block won't be mark as 'good' anymore
anyways=2C it should not mess up with the partition) ?

>
> Take into account that if you have a power cut=2C then next mount will be
> slower than normal=2C because UBIFS will have to replay the journal and
> do recovery. So if mount time is critical=2C you may want to test it in
> power-cut conditions.
>

That's an important point for my application=2C I need fast mount time
( who does not anyways ? =3B-) )

However=2C I can assume that when the file system is going to be written to=
=2C
it is very unlikely that the user will power off the unit right away.
Then=2C I presume that I should be fine since I am going to use a
rather short (5 sec) dirty timeout ?

 From what you wrote about the sync=2C I should be able to write my code so
that I will greatly minimize the risk of power-off while the file system=20
s still "dirty" and there are still stuff to commit.
So=2C just to be sure=2C if the file system is dirty=2C and the time out oc=
cur and
all data are commited=2C it is safe to power off the unit and
next mount will be fast=2C correct ?

> Hmm=2C which version of mkfs.ubifs you use? I though the latest version
> would create an image with a reserve for the root. Try
> "mkfs.ubifs --version" please.

Version 1.3

> Depends of the system. I'd recommend something like 5 seconds
> for embedded systems.

OK. I presume that if there is nothing new "to commit"=2C
there is only very small overhead introduced every 5 seconds=2C correct ?

Well=2C thanks a lot for your detailed answered about that "ghost" file phe=
nomenon.
It all makes sense to me.

Regards=2C
Laurent

_________________________________________________________________
Hotmail=AE has ever-growing storage! Don=92t worry about storage limits.=20
http://windowslive.com/Tutorial/Hotmail/Storage?ocid=3DTXT_TAGLM_WL_HM_Tuto=
rial_Storage_062009=
