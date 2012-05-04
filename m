Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQE9h-0001EK-R6
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 08:46:26 +0000
Received: by obqv19 with SMTP id v19so4538145obq.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 01:46:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADZ6=as4exFqPWm-9D_KWNMeKVrak5aLuvO4Lm1sVvZr4UEHSQ@mail.gmail.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <CADx9zJBwrSWbBQ0KbP-kr2CmYcLs5g3vn10VQdAp6qHwyQbJiw@mail.gmail.com>
 <CADZ6=av8TJJWRPsT=DrAnthZHO6iBzZ9nJMcHTiEV96TvgWkbA@mail.gmail.com>
 <Pine.LNX.4.64.1205030859020.8107@lnxricardw.se.axis.com>
 <CADZ6=as4exFqPWm-9D_KWNMeKVrak5aLuvO4Lm1sVvZr4UEHSQ@mail.gmail.com>
From: Gregory CLEMENT <gclement00@gmail.com>
Date: Fri, 4 May 2012 10:46:03 +0200
Message-ID: <CADx9zJB6x=ifbmcGA14HyjnStcGOY21xsB2g2WR00ANQ=Fp0OQ@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
To: Thilo Fromm <fromm@dresearch-fe.de>
Content-Type: text/plain; charset=ISO-8859-1
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

> Oh, okay, thanks for the info, so we need to take care about bit rot,
> too. I don't think this is too big a challenge.
>
> Hey guys, I think I've got a bold idea. Could I re-use parts of UBI's
> EB handling code in my readonly FTL? It depends on whether the erase
> block scrubbing routines within UBIFS are generic enough to be used by
> other components. Or whether the linux-mtd project is interested in
> having these routines re-usable at some point in the future when they
> are not re-usable right now.
>
> Comments, suggestions?

I think it's better to use UBI in a whole than just take most of its code.
Indeed UBI is better if it handles all the flash, at least for wear levelin=
g.

That one of the reason we choose to not continue to work on MTDBLCK_RO
and switch to ubi_blk.

>
> Regards,
> Thilo
>
> --
> Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
> Tel: +49 (30) 515 932 228 =A0 mailto:fromm@dresearch-fe.de
> Fax: +49 (30) 515 932 77 =A0 =A0http://www.dresearch.de
> Amtsgericht: Berlin Charlottenburg, HRB 130120 B
> Ust.-IDNr. DE273952058
> Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle



--=20
Gregory CLEMENT
