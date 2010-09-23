Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oym0G-0003tM-As
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:38:24 +0000
Received: by mail-fx0-f49.google.com with SMTP id 4so1324565fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:38:24 -0700 (PDT)
Subject: Re: [PATCH] ftl_check: drop unused verbose flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285209212-32647-1-git-send-email-vapier@gentoo.org>
References: <1285209212-32647-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 16:36:41 +0300
Message-ID: <1285249001.29268.128.camel@localhost>
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

On Wed, 2010-09-22 at 22:33 -0400, Mike Frysinger wrote:
> The verbose flag isn't actually checked anywhere, so punt it.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  ftl_check.c |   13 ++++---------
>  1 files changed, 4 insertions(+), 9 deletions(-)

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
