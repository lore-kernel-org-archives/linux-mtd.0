Received: from mail.ipcas.de ([83.236.147.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HlmJJ-0003jA-07
	for linux-mtd@lists.infradead.org; Wed, 09 May 2007 09:34:30 -0400
Received: from localhost (unknown [127.0.0.1])
	by mail.ipcas.de (Postfix) with ESMTP id 65340A0110
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 May 2007 15:34:23 +0200 (CEST)
Received: from mail.ipcas.de ([127.0.0.1])
	by localhost (mail.ipcas.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP
	id 07571-05 for <linux-mtd@lists.infradead.org>;
	Wed,  9 May 2007 15:34:21 +0200 (CEST)
Received: from midgard.ipcas.de (firewall.ipcas.de [83.236.147.226])
	by mail.ipcas.de (Postfix) with ESMTP id EFA8AA010F
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 May 2007 15:34:20 +0200 (CEST)
Received: from franken3 (unknown [192.109.223.63])
	by midgard.ipcas.de (Postfix) with ESMTP id E329476C199
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 May 2007 15:34:20 +0200 (CEST)
Date: Wed, 09 May 2007 15:34:20 +0200
From: =?UTF-8?Q?Michael_K=C3=B6nig?= <Michael.Koenig@ipcas.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
Message-ID: <B2FC9E5F094119A0F71B96EF@franken3>
In-Reply-To: <D1CA5322EC0446D8F2053C9D@franken3>
References: <D1CA5322EC0446D8F2053C9D@franken3>
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

Hello again,

first of all, going through the GIT archive I found out that the=20
cfi_cmdset_0002.c in the latest Axis SDK must be the one from 2006-09-22,=20
since the last Atmel changes are present but the newest SST additions=20
aren't.

Through some testing I found out that do_write_one_word() works just fine,=20
and the main problem seems to be do_write_buffer().
To make it work without changing too much, I simply added a call to=20
do_write_one_word() in the beginning of do_write_buffer() and then return.=20
I'm sure it's less efficient that way, but I wanted to get it to work =
first.

Since the problem obviously is in do_write_buffer(), I wonder how this=20
command sequence works:

cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=20
cfi->device_type, NULL);
cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,=20
cfi->device_type, NULL);
//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi,=20
cfi->device_type, NULL);
/* Write Buffer Load */
map_write(map, CMD(0x25), cmd_adr);

I wasn't able to find that sequence either in the documentation of my Atmel =

chip, or in AMD or Spansion ones.
Is this some undocumented command sequence that isn't implemented by Atmel?
Why isn't the bypass mode used anymore?

Thanks in advance for any insights that might clear up this issue.

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
