Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPUh2-0002IW-Pb
	for linux-mtd@lists.infradead.org; Thu, 26 May 2011 07:09:20 +0000
Date: Thu, 26 May 2011 09:09:15 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
In-Reply-To: <20110525183154.GA20866@parrot.com>
Message-ID: <Pine.LNX.4.64.1105260907500.15966@lnxricardw.se.axis.com>
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
	<4DB14439.1050507@parrot.com>
	<Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
	<BANLkTik218nb1bnFL03UA3WYwh+=BQAXCA@mail.gmail.com>
	<20110525164107.GA16801@parrot.com>
	<0A40042D85E7C84DB443060EC44B3FD32A69415800@dekaexchange07.deka.local>
	<20110525183154.GA20866@parrot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	=?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Atlant Schmidt <aschmidt@dekaresearch.com>,
	Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 25 May 2011, Ivan Djelic wrote:

>>> <digression> ...
>>> And recent Micron devices do not store markers in flash; they just
>>> return 0x00 for any byte read in a bad block (instead of the real
>>> data), using an internal bad block table.
>>> </digression>
>> ...
> Note that the usual bad block detection still works on those Micron devic=
es.
> They just do not store markers in flash.
>
> You can still mark a block gone bad either by writing your own marker int=
o the
> block or (better) in a separate BBT. The internal Micron table is hard-wi=
red
> and only used to shortcut access to factory bad blocks AFAIK.

Does this also mean that if you for some reason screw up and mark lots of=
=20
(good) blocks as bad, you can just erase all blocks in the flash; the=20
factory-bad ones will refuse to be erased thanks to the on-chip bbt?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
