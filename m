Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQDtr-0008Dx-Hs
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 08:30:04 +0000
Received: by lbbgg6 with SMTP id gg6so2341772lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 01:30:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1205030928370.8107@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <4FA15C73.2020606@parrot.com>
 <CADZ6=aveZJx99GPBv=V0SvJ0jo4mGD0HaTKXYVcQa3SHADtmUw@mail.gmail.com>
 <Pine.LNX.4.64.1205030928370.8107@lnxricardw.se.axis.com>
Date: Fri, 4 May 2012 10:30:01 +0200
Message-ID: <CADZ6=auv4ecY1px-cDpuwUTp1_EfKrJbB+GReaSrvVS+e9ZorQ@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ricard,

>>> gluebi + mtdblock_ro doesn't work ?
>>
>>
>> Can you paint the abstraction layer call flow involved in this for a
>> single read transaction and _not_ burst out laughing ;) ? We're on an
>> embedded system, man :)
>
> The crucial issue is really what performance you get, gluebi is fairly
> transparent so I don't think you loose any significant amount. True, ther=
e's
> a lot of code that must be passed in order to get at the data, but the sa=
me
> is true for a lot of the kernel.

I fear the complexity. NAND technology has some nasty corner cases, I
want my NAND code to be simple and separated (KISS in the traditional
sense). Consequently I try to avoid these other parts of the kernel
that do things in a weird way, too.

> u-boot perhaps can't handle gluebi though?

Hmmm, dunno. I'm not using UBI from u-boot right now.

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
