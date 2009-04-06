Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lql9e-0007f1-Qj
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 09:30:22 +0000
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20090405200744.GB10484@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
	<20090326154142.GA15963@Chamillionaire.breakpoint.cc>
	<1238133332.3321.98.camel@localhost.localdomain>
	<20090405200744.GB10484@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Apr 2009 12:29:45 +0300
Message-Id: <1239010185.15222.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-04-05 at 22:07 +0200, Sebastian Andrzej Siewior wrote:
> >I can apply them if there are not complaints. But how you have
> >tested them? I would not want to break 'flash_eraseall' once again :-)
> understand. Nope, I do not have such flash. I got a bug report against
> clean marker on a data flash and that is why I started looking into
> this.

Well, I meant I did not find dependencies in flash_eraseall.

I think JFFS2 should be just fixed and should always use
12 bytes.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
