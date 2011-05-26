Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPUfT-0002GZ-Dn
	for linux-mtd@lists.infradead.org; Thu, 26 May 2011 07:07:40 +0000
Date: Thu, 26 May 2011 09:07:36 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
In-Reply-To: <20110525164107.GA16801@parrot.com>
Message-ID: <Pine.LNX.4.64.1105260901290.15966@lnxricardw.se.axis.com>
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
	<4DB14439.1050507@parrot.com>
	<Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
	<BANLkTik218nb1bnFL03UA3WYwh+=BQAXCA@mail.gmail.com>
	<20110525164107.GA16801@parrot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
	Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 25 May 2011, Ivan Djelic wrote:

> Here is a relevant excerpt from a 2004 STM application note (AN1819):
>
>  RECOGNIZING BAD BLOCKS
>  The devices are supplied with all the locations inside valid blocks
>  erased (FFh). The Bad Block Information is written prior to shipping.
>  For 528 Byte/256 Word Page (NANDxxx-A) devices, any block where the
>  6th Byte/ 1st Word in the spare area of the 1st page does not contain
>  FFh is a Bad Block.  For 2112 Byte/1056 Word Page devices, any block,
>  where the 1st and 6th Bytes, or 1st Word, in the spare area of the 1st
>  page, does not contain FFh, is a Bad Block.
> ...
> <digression>
> The above note is probably not applicable to recent devices. Because bitf=
lips
> are much more likely to appear, saying that a specific byte marks a bad b=
lock
> if it "does not contain FFh" it not realistic. ONFI 2.2 clarifies the iss=
ue and
> states that a marker is 0x00, not just a byte that "does not contain FFh"=
=2E
> And recent Micron devices do not store markers in flash; they just return=
 0x00
> for any byte read in a bad block (instead of the real data), using an int=
ernal
> bad block table.
> </digression>

I'm probably wrong here, but I just want to throw this thought into the=20
pot: I always thought that the reason for the 'not contain FFh' phrasing=20
was that there could be something physically wrong in a bad block so that=
=20
some bits could not be programmed to 0. Saying 'not contain FFh' would be=
=20
a way of saying 'we try to set all bytes to 0 but if for some reason some=
=20
bits are stuck at 1 still treat a non-FFh word as a bad block marker'.

This of course does not harmonize with ONFI 2.2. It's just me trying to=20
read between the lines of the specs.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
