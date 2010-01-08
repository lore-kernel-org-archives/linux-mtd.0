Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGsC-0002fE-Ke
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:35:41 +0000
Received: by fxm22 with SMTP id 22so21953798fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 07:35:35 -0800 (PST)
Subject: Re: [PATCH 9/9] mtd: Add new SmartMedia/xD FTL
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20100108152945.GC31872@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
	<1262963524.12577.23.camel@maxim-laptop>
	<20100108152945.GC31872@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Jan 2010 17:35:31 +0200
Message-ID: <1262964931.12577.34.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-08 at 16:29 +0100, Jörn Engel wrote: 
> On Fri, 8 January 2010 17:12:04 +0200, Maxim Levitsky wrote:
> > 
> > This implements new readwrite SmartMedia/xd FTL.
> > 
> > It depends on nand driver to define proper oob layout that excludes
> > all ecc areas and nothing more.
> > 
> > Support for very old 256 byte/page devices is not yet enabled/complete.
> > For these devices, all ecc handling will be done inside this FTL
> > due to wierd oob layout.
> > 
> > Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
> > ---
> >  drivers/mtd/Kconfig  |   12 +
> >  drivers/mtd/Makefile |    1 +
> >  drivers/mtd/sm_ftl.c | 1043 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/mtd/sm_ftl.h |   75 ++++
> 
> sm_ftl is certainly nicer than ssfdc.c - at least I can decrypt the
> acronym.  But I am missing a reason why ssfdc is not sufficient and we
> need yet another implementation of the same ftl.
ssfdc is readonly, and bulk of the hard work is the write part.
Also ssfdc creates one big table by reading oob of whole device and this
takes about 1 second here.
I instead defer this by doing it one per zone.

Ideally ssfdc can be deprecated/removed, since my driver is its
superset.
However if one needs only R/O support he can use the smaller and safer
ssfdc.c

I also though about patching the ssfdc.c, but really there will be
nothing old left after doing that.

Best regards,
Maxim Levitsky
