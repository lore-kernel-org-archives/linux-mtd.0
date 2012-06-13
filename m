Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SehU7-0001IV-I3
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 06:55:20 +0000
Date: Wed, 13 Jun 2012 08:55:13 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ran Shalit <ranshalit@gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
In-Reply-To: <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
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


On Tue, 12 Jun 2012, Ran Shalit wrote:

>> Most systems can't execute directly from NAND flash, so that is not real=
ly
>> an option either way. In fact, since NAND flash cannot be mapped to an
>> address space, there is no way to directly execute from NAND flash, howe=
ver,
>> one could imagine a system with some form of memory managment scheme whi=
ch
>> buffers the data so that the flash appears to be directly addressable. I
>> don't know if there is such a system though; I've never heard of one (bu=
t
>> that's not saying much).
>>
>> The 'copy to RAM' is nothing one normally has to worry about; all the
>> binaries are on the flash and loaded into RAM when run. Execute in place=
 is
>> a special situation that must be explicitly enabled (and I'm very hazy o=
n
>> that subject as I've never worked with it).

> If I start several executable from ubifs in some start point, Is it
> right to assume that all of them are running in RAM, and there is no
> access to flash after this start point of execution ?

As someone else mentioned on the mtd list, Linux is demand paged which=20
means that the code is loaded into memory when needed. If there's a chunk=
=20
of code (Linux uses a page size of 4 kbytes so that's the granularity of=20
the paging) that is not used until after a while after the start of=20
execution, it won't be loaded until it is actually run.

I don't know if there's a way to force it all into memory when execution=20
starts; there probably is.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
