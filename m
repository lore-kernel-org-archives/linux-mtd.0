Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzJln-0000i2-9B
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 03:50:47 +0000
Received: by pbbrq13 with SMTP id rq13so216370pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2012 20:50:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120807200044.GA9929@parrot.com>
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
 <20120711174309.GA25743@parrot.com>
 <CAEhpT-UMk0hiDaKAwn8GtS0B3HHRudbSUSHpZ68-i+LmMNH-=A@mail.gmail.com>
 <20120807200044.GA9929@parrot.com>
Date: Thu, 9 Aug 2012 09:20:43 +0530
Message-ID: <CAEhpT-VkFDoU+mzOsEiKUrB_N5smyP8_ynfTLN2ReUWT2i354g@mail.gmail.com>
Subject: Re: MLC NAND: all 0xff after erase?
From: Calvin Johnson <linux.cj@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Kevin Cernekee <cernekee@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Joel Reardon <reardonj@inf.ethz.ch>,
 "peter.barada@gmail.com" <peter.barada@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 8, 2012 at 1:30 AM, Ivan Djelic <ivan.djelic@parrot.com> wrote:
> On Tue, Aug 07, 2012 at 11:08:04AM +0100, Calvin Johnson wrote:
>> Hello Ivan,
>>
>>
>> >>Due to the nature of NAND bitflips, I cannot see how a NAND datasheet
>> >> could guarantee such a thing (what would be the duration of a "0xff
>> >> guarantee" anyway ?). In practice, bitflips do appear already on 34nm=
 SLC
>> >> devices, on blocks that have just been erased; hence I am not surpris=
ed
>> >> by your own findings on MLC devices.
>>
>>
>> Are these bit flips occurring due to power fluctuations while performing=
 program/erase as mentioned in http://www.linux-mtd.infradead.org/doc/ubifs=
.html#L_unstable_bits ?
>
> Hello Calvin,
>
> No, the bitflips I was referring to are not caused by an interrupted eras=
e or program operation.
> They just appear when reading back an erased block. They sometimes exhibi=
t a specific pattern: the same bit column is flipped on multiple
> pages in the same block.
>

Thanks a lot Ivan. From some experts, I got some more info about the
reason behind this behaviour. I'm sharing them below.

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------
The memory array is composed of strings of cells and numerous rows of
parallel selection lines.  When the array is being read these lines
are energized.  Granted, it is a low voltage.  But, as you know, any
electrical potential difference introduces the possibility of electron
migration.  At the current geometry technology, we=92re only storing
about 100 electrons on a gate (That=92s not a spec=92ed count).  If you
multiply even a small possibility times 16,000,000,000 bits and a
large number of reads, it=92s not unreasonable to expect an occasional
bit shift.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------
it is due to the fact that some bits are not well inside the
distribution of the programmed cells.
Some bits are not "substituted" because can be corrected by the ECC,
but when programmed they are in the edges of the distribution and can
be read differently.
Obviously this =93not screened=94 bits can be managed and corrected using
the specified ECC .
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------

best regards,
Calvin
