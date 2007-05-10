Received: from mail.ipcas.de ([83.236.147.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hm2Wd-0003VQ-B1
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 02:53:21 -0400
Date: Thu, 10 May 2007 08:53:13 +0200
From: =?UTF-8?Q?Michael_K=C3=B6nig?= <Michael.Koenig@ipcas.de>
To: Hans-Christian Egtvedt <hcegtvedt@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
Message-ID: <AFDBC52C05E4EA53B68C61AD@franken3>
In-Reply-To: <1178718379.11554.34.camel@localhost.localdomain>
References: <D1CA5322EC0446D8F2053C9D@franken3>
	<B2FC9E5F094119A0F71B96EF@franken3>
	<1178718379.11554.34.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Hans-Christian...

> Is there a "fixup_convert_atmel_pri" function which

The function fixup_convert_atmel_pri() is present and is being called as=20
confirmed by a printk() I added to it.

> <quote>
> 	/* burst write mode not supported */
> 	cfi->cfiq->BufWriteTimeoutTyp =3D 0;
> 	cfi->cfiq->BufWriteTimeoutMax =3D 0;
> </quote>

I'm not sure what version of cfi_cmdset_0002.c you have, but those lines=20
are nowhere to be found in my copy and neither are they in the current GIT=20
revision:
<http://git.infradead.org/?p=3Dmtd-2.6.git;a=3Dblob_plain;f=3Ddrivers/mtd/ch=
ips/cfi_cmdset_0002.c>

> This will disable using the "cfi_amdstd_write_buffers" function.

To give it a try I removed my changes and added those two lines to=20
fixup_convert_atmel_pri(), but cfi_amdstd_write_buffers() and thus=20
do_write_buffer() are still being called.

>> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> //cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> /* Write Buffer Load */
>> map_write(map, CMD(0x25), cmd_adr);
>
> This is the standard "Word program" command, take a look on page 11 in
> the datasheet.

It would be if 0xA0 was present, but that's commented out in=20
do_write_buffer() and replaced by 0x25. That's a sequence I cannot find in=20
the Atmel documentation (and neither in the AMD/Spansion ones for that=20
matter), but as you point out do_write_buffer() shouldn't get called for=20
Atmel chips anyway.

> The Atmel device has a dual-word write function, but AFAIK AMD
> (Spansion) devices can write a lot more with a single command. Thus
> AT49BV642D can not use the default AMD command for buffer writes.

The funny thing is that do_write_buffer() never seems to write more than=20
two words (in my case 4 bytes), so I don't understand why the bypass mode=20
isn't used anymore like in a previous incarnation of the code.

> Sorry for a bit incomplete answer, but this flash device is working on
> the ATNGW100 kit from Atmel. So it should work for you as well.

You've certainly helped me to know for certain that do_write_buffer()=20
shouldn't get called for Ateml chips. But it confuses me that Atmel seems=20
to have a different code base than the GIT repository.

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
