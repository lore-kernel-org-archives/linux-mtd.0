Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsFt0-0004OJ-6x
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 12:31:17 +0000
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Apr 2009 15:30:55 +0300
Message-Id: <1239366655.3390.14.camel@localhost.localdomain>
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

On Mon, 2009-03-23 at 23:42 +0100, Sebastian Andrzej Siewior wrote:
> this is difficult because it depends on CONFIG_JFFS2_FS_WRITEBUFFER
> 

So do you still support your patches? I think that if your patches

a. do not break anything
b. have at least some improvements, even if they do not work for all
cases

then we may just take them.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
