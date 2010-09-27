Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P07Js-0001TB-8x
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:36:12 +0000
Received: by bwz19 with SMTP id 19so4312993bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 23:36:11 -0700 (PDT)
Subject: Re: [PATCH] ubi-utils: tweak const strings decls
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285537315-6833-1-git-send-email-vapier@gentoo.org>
References: <1285526931-4005-1-git-send-email-vapier@gentoo.org>
	<1285537315-6833-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 09:34:23 +0300
Message-ID: <1285569263.16181.3.camel@localhost>
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

On Sun, 2010-09-26 at 17:41 -0400, Mike Frysinger wrote:
> Shrink the data size a little by declaring addresses of constant strings
> instead of pointers to it.
> 
> Also slip in static & const on long_options missing them.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
