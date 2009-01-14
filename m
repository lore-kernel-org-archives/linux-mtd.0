Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN6Xh-000535-KX
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 14:16:38 +0000
Date: Wed, 14 Jan 2009 14:48:04 +0100 (CET)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: =?UTF-8?B?0JDRgNGC0ZHQvCDQkdC40YLRjtGG0LrQuNC5?= <dedekind@infradead.org>
Subject: Missing ioctl32 for ubi
Message-ID: <Pine.LNX.4.64.0901141432590.27302@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hi Артём,

When running ubimkvol (32-bit userland) on a PS3 (ppc64), I get:

| # ubimkvol /dev/ubi0 -N test -s 200MiB
| ubimkvol: error!: cannot UBI create volume
|           error 22 (Invalid argument)
| #

and in the kernel log:

| ioctl32(ubimkvol:2207): Unknown cmd fd(3) cmd(80986f00){t:'o';sz:152} arg(ff88a888) on /dev/ubi0

This is on 2.6.29-rc1+.

Спасибо!

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
