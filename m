Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQDXE-0006QF-UN
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 08:06:42 +0000
Received: by lbbgg6 with SMTP id gg6so2328239lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 01:06:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1205030855540.8107@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <Pine.LNX.4.64.1205030855540.8107@lnxricardw.se.axis.com>
Date: Fri, 4 May 2012 10:06:37 +0200
Message-ID: <CADZ6=avNF9e5-bG0O=jOm0kjV8XpgcY_JA1DV1RnvhQndN+Hcg@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

>> Apart from the fact that my NAND SW stack will then be two layers
>> higher than it actually needs to be (and the added complexity this
>> brings to boot loader and kernel) - =C2=A0as far as I know UBI does not
>> provide the functionality we require: being able to store a read-only
>> file system image, and mount it at boot time. At least we don't get
>> this without another boot step (initrd, see above).
>
>
> With a root file system in ubifs, you can boot directly with a root
> filesystem in UBI, with a kernel command line such as
>
> ubi.mtd=3D2 root=3Dubi0:rootfs rootfstype=3Dubifs
>
> I don't know how far back that was possible, you were using 2.6.27 were y=
ou
> not (in my case I'm using 2.6.35)?

This would work for me (since I'm on 2.6.37) but I deeply eschew the
complexity this approach would bring to our system. Don't get me wrong
- I really like UBIFS; we use it for application partitions. I just
don't think it's the right thing to use for a RO rootfs. I want
simple.

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
