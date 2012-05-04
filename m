Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQENN-0002rk-EU
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 09:00:34 +0000
Received: by lagy4 with SMTP id y4so2340935lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 02:00:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADx9zJB6x=ifbmcGA14HyjnStcGOY21xsB2g2WR00ANQ=Fp0OQ@mail.gmail.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <CADx9zJBwrSWbBQ0KbP-kr2CmYcLs5g3vn10VQdAp6qHwyQbJiw@mail.gmail.com>
 <CADZ6=av8TJJWRPsT=DrAnthZHO6iBzZ9nJMcHTiEV96TvgWkbA@mail.gmail.com>
 <Pine.LNX.4.64.1205030859020.8107@lnxricardw.se.axis.com>
 <CADZ6=as4exFqPWm-9D_KWNMeKVrak5aLuvO4Lm1sVvZr4UEHSQ@mail.gmail.com>
 <CADx9zJB6x=ifbmcGA14HyjnStcGOY21xsB2g2WR00ANQ=Fp0OQ@mail.gmail.com>
Date: Fri, 4 May 2012 11:00:29 +0200
Message-ID: <CADZ6=as2ecP0O+WXN-UJfYTWbaMjMSr1-cdpWghne_P-A9zmNg@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Gregory CLEMENT <gclement00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Wagner <deubeuliou@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Gregory,

>> Oh, okay, thanks for the info, so we need to take care about bit rot,
>> too. I don't think this is too big a challenge.
>>
>> Hey guys, I think I've got a bold idea. Could I re-use parts of UBI's
>> EB handling code in my readonly FTL? It depends on whether the erase
>> block scrubbing routines within UBIFS are generic enough to be used by
>> other components. Or whether the linux-mtd project is interested in
>> having these routines re-usable at some point in the future when they
>> are not re-usable right now.
>>
>> Comments, suggestions?
>
> I think it's better to use UBI in a whole than just take most of its code=
.

I wouldn't "take" it so much as write another component which uses it.
Which should improve the code overally :) And I don't think I need
most of it.

> Indeed UBI is better if it handles all the flash, at least for wear level=
ing.

I don't need wear leveling, I'm readonly.

> That one of the reason we choose to not continue to work on MTDBLCK_RO
> and switch to ubi_blk.

I fully understand this decision. It's just that I don't need (and
frankly, don't want) all that code, especially the read/write parts of
it, for my root fs. I would run into trouble with our (old-ish)
u-boot, too.

On the other hand ubi_blk would be a good choice community-wise, so we
would better integrate with the current ongoing development in
linux-mtd. That's another strong advantage. I'll focus on "blockrom"
for now (as this seems to be the device node's LANANA name, see
Documentation/devices.txt), since blockrom seems to offer everything
we need with just a few extensions we have to add. But I'll definitely
keep ubi_blk in mind.

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
