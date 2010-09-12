Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ouhcf-0001xB-7m
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 08:09:15 +0000
Received: by bwz13 with SMTP id 13so4741628bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 01:09:12 -0700 (PDT)
Subject: Re: [PATCH] old ubi-utils: drop -Werror
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1284263293-31064-1-git-send-email-vapier@gentoo.org>
References: <1284263293-31064-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 12 Sep 2010 11:09:09 +0300
Message-ID: <1284278949.1783.16.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-09-11 at 23:48 -0400, Mike Frysinger wrote:
> Considering this is marked as "old" which is synonymous with "dead",
> having the dir cause build failures because of warnings makes no
> sense.  So drop the -Werror usage.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
