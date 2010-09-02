Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrDzt-0004Gd-14
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 17:54:53 +0000
Received: by qyk8 with SMTP id 8so938853qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 10:54:48 -0700 (PDT)
Subject: Re: [PATCH 2/2 l2-mtd-2.6/dunno] NAND: fix almost all checkpatch
	warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201009021356.00275.ffainelli@freebox.fr>
References: <201009021356.00275.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 20:54:41 +0300
Message-ID: <1283450081.1694.10.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-02 at 13:56 +0200, Florian Fainelli wrote:
> This patch fixes almost all warnings but two, which would not improve
> readability or is a false positive.
> 
> Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>

FYI, I'm about to kill the dunno branch - all patches from there will be
moved to the master branch. This is because it is difficult to resolve
conflicts when things are split. Please, send patches against the master
patch. Also note, we use "mtd:" prefix for all mtd patches.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
