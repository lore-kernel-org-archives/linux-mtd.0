Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LbryU-0004Lr-Jf
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2009 07:45:09 +0000
Subject: Re: [PATCH 1/2] flash_eraseall: remove support for clean markers
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20090223213600.GA15989@Chamillionaire.breakpoint.cc>
References: <20090223213600.GA15989@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Feb 2009 09:44:17 +0200
Message-Id: <1235461457.25808.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-02-23 at 22:36 +0100, Sebastian Andrzej Siewior wrote:
> clean markers are written by JFFS2 after mounting an empty flash media and
> are used to identify. This is done by the kernel while mounting an empty
> flash. The -j option should do the same thing after erasing a block.
> This patch rips it out since it seems to be broken and has no advantage over
> the kernel.
> 
> Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

Hmm... I used -j long time ago and it worked. Also I can understand the
benefits of this options. I'd be much happier to see a fix.

Sorry, but I won't push your patch. But dwmw2, tglx1, or jwb can do this
if they consider it necessary.

I think someone instead should dig this and realize what exactly went
broke, why, and how can we fix this.

A patch which just prints "This option is broken" would be accepted by
me.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
