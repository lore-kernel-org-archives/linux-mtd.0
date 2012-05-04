Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQDp4-0007ba-V5
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 08:25:08 +0000
Received: by lbbgg6 with SMTP id gg6so2338827lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 01:25:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1205030859020.8107@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <CADx9zJBwrSWbBQ0KbP-kr2CmYcLs5g3vn10VQdAp6qHwyQbJiw@mail.gmail.com>
 <CADZ6=av8TJJWRPsT=DrAnthZHO6iBzZ9nJMcHTiEV96TvgWkbA@mail.gmail.com>
 <Pine.LNX.4.64.1205030859020.8107@lnxricardw.se.axis.com>
Date: Fri, 4 May 2012 10:25:04 +0200
Message-ID: <CADZ6=as4exFqPWm-9D_KWNMeKVrak5aLuvO4Lm1sVvZr4UEHSQ@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hello Ricard,

(sorry for calling you "Richard" in the previous mails :-/ )

>>> Finally Ricard Wanderlof share his experience about bit flipping
>>> during reading and concluded that "At least for this chip [ST 256
>>> Mbit flash], it seemed that if a block has only been written a few
>>> times, then there seems to be virtually no limit to how many times it
>>> can be read without bit flips occurring ".
>>
>>
>> So the bit-rot-after-many-reads-issue is maybe a non-issue?
>
> It wasn't much of an issue when I ran tests on 256 Mbit flashes, but they
> are quite old by know, and starting to be EOL'd by manufacturers. Modern
> flashes have smaller on-chip geometries with physically smaller bit cells=
,
> and the chances of bits flipping is much greater, if nothing indicated by
> increased requirements in ECC strength. Sometimes the requirement changes
> have been subtle. For instance, for 256 Mbit flashes, most manufacturers
> specified the first block to be always good. For 1 Gbit flashes, this was
> changed to be a 'valid block up to 1k program/erase cycles with 1bit/512
> byte ECC', although the general ECC requirement was the same. Larger flas=
hes
> have 4 bit ECC requirements instead of the old 1 bit ECC, and as chip
> foundries migrate to small geometries older chips get reworked to suit
> modern manufacturing methods, and as a result they also get higher bitfli=
p
> probabilities and consequently severer ECC requirements.
>
> So, I would consider 'read disturb' as the phenomen is normally described=
 to
> be an issue which must be dealt with these days.

Oh, okay, thanks for the info, so we need to take care about bit rot,
too. I don't think this is too big a challenge.

Hey guys, I think I've got a bold idea. Could I re-use parts of UBI's
EB handling code in my readonly FTL? It depends on whether the erase
block scrubbing routines within UBIFS are generic enough to be used by
other components. Or whether the linux-mtd project is interested in
having these routines re-usable at some point in the future when they
are not re-usable right now.

Comments, suggestions?

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
