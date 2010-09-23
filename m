Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oym0R-0003xS-PI
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:38:36 +0000
Received: by bwz19 with SMTP id 19so1652929bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:38:35 -0700 (PDT)
Subject: Re: [PATCH] compr_zlib: mark local functions as static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285209264-3936-1-git-send-email-vapier@gentoo.org>
References: <1285209264-3936-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 16:36:50 +0300
Message-ID: <1285249010.29268.129.camel@localhost>
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

On Wed, 2010-09-22 at 22:34 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  compr_zlib.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
