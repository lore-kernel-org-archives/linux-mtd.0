Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPcIm-00086N-BG
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 16:21:17 +0000
Received: by lagy4 with SMTP id y4so693566lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 09:21:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FA15C73.2020606@parrot.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <4FA15C73.2020606@parrot.com>
Date: Wed, 2 May 2012 18:21:12 +0200
Message-ID: <CADZ6=aveZJx99GPBv=V0SvJ0jo4mGD0HaTKXYVcQa3SHADtmUw@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Matthieu,

>> [ MTD read might return bad blocks ]
>>> I principally agree, however, jffs2 is doing just that, managing bad bl=
ocks.
>>> Whether that is a good idea or not is debatable of course. Technically =
it
>>> mixes up file system and device properties. Also, you might not plan to
>>> change read-only FS's very often so the effort might be quite minimal i=
n
>>> practice.
>>
>> It still feels like the wrong place to do this. Every FS would just
>> skip this block, and be done with it.
>
> There also bit-flip handling that ubi manage, but other fs don't handle.
> And with newer nand, bit-flip happen sooner.

You are right - during the conversation in this thread I learned that
bit flip can become another issue we will have to take care about. I
do not think bit flip / NAND scrubbing is an unsolvable issue. So I
postpone a solution to a later time. However, the problem we're trying
to fix right now is reading back what was written to an MTD. Which
does not work for us at all.

>> Apart from the fact that my NAND SW stack will then be two layers
>> higher than it actually needs to be (and the added complexity this
>> brings to boot loader and kernel) - =C2=A0as far as I know UBI does not
>> provide the functionality we require: being able to store a read-only
>> file system image, and mount it at boot time. At least we don't get
>> this without another boot step (initrd, see above).
>>
> gluebi + mtdblock_ro doesn't work ?

Can you paint the abstraction layer call flow involved in this for a
single read transaction and _not_ burst out laughing ;) ? We're on an
embedded system, man :)

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
