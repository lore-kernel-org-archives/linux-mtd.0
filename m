Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LqlCR-0007w4-D6
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 09:33:10 +0000
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <1239010185.15222.29.camel@localhost.localdomain>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
	<20090326154142.GA15963@Chamillionaire.breakpoint.cc>
	<1238133332.3321.98.camel@localhost.localdomain>
	<20090405200744.GB10484@Chamillionaire.breakpoint.cc>
	<1239010185.15222.29.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Apr 2009 12:32:43 +0300
Message-Id: <1239010363.15222.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Jamie Lokier <jamie@shareable.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-04-06 at 12:29 +0300, Artem Bityutskiy wrote:
> On Sun, 2009-04-05 at 22:07 +0200, Sebastian Andrzej Siewior wrote:
> > >I can apply them if there are not complaints. But how you have
> > >tested them? I would not want to break 'flash_eraseall' once again :-)
> > understand. Nope, I do not have such flash. I got a bug report against
> > clean marker on a data flash and that is why I started looking into
> > this.
> 
> Well, I meant I did not find dependencies in flash_eraseall.
> 
> I think JFFS2 should be just fixed and should always use
> 12 bytes.

But well, I do not use JFFS2 and do not have time to delve into
that :-(

The only thing I can help you with is to try to review your userspace
changes and push them if they are fine :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
