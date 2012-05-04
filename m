Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQDYv-0006Uw-EI
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 08:08:26 +0000
Received: by lbbgg6 with SMTP id gg6so2329395lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 01:08:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1336041737.13013.34.camel@sauron.fi.intel.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
 <1336041737.13013.34.camel@sauron.fi.intel.com>
Date: Fri, 4 May 2012 10:08:23 +0200
Message-ID: <CADZ6=avP-EgJ+UmcFB18S9mWOk7jk4jv+ZSM3SPVVc5Ee+_+VQ@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

>> =C2=A0 I can answer that one.
>>
>> =C2=A0 MTD "materializes" an imperfect block storage device. It contains
>> =C2=A0 m PEBs (Physical Erase Blocks) of n pages each. It can erase whol=
e
>> =C2=A0 PEBs, write pages, and read pages, but some of these pages are
>> =C2=A0 bad, other pages may go bad, and you have to be aware that you
>> =C2=A0 can wear out PEBs by repeated erasures.
>
> Nitpick: s/block device/flash device/ or something like this. Term block
> device has more or less standard meaning and neither MTD nor UBI devices
> are block devices:
>
> http://www.linux-mtd.infradead.org/faq/general.html#L_mtd_vs_hdd

Yes, and that's quite a problem. Thanks for clarification, Artem.

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
