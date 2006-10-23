Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GbxIt-0003Rq-Rw
	for linux-mtd@lists.infradead.org; Mon, 23 Oct 2006 06:45:17 -0400
Date: Mon, 23 Oct 2006 12:46:31 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't work
	when flash-based bbt not enabled
In-Reply-To: <1161597141.19446.276.camel@pmac.infradead.org>
Message-ID: <Pine.LNX.4.64.0610231221260.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610230928360.25906@lnxricardw.se.axis.com>
	<1161597141.19446.276.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 23 Oct 2006, David Woodhouse wrote:

> On Mon, 2006-10-23 at 09:33 +0200, Ricard Wanderlof wrote:
>> (As note, it seems to be that logically, it shouldn't be necessary to se=
t
>> both length variables, as one appears to be for the main buffer, and
>> one for the oob buffer, but this is how it is done in several places,
>> including the code for the mtd character device MEMWRITEOOB and MEMREADO=
OB
>> ioctls. I'm not sure if this is a temporary solution during some rework =
of
>> the mtd infrastructure, or whether there is a deeper thought here.)
>
> Hm. That seems wrong to me. If we don't want to read or write the main
> area, we should set ops.len to zero. And if that doesn't work, it should
> probably be fixed.
>
> I'd rather see a patch which fixes that.

It definitely seems confusing.

There are however several places where both ops->len and ops->ooblen are=20
used together in some combination, not only in the mtdchar.c ioctl code.=20
For instance, in nand.c:nand_do_read_oob() the variable readlen is=20
initialized with ops->len, but in the actual read loop, it is decremented=
=20
with ops->ooblen.

The structure using the ops struct was introduced 2006-05-29 by tglx=20
(commit titled 'Rework the out of band handling completely').

Since the code as it stands seems to work (apart from the aformentioned=20
markbad issue), I'd rather not dive too deep without more information=20
about exactly how the ops->len and ops->ooblen fields are supposed to=20
interact.

I'd still like to submit the patch, pending a potential clean up of the=20
len/ooblen issue, because without the patch, bad block marking fails (in=20
certain cases), whereas it works with the patch, and the way len/ooblen is=
=20
handled seems consistent with other uses.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
