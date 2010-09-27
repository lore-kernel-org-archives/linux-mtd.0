Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P07Kw-0003Ge-7x
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:37:19 +0000
Received: by fxm4 with SMTP id 4so3419665fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 23:37:17 -0700 (PDT)
Subject: Re: [PATCH] recv_image: fix __USE_GNU hack
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285537349-6878-1-git-send-email-vapier@gentoo.org>
References: <1285526931-4005-1-git-send-email-vapier@gentoo.org>
	<1285537349-6878-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 09:35:29 +0300
Message-ID: <1285569329.16181.4.camel@localhost>
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

On Sun, 2010-09-26 at 17:42 -0400, Mike Frysinger wrote:
> The __USE_GNU define is an internal define that source code should never
> be touching.  So switch it to the proper exported _BSD_SOURCE define.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
