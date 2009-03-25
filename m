Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmMgI-0006fU-Sm
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 06:33:49 +0000
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20090324085530.GA21444@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 Mar 2009 08:33:27 +0200
Message-Id: <1237962807.14602.99.camel@localhost.localdomain>
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

On Tue, 2009-03-24 at 09:55 +0100, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2009-03-24 08:05:27 [+0200]:
> 
> >On Mon, 2009-03-23 at 23:42 +0100, Sebastian Andrzej Siewior wrote:
> >> this is difficult because it depends on CONFIG_JFFS2_FS_WRITEBUFFER
> >> 
> >> Signed-off-by: Sebastian Andrzej Siewior <sebastian at breakpoint.cc>

It sounds wrong to me to make flash_eraseall depend on how JFFS2 is
compiled...

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
