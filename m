Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxJWg-0006vg-4K
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 18:24:30 +0000
Received: by wifw1 with SMTP id w1so41076233wif.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 May 2015 11:24:06 -0700 (PDT)
Message-ID: <5564B97D.4090203@vanguardiasur.com.ar>
Date: Tue, 26 May 2015 15:20:45 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Johannes Bauer <weolanwaybqm@spornkuller.de>,
 Richard Weinberger <richard@nod.at>
Subject: Re: Wear-leveling peculiarities
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
 <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
 <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
 <555A4D38.3070702@spornkuller.de> <555A4FFB.5040006@nod.at>
 <f0e983ad35f8be37ef51686615017016@joe.dyn.spornkuller.de>
 <5564460D.6010209@nod.at>
 <fa1a37d3deb8876079963af7ddc0ff25@joe.dyn.spornkuller.de>
In-Reply-To: <fa1a37d3deb8876079963af7ddc0ff25@joe.dyn.spornkuller.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/26/2015 08:14 AM, Johannes Bauer wrote:
> Am 26.05.2015 12:08, schrieb Richard Weinberger:
> 
>> What flash is this?
>> I should not start dying that early.
> 
> To be honest, I have no idea. The problem is that the CPU is stacked on
> top of the NAND via package-on-package technlogoly. The whole component
> is supplied by a third party (and I've just scanned their documentation,
> which does not give any hints about the origin of the NAND). So I have
> no markings on the package (POP) and no documentation. The only thing I
> do have is dmesg:
> 
> omap2-nand driver initializing
> ONFI flash detected
> NAND device: Manufacturer ID: 0x20, Chip ID: 0xaa (ST Micro NAND 256MiB
> 1,8V 8-bit)
> 

According to this:

http://www.linux-mtd.infradead.org/nand-data/nanddata.html

0x20 0xaa is the ID of Numonyx/ST NAND02GXXX. Searching for the specs it
seems the device is SLC, so it's kind of unexpected that the default WL
value was wrong.

> Maybe there's a way to talk to the NAND directly and get some more
> identification, but I don't know how. Any hints? I'd happily provide clues.
> 

The ONFI specs talk about that (a quick "onfi spec pdf" search will do).
The ONFI specifies a paramter page which contains all the information
about the device (5.7.1. Parameter Page Data Structure Definition).

Keep us updated if you find why the flashes are dying :)
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
