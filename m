Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P22rK-0003iy-5Y
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 14:14:42 +0000
Received: by bwz19 with SMTP id 19so3766258bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Oct 2010 07:14:41 -0700 (PDT)
Subject: Re: [PATCH] mkfs.jffs2: convert to xalloc.h helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285953030-19539-1-git-send-email-vapier@gentoo.org>
References: <1285953030-19539-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 02 Oct 2010 17:14:38 +0300
Message-ID: <1286028878.32172.19.camel@brekeke>
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

On Fri, 2010-10-01 at 13:10 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  mkfs.jffs2.c |   13 +++----------
>  1 files changed, 3 insertions(+), 10 deletions(-)

Pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
