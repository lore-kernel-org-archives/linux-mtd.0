Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SyglV-0006ZD-1X
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2012 10:11:53 +0000
Received: by pbbrq13 with SMTP id rq13so7549454pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2012 03:11:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120711174309.GA25743@parrot.com>
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
 <20120711174309.GA25743@parrot.com>
Date: Tue, 7 Aug 2012 15:41:50 +0530
Message-ID: <CAEhpT-XpdqD-CzZ2z8VuoQSSA2OTmNqEAVMWYaJaQiF19dqGfg@mail.gmail.com>
Subject: Re: MLC NAND: all 0xff after erase?
From: Calvin Johnson <linux.cj@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Kevin Cernekee <cernekee@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Joel Reardon <reardonj@inf.ethz.ch>,
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

Hello Ivan,

>
> >>Due to the nature of NAND bitflips, I cannot see how a NAND datasheet
> >> could guarantee such a thing (what would be the duration of a "0xff
> >> guarantee" anyway ?). In practice, bitflips do appear already on 34nm =
SLC
> >> devices, on blocks that have just been erased; hence I am not surprise=
d
> >> by your own findings on MLC devices.
>

Are these bit flips occurring due to power fluctuations while
performing program/erase as mentioned in
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits ?

If that is the case, I am observing a different problem with a MLC NAND fla=
sh.

I wrote 4K bytes of data and read back the same 4K several times. The
page size is 4K. I am NOT performing multiple erase/programs. Please
note that I am reading back the same data which sometimes matches
exactly what was written and sometimes does not, showing bit flips at
random locations.  I am not using any ECC to correct the bit errors,
which of course will be done later as I'm trying to understand this
problem.

Is this behavior expected in MLC NANDs? Is there any reference
document/links which discuss more about this?

I have read about  read disturb errors but as I understand it is a
permanent error.(http://www.klabs.org/richcontent/MemoryContent/nvmt_symp/n=
vmts_2002/docs/12/12_dan_p.pdf
)
---------------------------------------------------------------------------=
-------------------
Read Disturb Errors
The read disturb effect causes a page read operation to induce a
permanent, bit value change in one of the read bits. In BLC flash
technology based on a 0.16=CE=BC manufacturing
3 process, the typical read disturb error rate is on the order of 1
bit error per 106 repetitive reads of the page containing the bit.
Although MLC cells are more prone to such errors, the effect in actual
measurements is less severe than in program disturb errors. The
measured rate is on the order of 1 bit error per approximately 105
repetitive reads of the page.
---------------------------------------------------------------------------=
-------------------

Thanks,
Calvin
