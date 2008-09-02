Received: from wilson.telenet-ops.be ([195.130.132.42])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KaahQ-0003CP-Rr
	for linux-mtd@lists.infradead.org; Tue, 02 Sep 2008 18:33:57 +0000
Date: Tue, 2 Sep 2008 20:33:54 +0200 (CEST)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@linux-m68k.org
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0809022032310.17860@anakin>
References: <48AD00C4.6060302@gmail.com>
	<Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
	<6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
	<Pine.LNX.4.64.0808281737150.28552@vixen.sonytel.be>
	<Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
	<6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463808415-1548269925-1220380434=:17860"
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux Kernel Development <Linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>
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

---1463808415-1548269925-1220380434=:17860
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 2 Sep 2008, Jared Hulbert wrote:
> > However, there still are weird things going on, like `find' not seeing all
> > files and directories, or just aborting, and `ls -lR' showing actual file
> > contents in its output.
> 
> Do you see this behavior for all builds for just the PS3?

The `find' issue I saw on both PS3 (ppc64) and UML (ia32).
The `ls -lR' I tried on UML (ia32) only for now.

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
---1463808415-1548269925-1220380434=:17860--
