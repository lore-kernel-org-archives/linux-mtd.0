Received: from mail.kernelconcepts.de ([212.60.202.196])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz5QI-0006Sw-8d
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 10:22:35 +0000
Message-ID: <4C9C7BF0.1040701@kernelconcepts.de>
Date: Fri, 24 Sep 2010 12:22:40 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: NAND on MV78100
References: <4C9B0CE3.6040703@kernelconcepts.de>
	<alpine.LFD.2.00.1009231500430.13233@xanadu.home>
In-Reply-To: <alpine.LFD.2.00.1009231500430.13233@xanadu.home>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.09.2010 21:07, schrieb Nicolas Pitre:
> On Thu, 23 Sep 2010, Nils Faerber wrote:
>> I am currently working on board support for a Marvell MV78100 based
>> board. The MV78100 uses the same Orion SOC components as e.g. the
>> Kirkwood which is quite well supported from OpenRD and SheevaPlug.
>>
>> After some struggling I got the Orion NAND driver working, it detects
>> the NAND chip properly (512MB) and assigns a partition. Everything seems
>> OK so far.
>>
>> But when I read from the device, e.g. just by "cat /dev/mtdblock1 | wc
>> -c" it starts to fail with "uncorrectable error" after exactly 1MB
>> (1024*1024).
> 
> This is most likely due to a difference in the ECC model used.
> The quick "fix" would be to reformat the NAND (at least from the offset 
> where it fails) using the Linux supported 1-bit ECC.
> The Marvell LSPs (and most unfortunately the bootrom) are using a 
> 4-bit software ECC implementation that is poorly optimized, and layered 
> backward.

This could be the reason since the Marvell LSP kernel was used before on
this board.
Reformatting means flash_erase?
I was scared to hose my flash by wrongly erasing it so I tried reading
only first ;)

But after your assurance I tried to flash_eraseall one partition and see
- yeha, works!

Now I just might have another issue - since I do not know some of the
board's details like RAM timing and I do not have a proper JTAG setup I
do not want to touch the pre-installed Marvell-based U-Boot. But U-Boot
shall read the at least the kernel from the NAND. But I would guess that
since the ECC is different it will not work that easily?
Well, as fallback we still have a NOR flash which could hold the kernel.

Ah, just tried and see - the Marvell UBoot obviously ignores the ECC
when reading - perfect ;)

Thank you!

> Nicolas
Cheers
  nils

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Sieghuetter Hauptweg 48  Fax: +49-271-771091-19
D-57072 Siegen           Mob: +49-176-21024535
http://www.kernelconcepts.de
