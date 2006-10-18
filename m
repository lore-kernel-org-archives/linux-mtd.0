Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga6cH-0007F0-6P
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 04:17:42 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9I8HTP1017177
	for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2006 10:17:29 +0200
Date: Wed, 18 Oct 2006 10:18:45 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd-utils/nandwrite: what if write fails?
In-Reply-To: <1161099240.2975.3.camel@zod.rchland.ibm.com>
Message-ID: <Pine.LNX.4.64.0610181004040.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
	<1161099240.2975.3.camel@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="218815243-17548172-1161158861=:25906"
Content-ID: <Pine.LNX.4.64.0610181007440.25906@lnxricardw.se.axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--218815243-17548172-1161158861=:25906
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-1; FORMAT=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.LNX.4.64.0610181007441.25906@lnxricardw.se.axis.com>


On Tue, 17 Oct 2006, Josh Boyer wrote:

> On Tue, 2006-10-17 at 16:17 +0200, Ricard Wanderlof wrote:
>> ...
>> it isn't bad (using the MEMGETBADBLOCK ioctl). However, what happens if
>> the block goes bad during write? If the pwrite() call which writes out t=
he
>> page data fails, the application says perror() and exits. Shouldn't it
>> mark the block as bad, and re-write the data so far written to the block
>> to the next good block?
>> ..
>
> pwrite can fail because of a transient error.  NAND can get soft bit
> flips that can be cleared by erasing the block.  So to mark a block bad
> without at least trying to write to it a couple of times seems a bit
> drastic.

I see. Well, then in that case, a course of action would be to erase the=20
block, try to rewrite, and then mark it bad should pwrite still fail=20
after the second attempt?

Would another option be to erase each block immediately prior to writing=20
However, this wouldn't make it possible to write only part of a block, so=
=20
again, should not be the default behavior.

I'm curious about the 'soft bit flipping' though. I suppose both the case=
=20
of a bit going from 1->0 as well as 0->1 are possible? That would mean=20
that a previously erased block could contain random 0's, resulting in the=
=20
potential need for re-erase before writing.

Does anyone have a reference to more info on this subject? I've scanned=20
the 'net, but most of the hard-core information I've found to be in=20
application notes from various chip manufacturers. While informative, they=
=20
tend to be a bit restrictive on practical aspects of NAND flash=20
management.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-17548172-1161158861=:25906--
