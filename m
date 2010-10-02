Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P22wT-0003mg-O2
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 14:20:02 +0000
Received: by bwz19 with SMTP id 19so3768889bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Oct 2010 07:20:00 -0700 (PDT)
Subject: Re: [PATCH] libmtd: make malloc failures fatal
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285953190-19669-1-git-send-email-vapier@gentoo.org>
References: <1285953190-19669-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 02 Oct 2010 17:19:58 +0300
Message-ID: <1286029198.32172.23.camel@brekeke>
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

On Fri, 2010-10-01 at 13:13 -0400, Mike Frysinger wrote:
> This converts libmtd to the common xalloc helpers and in doing so, makes
> memory allocation failures fatal rather than returning an error to the
> caller.  I think this is acceptable behavior.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  lib/libmtd.c        |   26 ++++++--------------------
>  lib/libmtd_legacy.c |    8 +-------
>  2 files changed, 7 insertions(+), 27 deletions(-)

I am not 100% sure this is a good idea, but probably for allocations it
is ok - they are so unlikely to fail, and if they do, we are screwed
anyway. But for other situation we should return errors, I think.

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
