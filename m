Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9rMV-0007Jw-Gq
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 04:07:28 +0000
Received: by eyh6 with SMTP id 6so66407eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 21:07:25 -0700 (PDT)
Subject: Re: [PATCH] cfi_cmdset_0002.c: Add CFI 1.5 support for S29GL-S
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gernot Hoyler <Gernot.Hoyler@spansion.com>
In-Reply-To: <201104111553.35457.Gernot.Hoyler@spansion.com>
References: <201104111553.35457.Gernot.Hoyler@spansion.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 07:07:22 +0300
Message-ID: <1302667642.14691.13.camel@koala>
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

On Mon, 2011-04-11 at 15:53 +0200, Gernot Hoyler wrote:
> This patch adds CFI 1.5 support for the new Spansion S29GL-S device family.
> For details, see the data sheet on the Spansion web site: 
> http://www.spansion.com/Support/Datasheets/S29GL_128S_01GS_00_02_e.pdf
> 
> Signed-off-by: Gernot Hoyler <Gernot.Hoyler@spansion.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
