Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLkO2-0006hq-TS
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 01:47:31 +0000
Received: by mail-ob0-f177.google.com with SMTP id wp18so4443952obc.22
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 18:47:09 -0700 (PDT)
Date: Mon, 16 Sep 2013 18:47:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: 4byte addressing mode on Micron n25q256a vs write enable
Message-ID: <20130917014706.GL4550@ld-irv-0074.broadcom.com>
References: <CAGWqfijpGuwqEh5oW8F=DFoQ=hG72ErMZge2cDsSjJZ=iD--kA@mail.gmail.com>
 <20130904011419.GA12654@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130904011419.GA12654@ld-irv-0074.broadcom.com>
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Elie,

On Tue, Sep 3, 2013 at 6:14 PM, Brian Norris <computersforpeace@gmail.com> wrote:
> On Thu, Aug 29, 2013 at 11:15:26AM +0200, Elie De Brauwer wrote:
>> I pulled a the " m25p80: Micron SPI uses Macronix-style 4-byte
>> addressing" from Linux-next (see (1) and (2) ) and applied it on my
>> 3.9 tree in order to get a Micron n25q256a (N25Q256A13ESF40F to be
>> complete) functional on custom board with an i.mx28.  The patch came
>> close to get this combination functional but it lacked something. If
>> we look at the n25q256a datasheet (3) page 68 contains in paragraph
>> "ENTER or EXIT 4-BYTE ADDRESS MODE Command" the following:
>>
>> <quote>
>> To enter or exit the 4-byte address mode, the WRITE ENABLE command
>> must be executed to set the write enable latch bit to 1. (Note: The
>> WRITE ENABLE command must NOT be executed on the N25Q256A83ESF40x and
>> N25Q256A83E1240x devices.) S# must be driven LOW. The effect of the
>> command is immediate; after the command has been executed, the write
>> enable latch bit is cleared to 0.
>> </quote>
>>
>> So with just your patch (1), (2) applied:
>>
>>   switch (JEDEC_MFR(jedec_id)) {
>>   case CFI_MFR_MACRONIX:
>> + case CFI_MFR_ST: /* Micron, actually */
>>   case 0xEF /* winbond */:
>>
>> The result is that the SPI flash does not enter 4byte mode. If I
>> however rework this patch as:
>>
>>   switch (JEDEC_MFR(jedec_id)) {
>> + case CFI_MFR_ST: /* Micron, actually */
>> + write_enable(flash);
>>   case CFI_MFR_MACRONIX:
>>   case 0xEF /* winbond */:
>>
>> It just-seems-to-work, but I have no idea how general this patch is
>> for other Micron devices which support the 4byte mode.
>
> Hmm, that's interesting. I overlooked the note about WRITE ENABLE, and
> it so happens I am working on the N25Q256A83ESF40x, so I am happily
> oblivious.
>
> Heeding the note in the quote there, though, I would hesitate to apply
> WRITE ENABLE to all Micron 4-byte addressed flash. I am contacting
> Micron about this unusual inconsistency, since it's not very easy to
> programmatically discover which Micron flash need WRITE ENABLE and which
> don't.

I have some word back from Micron. Apparently the A8 parts were made to
be compatible with Macronix, which didn't need the WREN command. They
will still accept the command fine, but it's not required.

They recommended that if we want to be generic to all types of Micron
flash, we should do the following sequence (to avoid leaving the flash
in a write-able state):

    WREN
    EN4B
    WRDI

So feel free to send a patch that does this sequence for all Micron SPI
flash.

Thanks,
Brian
