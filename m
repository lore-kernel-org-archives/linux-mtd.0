Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LEgsJ-0004nD-LD
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2008 09:14:55 +0000
Date: Mon, 22 Dec 2008 10:14:46 +0100 (CET)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS option to make volume not do compression
In-Reply-To: <1229927039.2756.18.camel@sauron>
Message-ID: <Pine.LNX.4.64.0812221012350.12551@vixen.sonytel.be>
References: <mailman.11.1229706002.1545.linux-mtd@lists.infradead.org>
	<509116.73555.qm@web58907.mail.re1.yahoo.com>
	<1229927039.2756.18.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: Philip Rakity <prakity@yahoo.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 Dec 2008, Artem Bityutskiy wrote:
> On Sun, 2008-12-21 at 10:47 -0800, Philip Rakity wrote:
> > >From Documentation/filesystems/ubifs.txt:
> > 
> > >compr=none              override defoult comressor and set it to "none"
                                         ^       ^
				      default compressor

> > >compr=lzo               override defoult comressor and set it to "lzo"
> > >compr=zlib              override defoult comressor and set it to "zlib"
> > 
> > >Just make sure you use up-to-date UBIFS, because this was added
> > >recently. And I guess this should also be mentioned somewhere on the web
> > >site.
> > 
> > Source browsed the mtd git on the mtd website.  No references to the above in
> > the documentation.  Did I look at wrong git ?
> > 
> > An FAQ edit would be nice.
> 
> You may find the up-to-date ubifs.txt in the ubifs-2.6.git
> (see http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source) or
> in the current Linus's tree.

It's not in Linus' current tree.

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
