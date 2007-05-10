Received: from mail.ipcas.de ([83.236.147.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hm3HB-0004vQ-8h
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 03:41:27 -0400
Date: Thu, 10 May 2007 09:41:21 +0200
From: =?UTF-8?Q?Michael_K=C3=B6nig?= <Michael.Koenig@ipcas.de>
To: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
Message-ID: <AFE018322D1F5FB76327AACF@franken3>
In-Reply-To: <1178781348.11554.52.camel@localhost.localdomain>
References: <D1CA5322EC0446D8F2053C9D@franken3>	
	<B2FC9E5F094119A0F71B96EF@franken3>	
	<1178718379.11554.34.camel@localhost.localdomain>	
	<AFDBC52C05E4EA53B68C61AD@franken3>
	<1178781348.11554.52.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Hans-Christian...

> This is from the AVR32 GIT repository at
> git://www.atmel.no/~hskinnemoen/linux/kernel/avr32.git

That's the same fixup_convert_atmel_pri() apart from the two additional=20
lines you mentioned earlier.

> Strange... because it should never get added in the
> fixup_use_write_buffers() function. Could you check the ordering in
> cfi_fixup_table[]?
> fixup_convert_atmel_pri must be set _before_ fixup_use_write_buffers. I
> think that might be bogus upstream as well :(

Good call, those entries are the other way round:

static struct cfi_fixup cfi_fixup_table[] =3D {
#ifdef AMD_BOOTLOC_BUG
	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
#endif
	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
	{ CFI_MFR_AMD, 0x0055, fixup_use_secsi, NULL, },
	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi, NULL, },
	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi, NULL, },
	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi, NULL, },
#if !FORCE_WORD_WRITE
	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
#endif
	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
	{ 0, 0, NULL, NULL }
};

I moved "fixup_convert_atmel_pri" above "fixup_use_write_buffers" and now=20
it works like expected.

>> The funny thing is that do_write_buffer() never seems to write more than
>> two words (in my case 4 bytes), so I don't understand why the bypass
>> mode  isn't used anymore like in a previous incarnation of the code.
>
> Hmmm... interesting, perhaps we can add the dual word write support for
> the Atmel device but have a fixup which sets the last command according
> to the device.

At least my traces show that do_write_buffer() seems to be always called=20
with two words. I guess you'll have to do your own testing to confirm that.

> But changes like these should have been posted earlier.

Hopefully those changes will be posted soon, before someone else runs into=20
the same problem.

Thanks for your help; now I have a clean solution rather than my crude =
hack.

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen
Best regards
Michael K=C3=B6nig

ipcas GmbH
Wetterkreuz 17
91058 Erlangen, Germany
Tel.: +49 9131 7677-31
Fax: +49 9131 7677-78
mailto:Michael.Koenig@ipcas.de

Gesch=C3=A4ftsf=C3=BChrer: Dipl.-Ing. S. Sutiono
Sitz der Gesellschaft: Erlangen
Registergericht: F=C3=BCrth, HBR 3676
WEEE-Reg.-Nr. DE 77202473

Hinweis: Diese E-Mail und etwaige Anlagen k=C3=B6nnen Betriebs- oder
Gesch=C3=A4ftsgeheimnisse, dem Anwaltsgeheimnis unterliegen oder sonstige
vertrauliche Informationen enthalten. Sollten Sie diese E-Mail
irrt=C3=BCmlich erhalten haben, ist Ihnen der Status dieser E-Mail bekannt.
Bitte benachrichtigen Sie uns in diesem Fall sofort durch Antwort-Mail
und l=C3=B6schen Sie diese E-Mail nebst etwaigen Anlagen von Ihrem System.
Ebenso d=C3=BCrfen Sie diese E-Mail oder seine Anlagen
nicht kopieren oder an Dritte weitergeben. Vielen Dank.
