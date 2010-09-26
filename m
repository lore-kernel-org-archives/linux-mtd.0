Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzpcB-0000IP-5k
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 11:41:56 +0000
Received: by bwz19 with SMTP id 19so3858173bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 04:41:53 -0700 (PDT)
Subject: Re: [PATCH 3/4 v2] mtd-utils: new strtoX helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285394808-29795-1-git-send-email-vapier@gentoo.org>
References: <1285293221-25028-3-git-send-email-vapier@gentoo.org>
	<1285394808-29795-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 26 Sep 2010 14:41:50 +0300
Message-ID: <1285501310.13050.13.camel@brekeke>
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

On Sat, 2010-09-25 at 02:06 -0400, Mike Frysinger wrote:
> +#ifndef __MTD_UTILS_STRTOX_H__
> +#define __MTD_UTILS_STRTOX_H__
> +
> +#include "common.h"
> +#include <stdlib.h>

Hmm, but you include this file here anyway.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
