Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq1me-0004Mu-7A
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 10:40:14 +0000
Received: by gxk27 with SMTP id 27so2348076gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 03:40:11 -0700 (PDT)
Subject: Re: [PATCH] nanddump: Fix hexdump nybble ordering
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <jon.povey@racelogic.co.uk>
In-Reply-To: <1282291879-28754-1-git-send-email-jon.povey@racelogic.co.uk>
References: <1282291879-28754-1-git-send-email-jon.povey@racelogic.co.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 13:39:21 +0300
Message-ID: <1283164761.12995.49.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 17:11 +0900, Jon Povey wrote:
> Hex dumps were being printed with the nybbles reversed since
> commit 6ff458433ba15b8a7cb258ce64e64e98982df26e
> Fix.
> 
> Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
> CC: Brian Norris <norris@broadcom.com>
> ---
>  nanddump.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Pushed, thank you!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
