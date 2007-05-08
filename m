Received: from mail.ipcas.de ([83.236.147.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HlPNA-0003DK-50
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 09:04:57 -0400
Date: Tue, 08 May 2007 15:04:51 +0200
From: =?UTF-8?Q?Michael_K=C3=B6nig?= <Michael.Koenig@ipcas.de>
To: Vitaly Wool <vitalywool@gmail.com>
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
Message-ID: <D6B9D8921EDF6299768B8F76@franken3>
In-Reply-To: <acd2a5930705080449q2930ad50n521b70263d1c2fdb@mail.gmail.com>
References: <D1CA5322EC0446D8F2053C9D@franken3>
	<acd2a5930705080449q2930ad50n521b70263d1c2fdb@mail.gmail.com>
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

Hello Vitaly

>> cse0: Probing a 0x04000000 bytes large window at 0xe0000000.
>
> that's b/c you're supplying too large a window, but that's harmless
> AFAICS.

Strange, I don't think I'm supplying that window size anywhere, so it must=20
be some preset range by Axis. I just took a look at the output of a device=20
with a smaller Flash and it was the same window.

>> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000044)
>
> I'd check if you have the right width set up first.

Both kernelconfig files have the following settings for the Flash:
CONFIG_ETRAX_FLASH_BUSWIDTH=3D2
CONFIG_ETRAX_FLASH1_SIZE=3D8

The kernelconfig for Linux 2.6 also adds CONFIG_ETRAX_NANDFLASH_BUSWIDTH,=20
which was set to 1. I didn't think it would matter, since we don't have=20
NAND Flashes, just NOR ones. I set it to 2 as well, just to see what=20
happens, but I still have the same behaviour.

To be totally sure, I changed the FLASH_BUSWIDTH to 1 and still have the=20
same effects. It's a bit strange, I didn't expect it to work at all.

It still bugs me that I cannot find the command sequence that is used in=20
do_write_buffer() in my Atmel documentation.

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
