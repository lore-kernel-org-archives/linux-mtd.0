Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPr0v-0004wR-Ne
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 08:03:51 +0000
Received: by pbbrq13 with SMTP id rq13so2315906pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 01:03:48 -0700 (PDT)
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
From: Gregory CLEMENT <gclement00@gmail.com>
Date: Thu, 3 May 2012 10:03:28 +0200
Message-ID: <CADx9zJDL6dNnvvJuea=inXPBbW-zTtY4mxT5-0themvU=fGoQQ@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Thilo Fromm <fromm@dresearch-fe.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/5/3 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>
> On Wed, 2 May 2012, Thilo Fromm wrote:
>
>>> gluebi + mtdblock_ro doesn't work ?
>>
>>
>> Can you paint the abstraction layer call flow involved in this for a
>> single read transaction and _not_ burst out laughing ;) ? We're on an
>> embedded system, man :)
>
>
> The crucial issue is really what performance you get, gluebi is fairly
> transparent so I don't think you loose any significant amount.

Indeed with the direct approach we had with ubi_blk, the performance appear=
ed
to be _slightly_ better with ubiblk than gluebi+mtdblock_ro, according to o=
ur
 benchmarks (see  http://elinux.org/Flash_Filesystem_Benchmarks )


>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.com
> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 Fax +46 46 13 61 30
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Gregory CLEMENT
