Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQD4T-0004wZ-Kf
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 07:36:58 +0000
Received: by lbbgg6 with SMTP id gg6so2311367lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 00:36:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
Date: Fri, 4 May 2012 09:36:54 +0200
Message-ID: <CADZ6=atZPNM+1sXJngdkoWddHX0WzzPqyJPa4Fi2FuiOoaV9dg@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
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

Hello Atlant,

thanks for your clarification. It really helps me with getting in
touch with all the MTD subsystem details.

>> I find this whole MTD / UBI thing, let alone UBIFS, incredibly blurry.
>> There seems to be no consequent abstraction between the "layers" mtd,
>> ubi, ubifs, let alone unique responsibilities for either of the
>> layers.
>
> =C2=A0I can answer that one.
>
> =C2=A0MTD "materializes" an imperfect block storage device. It contains
> =C2=A0m PEBs (Physical Erase Blocks) of n pages each. It can erase whole
> =C2=A0PEBs, write pages, and read pages, but some of these pages are
> =C2=A0bad, other pages may go bad, and you have to be aware that you
> =C2=A0can wear out PEBs by repeated erasures.

Then why do I still see this intermediate level materialize in /dev/?
Why do I need to do management tasks from user space on this level in
order to get UBI up and running? Why doesn't UBI wrap this? Legacy?

> =C2=A0UBI (on top of MTD) "materializes" a perfect block storage device.

UBI is a block device? Don't think so. I have got the impression UBI
is still something "special" which does not quite fit in the regular
Linux storage stack.

> =C2=A0It contains a maximum of m-fudge_factor LEBs (Logical Erase Blocks)
> =C2=A0of n-ovehead pages each. It can erase whole LEBs, write pages, and
> =C2=A0read pages. By providing bad block mapping and wear leveling, it
> =C2=A0provides a device which is slightly smaller than the MTD device
> =C2=A0it's layered upon, but that device doesn't have bad blocks and
> =C2=A0you can't wear out any individual LEB faster than the whole
> =C2=A0device wears out. The device remains perfect until its reserve
> =C2=A0of replacement (spare) blocks is exhausted as blocks go bad.

But unfortunately I can use these features with nothing else than UBIFS?

> =C2=A0UBIfs (on top of UBI on top of MTD) "materializes" a file system.
> =C2=A0It contains ordinary Linux/Unix files on a perfect storage medium.
> =C2=A0It depends upon the perfect storage provided by UBI.

I have the impression that we took a shortcut between the last two
paragraphs. Can you please elaborate on why i need a second UBI
partition within an UBI partition in order to use UBIFS? Or am I wrong
with this point?


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
