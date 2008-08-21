Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBvL-0002Yb-Jb
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 15:18:07 +0000
Date: Thu, 21 Aug 2008 17:18:06 +0200 (CEST)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
In-Reply-To: <200808211706.37761.arnd@arndb.de>
Message-ID: <Pine.LNX.4.64.0808211716280.20704@vixen.sonytel.be>
References: <48AD00F8.1030004@gmail.com> <200808211339.37187.arnd@arndb.de>
	<6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
	<200808211706.37761.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-584349381-2097915047-1219331886=:20704"
Cc: linux-embedded@vger.kernel.org, carsteno@de.ibm.com,
	=?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-2097915047-1219331886=:20704
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 21 Aug 2008, Arnd Bergmann wrote:
> On Thursday 21 August 2008, Jared Hulbert wrote:
> 4) no profiling at all
> The profiling code has certainly been useful to you during development,
> and you should keep that code around for your own work on it,
> but maybe you should not push that upstream, because regular users
> are not going to need it.

The profiling is needed to feedback into mkfs.axfs, to decide which pages to
make XIP (in NOR) or not (in NAND). So yes, normal users need it when creating
file systems for a mixed NOR/NAND FLASH system.

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
---584349381-2097915047-1219331886=:20704--
