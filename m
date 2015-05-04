Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpGc3-0003zA-0D
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 13:40:47 +0000
Received: by wicmx19 with SMTP id mx19so77706197wic.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2015 06:40:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201505041535.29878.marex@denx.de>
References: <cover.1430430153.git.hramrach@gmail.com>
 <201505041412.46195.marex@denx.de>
 <CAOMqctTL3Kg8M-wqb935+awpPCFKHHUuAUr7fe-B52nqcD+-=g@mail.gmail.com>
 <201505041535.29878.marex@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 4 May 2015 15:39:44 +0200
Message-ID: <CAOMqctTwrN3onS0EuW1ZB0ZDcw4X+WrKwnFbYizPpwXY8cCLWQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>, Rafa?? Mi??ecki <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 May 2015 at 15:35, Marek Vasut <marex@denx.de> wrote:
> On Monday, May 04, 2015 at 03:18:56 PM, Michal Suchanek wrote:
>> On 4 May 2015 at 14:12, Marek Vasut <marex@denx.de> wrote:
>> > On Monday, May 04, 2015 at 01:11:03 PM, Michal Suchanek wrote:
>> >>
>> >> It mentions both
>> >> 32KB Block Erase (BE) (52H)
>> >> and
>> >> 64KB Block Erase (BE) (D8H)
>> >
>> > The SPI NOR framework will use 0xbe opcode, no problem.
>> >
>> >> So the chip probably tries its best to be compatible with any command
>> >> set and this last patch is not needed. The memory organization table
>> >> on page 7 is not all that reassuring, though.
>> >
>> > Which exact part do you refer to please ?
>>
>> Start of page 7 where it says sector size 32/64K in either datasheet.
>>
>> It can refer to both BE opcode variants being supported but it's quite
>> unclear.
>
> My guess here would be that the internal organisation of the SPI NOR is
> in 4k blocks, which is no surprise really. My understanding is that opcode
> 0x52 erases 8x4k sector (ie. 32k of data) while 0xd8 erases 16x4k sector
> (ie. 64k of data). I don't see any problem here -- there are two different
> opcodes which do two different things and their behavior matches the one on
> various other SPI NORs.
>
>> Write protection seems to be calculated in 4k sectors and not blocks
>> so the block size does not seem very relevant.
>
> See above. Does it make sense now please ?
>

Yes,

makes sense.

Thanks

Michal
