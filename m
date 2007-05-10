Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hm2sb-0004Zs-14
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 03:16:03 -0400
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: Michael =?ISO-8859-1?Q?K=F6nig?= <Michael.Koenig@ipcas.de>
In-Reply-To: <AFDBC52C05E4EA53B68C61AD@franken3>
References: <D1CA5322EC0446D8F2053C9D@franken3>
	<B2FC9E5F094119A0F71B96EF@franken3>
	<1178718379.11554.34.camel@localhost.localdomain>
	<AFDBC52C05E4EA53B68C61AD@franken3>
Content-Type: text/plain; charset=utf-8
Date: Thu, 10 May 2007 09:15:48 +0200
Message-Id: <1178781348.11554.52.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-05-10 at 08:53 +0200, Michael König wrote:
> Hello Hans-Christian...
> 
> > Is there a "fixup_convert_atmel_pri" function which
> 
> The function fixup_convert_atmel_pri() is present and is being called as 
> confirmed by a printk() I added to it.
> 
> > <quote>
> > 	/* burst write mode not supported */
> > 	cfi->cfiq->BufWriteTimeoutTyp = 0;
> > 	cfi->cfiq->BufWriteTimeoutMax = 0;
> > </quote>
> 
> I'm not sure what version of cfi_cmdset_0002.c you have, but those lines 
> are nowhere to be found in my copy and neither are they in the current GIT 
> revision:
> <http://git.infradead.org/?p=mtd-2.6.git;a=blob_plain;f=drivers/mtd/chips/cfi_cmdset_0002.c>

This is from the AVR32 GIT repository at
git://www.atmel.no/~hskinnemoen/linux/kernel/avr32.git

/* Atmel chips don't use the same PRI format as AMD chips */
static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
	struct cfi_pri_atmel atmel_pri;

	memcpy(&atmel_pri, extp, sizeof(atmel_pri));
	memset((char *)extp + 5, 0, sizeof(*extp) - 5);

	if (atmel_pri.Features & 0x02)
		extp->EraseSuspend = 2;

	if (atmel_pri.BottomBoot)
		extp->TopBottom = 2;
	else
		extp->TopBottom = 3;

	/* burst write mode not supported */
	cfi->cfiq->BufWriteTimeoutTyp = 0;
	cfi->cfiq->BufWriteTimeoutMax = 0;
}

It should have been pushed upstream, I will prod my co-worker.

> > This will disable using the "cfi_amdstd_write_buffers" function.
> 
> To give it a try I removed my changes and added those two lines to 
> fixup_convert_atmel_pri(), but cfi_amdstd_write_buffers() and thus 
> do_write_buffer() are still being called.

Strange... because it should never get added in the
fixup_use_write_buffers() function. Could you check the ordering in
cfi_fixup_table[]?

fixup_convert_atmel_pri must be set _before_ fixup_use_write_buffers. I
think that might be bogus upstream as well :(

> >> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> >> cfi->device_type, NULL);
> >> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> >> cfi->device_type, NULL);
> >> //cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi,
> >> cfi->device_type, NULL);
> >> /* Write Buffer Load */
> >> map_write(map, CMD(0x25), cmd_adr);
> >
> > This is the standard "Word program" command, take a look on page 11 in
> > the datasheet.
> 
> It would be if 0xA0 was present, but that's commented out in 
> do_write_buffer() and replaced by 0x25. That's a sequence I cannot find in 
> the Atmel documentation (and neither in the AMD/Spansion ones for that 
> matter), but as you point out do_write_buffer() shouldn't get called for 
> Atmel chips anyway.

I know, this is why the fixup for Atmel devices was added in the first
place.

> > The Atmel device has a dual-word write function, but AFAIK AMD
> > (Spansion) devices can write a lot more with a single command. Thus
> > AT49BV642D can not use the default AMD command for buffer writes.
> 
> The funny thing is that do_write_buffer() never seems to write more than 
> two words (in my case 4 bytes), so I don't understand why the bypass mode 
> isn't used anymore like in a previous incarnation of the code.

Hmmm... interesting, perhaps we can add the dual word write support for
the Atmel device but have a fixup which sets the last command according
to the device.

> > Sorry for a bit incomplete answer, but this flash device is working on
> > the ATNGW100 kit from Atmel. So it should work for you as well.
> 
> You've certainly helped me to know for certain that do_write_buffer() 
> shouldn't get called for Ateml chips. But it confuses me that Atmel seems 
> to have a different code base than the GIT repository.

We use GIT repository internally and push to the externally available
repository, and we do have some branches with drivers which are still in
review for submitting upstream.

But changes like these should have been posted earlier.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
