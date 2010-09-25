Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzSL1-0003lE-CS
	for linux-mtd@lists.infradead.org; Sat, 25 Sep 2010 10:50:40 +0000
Received: by bwz19 with SMTP id 19so3385066bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Sep 2010 03:50:37 -0700 (PDT)
Subject: Re: [PATCH 1/4] libmtd: add lock/unlock helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285293221-25028-1-git-send-email-vapier@gentoo.org>
References: <1285293221-25028-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 25 Sep 2010 13:50:33 +0300
Message-ID: <1285411833.13050.3.camel@brekeke>
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

On Thu, 2010-09-23 at 21:53 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  include/libmtd.h |   24 ++++++++++++++++++++++++
>  lib/libmtd.c     |   32 ++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 0 deletions(-)

Pushed with a minor tweak, thanks.

>  /**
> + * mtd_lock - lock eraseblocks
Put a dot at the end, for consistency.


> +/**
> + * mtd_unlock - unlock eraseblocks
Ditto.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
