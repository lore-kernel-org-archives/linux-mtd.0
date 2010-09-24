Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz7L0-0006Ie-UP
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 12:25:15 +0000
Received: by fxm4 with SMTP id 4so2126431fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 05:25:14 -0700 (PDT)
Subject: Re: [PATCH] libmtd: unify erase block argument checking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285293113-24844-1-git-send-email-vapier@gentoo.org>
References: <1285293113-24844-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 15:23:33 +0300
Message-ID: <1285331013.17426.1.camel@localhost>
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

On Thu, 2010-09-23 at 21:51 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  lib/libmtd.c |   68 +++++++++++++++++++++++++++------------------------------
>  1 files changed, 32 insertions(+), 36 deletions(-)

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
