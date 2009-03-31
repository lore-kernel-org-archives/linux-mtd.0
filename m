Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LoXQ5-00033A-LK
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 06:26:04 +0000
Subject: Re: [PATCH] ubi-utils: tweak vpath handling
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1238472580-4762-1-git-send-email-vapier@gentoo.org>
References: <1238472580-4762-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 31 Mar 2009 09:25:24 +0300
Message-Id: <1238480724.20906.7.camel@localhost.localdomain>
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

On Tue, 2009-03-31 at 00:09 -0400, Mike Frysinger wrote:
> Building out of tree currently fails with ubi-utils because make gets
> confused and can't figure out the vpathed .c files.  Using VPATH rather
> than vpath seems to work around it.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks for the patch!
 
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
