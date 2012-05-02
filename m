Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPTjA-0002Gt-HT
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 07:11:57 +0000
Received: by lagy4 with SMTP id y4so246584lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 00:11:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
Date: Wed, 2 May 2012 09:11:52 +0200
Message-ID: <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

ping?

> I'm on a TI embedded system on kernel 2.6.37. Could you please fill me
> in on the current state of readonly filesystems living in NAND flash
> w/ bad blocks? I've found several discussions on linux-mtd over the
> years[1][2][3] but none seemed to have reached a conclusion. The point
> is this, while both bootloader and nandwrite will happily skip bad
> blocks encountered upon image write the MTD driver's read function
> will not.
>
> This means I can safely write the root fs into a MTD partition, but I
> cannot read it back safely (let alone mount it). Is there a generic
> way to have the MTD driver auto-skip bad blocks? What happened to
> MTD_BLOCK_RO_BBFREE?
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2004-May/009672.html
> [2] http://lists.infradead.org/pipermail/linux-mtd/2004-May/009683.html
> [3] http://lists.infradead.org/pipermail/linux-mtd/2006-November/016835.h=
tml
>

Is no-one else using read-only filesystems in NAND flash w/ bad blocks
in it? Do I miss something obvious? Help?

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
