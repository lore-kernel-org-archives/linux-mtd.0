Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GazZy-00009N-4g
	for linux-mtd@lists.infradead.org; Fri, 20 Oct 2006 14:58:56 -0400
Date: Fri, 20 Oct 2006 21:00:03 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't work
	when flash-based bbt not enabled
In-Reply-To: <1161359478.3260.155.camel@sauron>
Message-ID: <Pine.LNX.4.64.0610202045550.15558@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610201728220.25906@lnxricardw.se.axis.com>
	<1161359478.3260.155.camel@sauron>
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


On Fri, 20 Oct 2006, Artem Bityutskiy wrote:

> On Fri, 2006-10-20 at 17:36 +0200, Ricard Wanderlof wrote:
>>   =09=09ofs +=3D mtd->oobsize;
>> -=09=09chip->ops.len =3D 2;
>> +=09=09chip->ops.ooblen =3D 2;
>>   =09=09chip->ops.datbuf =3D NULL;
>>   =09=09chip->ops.oobbuf =3D buf;
>>   =09=09chip->ops.ooboffs =3D chip->badblockpos & ~0x01;
>
> What is len and ooblen? Who initializes len then? I see len is used
> later on.

As I understand it, ops.len is the length of the ops.datbuf, and=20
ops.ooblen is the length of the ops.oobbuf. In this case, we want to write=
=20
two zeros to the OOB area, so we want to set ops.ooblen to 2, not ops.len.=
=20
This is the way the function nand_fill_oob, further on in the call chain,=
=20
expects to find the length of the data.

Hm, looking more carefully in the next function called, nand_do_write_oob,=
=20
len _is_ used, however, I'm not sure that is correct. It is used in three=
=20
cases, first in a debug printout (which incidentally displays the wrong=20
function name), in a sanity check, and finally to set the return value. If=
=20
you look at nand_fill_oob (called from nand_do_write_oob) it uses (only)=20
ops.ooblen as the length counter. chip->ecc.write_oob is by default=20
nand_write_oob_std, and always writes the whole oob area.

While testing the patch, I put some debugging printouts in nand_fill_oob.=
=20
I could see other cases where it was being called correctly, i.e. with=20
ops.ooblen set, e.g. when writing JFFS2 cleanmarkers. So I'm assuming that=
=20
it is ops.ooblen that should be set, and that the references to ops.len in=
=20
this call chain are not correct.

I'll test this on Monday when I get back to work; I don't have access to a=
=20
machine to test on right now.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
