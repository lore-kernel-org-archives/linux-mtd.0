Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbpCT-00008C-3C
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 08:33:13 +0000
Date: Tue, 5 Jun 2012 10:33:02 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ran Shalit <ranshalit@gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
In-Reply-To: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 4 Jun 2012, Ran Shalit wrote:

> I read about cramfs and ubifs, but there is still something I don't
> understand here, I hope you can help me with that...
>
> 1. It seems reasonable that execution from RAM is faster then Nand flash.
>    So If I'm using ubifs, should I copy the executables to RAM before=20
> execute ?

Most systems can't execute directly from NAND flash, so that is not really=
=20
an option either way. In fact, since NAND flash cannot be mapped to an=20
address space, there is no way to directly execute from NAND flash,=20
however, one could imagine a system with some form of memory managment=20
scheme which buffers the data so that the flash appears to be directly=20
addressable. I don't know if there is such a system though; I've never=20
heard of one (but that's not saying much).

The 'copy to RAM' is nothing one normally has to worry about; all the=20
binaries are on the flash and loaded into RAM when run. Execute in place=20
is a special situation that must be explicitly enabled (and I'm very hazy=
=20
on that subject as I've never worked with it).

> 2. If there is no need for writable filesystem, cramfs seems a good
> choice, but some of the utilities write stuff to /var. How should we
> handle that with cramfs ?

You can create an empty /var directory and then mount a tmpfs on it during=
=20
boot.

> 3. in terms of boot time, both cramfs and ubifs are equal. is it correct=
=20
> ?

I don't know in the general case, but I did run some tests on our systems=
=20
a while ago and the boot times for ubifs and cramfs were essentially=20
identical. The main differences where that cramfs takes up less space (15=
=20
vs. 22 MB in our case), but for some reason there was more available=20
memory runtime, as it seems the Linux system used a lot of buffers with=20
cramfs that were not needed with ubifs - the difference was about 9 MB of=
=20
RAM. Didn't have time to investigate the latter fact further though.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
