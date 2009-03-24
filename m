Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llzk4-0003pg-1G
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 06:04:23 +0000
Subject: Re: [PATCH] flash_eraseall: only add cleanmarkers on known flashtypes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <1237874536.14602.93.camel@localhost.localdomain>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-3-git-send-email-sebastian@breakpoint.cc>
	<1237874536.14602.93.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Mar 2009 08:03:43 +0200
Message-Id: <1237874623.14602.94.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-03-24 at 08:02 +0200, Artem Bityutskiy wrote:
> On Mon, 2009-03-23 at 23:42 +0100, Sebastian Andrzej Siewior wrote:
> > +       switch (meminfo->type) {
> > +       case MTD_ROM:
> > +       case MTD_RAM:
> > +       case MTD_NORFLASH:
> >                 cleanmarker.totlen = cpu_to_je32(sizeof(struct
> > jffs2_unknown_node));
> > -       else {
> > -               struct nand_oobinfo oobinfo;
> > +               break;
> > +
> > +       case MTD_DATAFLASH:
> > +       case MTD_UBIVOLUME:
> > +               fprintf(stderr, "JFFS2 layout not supported on this
> > flash.\n");
> > +               return -1;
> > +               break;
> 
> This should also include MLC NAND flash. To make you nice patches
> even better you should call MEMGETOOBSEL ioctl in case of NAND and
> check if there is really enough bytes for clean-marker.
> 
> But I guess you do not have to do this.

Err, sorry, this seems to be already there :-) Need some coffee.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
