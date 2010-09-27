Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P07IZ-0006ol-Di
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:34:51 +0000
Received: by fxm4 with SMTP id 4so3418958fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 23:34:49 -0700 (PDT)
Subject: Re: [PATCH] compr_rtime: fix unused warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285536587-5265-1-git-send-email-vapier@gentoo.org>
References: <1285536587-5265-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 09:33:01 +0300
Message-ID: <1285569181.16181.2.camel@localhost>
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

On Sun, 2010-09-26 at 17:29 -0400, Mike Frysinger wrote:
> The rtime logic causes gcc to emit an unused warning about srclen, so
> mark it with an unused attribute to shut it up.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
