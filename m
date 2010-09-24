Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz7RK-0004cM-1M
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 12:31:46 +0000
Received: by bwz19 with SMTP id 19so2614544bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 05:31:45 -0700 (PDT)
Subject: Re: [PATCH] mkfs.ubifs: use common ARRAY_SIZE
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285293162-24970-1-git-send-email-vapier@gentoo.org>
References: <1285293162-24970-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 15:30:04 +0300
Message-ID: <1285331404.17426.7.camel@localhost>
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

On Thu, 2010-09-23 at 21:52 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  mkfs.ubifs/hashtable/hashtable.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
