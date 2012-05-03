Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPq9U-0003Q8-K6
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 07:08:37 +0000
Date: Thu, 3 May 2012 09:08:33 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
In-Reply-To: <CADZ6=av8TJJWRPsT=DrAnthZHO6iBzZ9nJMcHTiEV96TvgWkbA@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1205030859020.8107@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <CADx9zJBwrSWbBQ0KbP-kr2CmYcLs5g3vn10VQdAp6qHwyQbJiw@mail.gmail.com>
 <CADZ6=av8TJJWRPsT=DrAnthZHO6iBzZ9nJMcHTiEV96TvgWkbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: David Wagner <deubeuliou@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory CLEMENT <gclement00@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2 May 2012, Thilo Fromm wrote:

>> Finally Ricard Wanderlof share his experience about bit flipping
>> during reading and concluded that "At least for this chip [ST 256
>> Mbit flash], it seemed that if a block has only been written a few
>> times, then there seems to be virtually no limit to how many times it
>> can be read without bit flips occurring ".
>
> So the bit-rot-after-many-reads-issue is maybe a non-issue?

It wasn't much of an issue when I ran tests on 256 Mbit flashes, but they=
=20
are quite old by know, and starting to be EOL'd by manufacturers. Modern=20
flashes have smaller on-chip geometries with physically smaller bit cells,=
=20
and the chances of bits flipping is much greater, if nothing indicated by=
=20
increased requirements in ECC strength. Sometimes the requirement changes=
=20
have been subtle. For instance, for 256 Mbit flashes, most manufacturers=20
specified the first block to be always good. For 1 Gbit flashes, this was=
=20
changed to be a 'valid block up to 1k program/erase cycles with 1bit/512=20
byte ECC', although the general ECC requirement was the same. Larger=20
flashes have 4 bit ECC requirements instead of the old 1 bit ECC, and as=20
chip foundries migrate to small geometries older chips get reworked to=20
suit modern manufacturing methods, and as a result they also get higher=20
bitflip probabilities and consequently severer ECC requirements.

So, I would consider 'read disturb' as the phenomen is normally described=
=20
to be an issue which must be dealt with these days.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
