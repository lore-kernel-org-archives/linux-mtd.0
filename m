Received: from mail.newlogic.at ([194.208.88.201])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A0Ngv-0000pr-98
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2003 17:01:05 +0100
Message-Id: <200309191559.h8JFxoh4010270@enterprise2.newlogic.at>
MIME-Version: 1.0
In-Reply-To: <AF34F8F089D16B4FABE02B5F375228E00238@serveur21.SYNCHRO2>
Date: Fri, 19 Sep 2003 17:59:50 +0200 (MEST)
Sender: nwaibel@newlogic.com
From: Niki Waibel <niki.waibel@newlogic.com>
To: Yves CLOUSIER <yves.clousier@synchronic.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: uclinux-dev@uclinux.org
Subject: RE: Problem using DOC with mtd
Reply-To: Niki Waibel <niki.waibel@newlogic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I test your source code, and effectly my DOC was in reset mode. 
> So I had your source code in doccheck() function in docprobe.c and now
> doccheck read the chipID correctly :
>       
>               DiskOnChip Millennium found at address 0xE0000000
>               Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba
> TC58V64AFT/DC)
>               _DoC_WaitReady called for out-of-line wait
>               _DoC_WaitReady timed out.
>               _DoC_WaitReady called for out-of-line wait
>               _DoC_WaitReady timed out.
>               _DoC_WaitReady called for out-of-line wait
>               _DoC_WaitReady timed out.
>               1 flash chips found. Total DiskOnChip size: 8 MiB
>               mtd: Giving out device 0 to DiskOnChip Millennium
> 
> 
> I think that this code should be add to the cvs. What do you think about
> that Greg ? 

afaik the code in docprobe.c does that already.
the code snippies i sent you were from my userspace test prg...
(an extention to flash_rom.c from linuxbios)

maybe there is a timing issue missing in docprobe.c.
maybe you are using an old version...

i cannot say/help much, because the only doc i have
seems to be dead. i dont get:
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
i always get 55, 55 as manf id and chip id.
i am waiting for another doc (next week)...

niki



> -----Message d'origine-----
> De : Niki Waibel [mailto:niki.waibel@newlogic.com]
> Envoyé : mercredi 17 septembre 2003 16:38
> À : Yves CLOUSIER
> Cc : uclinux-dev@uclinux.org; linux-mtd@lists.infradead.org
> Objet : RE: Problem using DOC with mtd
> 
> 
> 
> On 17-Sep-2003 Yves CLOUSIER wrote:
>> Ok Niki, 
>> 
>> I made a mistake in the adressage of DOC. I think I have now a good dump
> of
>> DOC, see attach file, but I have always 00 at 0xE0001000.
> 
> DoC seems to be in reset mode...
> try this:
> ===
>#define doc_read(base,reg) \
>         (*(volatile unsigned char *)(base + MSYSTEMS_DOC_R_##reg))
>#define doc_write(data,base,reg) \
>         (*(volatile unsigned char *)(base + MSYSTEMS_DOC_W_##reg)) = data
>#define doc_read_nop(base) \
>         doc_read(base, NOP)
>#define doc_read_2nop(base) \
>         { doc_read_nop(base); doc_read_nop(base); }
>#define doc_read_4nop(base) \
>         { doc_read_2nop(base); doc_read_2nop(base); }
>#define MSYSTEMS_DOC_W__DOCControl                0x1002
>#define MSYSTEMS_DOC_R_NOP                        0x1020
>#define MSYSTEMS_DOC_W_NOP                        0x1020
>#define DOC_MODE_RESET  0
>#define DOC_MODE_NORMAL 1
>#define DOC_MODE_WREN   0x04
>#define DOC_CLR_ERR     0x80
> {
>         /* sets reset mode (has to be done twice) */
>         doc_write(DOC_MODE_RESET|DOC_MODE_WREN|DOC_CLR_ERR, bios,
> _DOCControl);
>         doc_write(DOC_MODE_RESET|DOC_MODE_WREN|DOC_CLR_ERR, bios,
> _DOCControl);
>         /* wait */
>         doc_read_4nop(bios);
>         /* sets normal mode (has to be done twic) */
>         doc_write(DOC_MODE_NORMAL|DOC_MODE_WREN|DOC_CLR_ERR, bios,
> _DOCControl);
>         doc_write(DOC_MODE_NORMAL|DOC_MODE_WREN|DOC_CLR_ERR, bios,
> _DOCControl);
>         /* wait */
>         doc_read_4nop(bios);
>         if(doc_wait(bios, 5000))
>                 return(-1);
> }
> static int
> doc_wait(volatile char *bios, int timeout)
> {
>         int i = 20;
>         unsigned char busy;
>         doc_read_4nop(bios);
>         while((busy=_doc_busy(bios)) && (i != 0))
>         {
>                 usleep(timeout*1000/20);
>                 i--;
>         }
>         doc_read_2nop(bios);
>         if(busy)
>         {
>                 return(-1);
>         }
>         return(0);
> } /* static int doc_wait(volatile char *bios, int timeout) */
> ===
> 
>> Any idea ? 
> 
> the above code snippies should give you an idea how to
> go out of the reset mode...
> 
> niki
> 
>> -----Message d'origine-----
>> De : Niki Waibel [mailto:niki.waibel@newlogic.com]
>> Envoyé : mercredi 17 septembre 2003 11:31
>> À : Yves CLOUSIER
>> Cc : uclinux-dev@uclinux.org; uclinux-dev@uclinux.org;
>> linux-mtd@lists.infradead.org
>> Objet : RE: Problem using DOC with mtd
>> 
>> 
>> Doc dump at e0000000 : 55 55 aa aa 10 10 eb eb
>> Doc dump at e0000008 : 3c 3c 00 00 00 00 28 28
>> Doc dump at e0000010 : 43 43 29 29 4d 4d 2d 2d
>> Doc dump at e0000018 : 53 53 79 79 73 73 74 74
>> Doc dump at e0000020 : 65 65 6d 6d 73 73 31 31
>> 
>> is somehow good, but you should have:
>> Doc dump at e0000000 : 55 aa 10 eb 3c 00 00 28
>>  ...
>> as well on 
>> Doc dump at e0001000 : 00 00 00 00 00 00 00 00
>> there should be
>> Doc dump at e0001000 : 30 ...
>> 
>> maybe this is at e0002000 in your case and you have mixed up
>> some address wires...
>> 
>> niki
>> 
>> 
>> 
>> On 17-Sep-2003 Yves CLOUSIER wrote:
>>> Hi all, 
>>> 
>>> I have 5272 plateform with the 20030305-uclinux-dist. 
>>> In this plateform I have a disk-on-chip millenium module MD2802-D08. The
>> DOC
>>> is map at 0xE0000000.
>>> 
>>> But during booting, I have the message :
>>> Possible DiskOnChip with unknown ChipID 00 found at 0xe0000000
>>> No recognised DiskOnChip devices found
>>> 
>>> In the Doc_Check() fonction in probe.c I make a memory dump of the DOC
>> (from
>>> 0xE0000000 to 0xE0002000), see the attach file.
>>> I think that the acces of the DOC is correct because I see the DOC bios
>>> singature at 0xE0000000. But I don't understand why the mtd doesn't
>>> recognised the DOC. So if you have an idea ......
>>> 
>>> 
>>> Thanks.
>>> 
>>> 
>>> 
>>> 
>>> 
>>> I configure the mtd like this :
[---cut---]
