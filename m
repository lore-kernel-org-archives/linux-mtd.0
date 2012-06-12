Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeJ87-0006Jp-B8
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 04:55:00 +0000
Received: by laap9 with SMTP id p9so3604479laa.36
 for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2012 21:54:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
Date: Tue, 12 Jun 2012 07:54:54 +0300
Message-ID: <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
From: Ran Shalit <ranshalit@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
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

>>
>> 1. It seems reasonable that execution from RAM is faster then Nand flash=
.
>> =A0 So If I'm using ubifs, should I copy the executables to RAM before
>> execute ?
>
>
> Most systems can't execute directly from NAND flash, so that is not reall=
y
> an option either way. In fact, since NAND flash cannot be mapped to an
> address space, there is no way to directly execute from NAND flash, howev=
er,
> one could imagine a system with some form of memory managment scheme whic=
h
> buffers the data so that the flash appears to be directly addressable. I
> don't know if there is such a system though; I've never heard of one (but
> that's not saying much).
>
> The 'copy to RAM' is nothing one normally has to worry about; all the
> binaries are on the flash and loaded into RAM when run. Execute in place =
is
> a special situation that must be explicitly enabled (and I'm very hazy on
> that subject as I've never worked with it).
>
>

Hi Ricard,

If I start several executable from ubifs in some start point, Is it
right to assume that all of them are running in RAM, and there is no
access to flash after this start point of execution ?

Thank you very much,
Ran
