Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ouhct-0001xB-8U
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 08:09:27 +0000
Received: by mail-bw0-f49.google.com with SMTP id 13so4741628bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 01:09:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] nanddump: drop unused --ignoreerrors option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1284263427-31342-1-git-send-email-vapier@gentoo.org>
References: <1284263427-31342-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 12 Sep 2010 11:09:24 +0300
Message-ID: <1284278964.1783.17.camel@brekeke>
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

On Sat, 2010-09-11 at 23:50 -0400, Mike Frysinger wrote:
> Nowhere in the nanddump code is the "ignoreerrors" variable used.  So
> drop the option completely.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
