Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnUSf-0000rC-7n
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 02:55:14 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l4E6t4FP032519
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2007 08:55:04 +0200
Date: Mon, 14 May 2007 08:56:18 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: NAND flash write goes wrong
In-Reply-To: <200705112058.14662.borasah@gmail.com>
Message-ID: <Pine.LNX.4.64.0705140852340.3951@lnxricardw.se.axis.com>
References: <200705102150.31171.borasah@gmail.com>
	<200705111656.24216.borasah@gmail.com>
	<Pine.LNX.4.64.0705111621430.3951@lnxricardw.se.axis.com>
	<200705112058.14662.borasah@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 11 May 2007, borasah@gmail.com wrote:

>> Sorry, I didn't get it completely right last time. It is good practice t=
o
>> pad the image to a complete eraseblock size, but it shouldn't fill the
>> whole nand flash partition space available, in case there are bad blocks=
=2E
>
> Hmm, you say if the erase block size is 100, and the last part of the ima=
ge is
> 64, the remaining 36 should be padded with 0xFF, but all the other free o=
nes
> can remain as is?

If the partition has been erased, all the other free ones will also be=20
0xff.

> mkfs.jffs2 -p without SIZE does the above one or to the end of the NAND f=
lash?
> I think the first one...

Yes, it pads up to the next eraseblock. Again, if the partition was newly=
=20
erased, the rest of the partition will also contain 0xff.

>> So yes, it should be padded with -p, but not to the full size of the
>> partition, but a couple of eraseblocks less.
>
> You mean "NAND_size - erase_size * x"?

Yes.

>> -p specified to nandwrite should also work as it pads the image with 0xf=
f.
>
> Hmm. You dont have to specify -p to the mkfs.jffs2, nandwrite can also=20
> do it for you, right?

Yes.

>> Blocks (nand flash terminology rejects the name 'sectors' in favor of
>> 'blocks' and 'pages') can go bad with time, but we're talking about
>> thousands if not tens of thousands of erase/write cycles here. So it see=
ms
>> there's something wrong here.
>
> Yes, I think too. Now ~140 bad sector is reported during the boot. I just=
 did
> at most 50 read/write...

You sound far from wearing the chip out. There must be another problem=20
there somewhere.

>> There was a patch posted just a week or so ago here which fixed a proble=
m
>> with bad block marking and recognition when not using a flash-based bad
>> block table.
>
> I'm new to the list. Is this Artem's patch? I applied it, but no success.=
=2E.
> Maybe http://lists.infradead.org/pipermail/linux-mtd/2007-May/018087.html=
?

By Thomas Knobloch I believe, but yes, that's the patch I was thinking of.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
