Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRiaP-0007Fy-Db
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 11:28:10 +0000
Received: by laap9 with SMTP id p9so1669010laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 08 May 2012 04:28:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD3351F9CAE25@dekaexchange07.deka.local>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
 <CADZ6=atZPNM+1sXJngdkoWddHX0WzzPqyJPa4Fi2FuiOoaV9dg@mail.gmail.com>
 <Pine.LNX.4.64.1205041054400.27120@lnxricardw.se.axis.com>
 <CADZ6=as7Wz5TvGRbTa=6ydZMcBQHe2VRAPpxNy+3hFKApJEBzw@mail.gmail.com>
 <Pine.LNX.4.64.1205071145340.722@lnxricardw.se.axis.com>
 <CADZ6=atoFf46+U9xTbDh-7AniuTBsuAo2MWKLyeAn4oFa=xSFQ@mail.gmail.com>
 <Pine.LNX.4.64.1205080853310.27120@lnxricardw.se.axis.com>
 <CADZ6=as6DeHBpnTmamzaMDR-b8OgqYx=ZFwBLTB5wpKSLZH0ZQ@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CAE25@dekaexchange07.deka.local>
Date: Tue, 8 May 2012 13:28:06 +0200
Message-ID: <CADZ6=asTzz-Kj_5BkSeb_LZLfkYWDVpTF654AuRt9Ow=7E=iMA@mail.gmail.com>
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

Hello, Atlant,

>> Please keep in mind that re-write events (or even bit scrubbing)
>> should be extremely rare since, well, we're r/o.
>
> =C2=A0I'm not sure this assumption holds on modern NAND Flashes,
> =C2=A0especially for the highest-density, lowest-cost MLC (and
> =C2=A0now, even a few TLC!) devices. On these devices, the
> =C2=A0difference between bits is down to 20-30 electrons on
> =C2=A0the floating gate. These devices also have relatively
> =C2=A0high rates of "read disturb" errors so there can't be
> =C2=A0any such thing as a read-only Flash, only a read-mostly
> =C2=A0Flash.

You're right, and I consider this an important factoid that I learned
from this whole thread. As a result I aim to add very basic scrubbing
support to blockrom. I'm still convinced, however, that it can be done
with very few code at the r/o MTD level compared to r/w UBI. Plus I
consider having a generic r/o fs image "directly" in an MTD block
device a strong use case for embedded systems. So it may be worth the
trade-off of having to maintain slightly more code.

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
