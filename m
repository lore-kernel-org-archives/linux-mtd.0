Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OymAs-0007GP-O2
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:49:23 +0000
Received: by bwz19 with SMTP id 19so1665303bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:49:22 -0700 (PDT)
Subject: Re: [PATCH] jffs2: drop unused model argument
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285210353-30804-1-git-send-email-vapier@gentoo.org>
References: <1285210353-30804-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 16:47:38 +0300
Message-ID: <1285249658.29268.132.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-22 at 22:52 -0400, Mike Frysinger wrote:
> The jffs2 compression framework provides a "model" argument when
> compressing and decompressing, but the caller always passes in NULL
> and the callees never use it.  So punt this useless overhead.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to l2-mtd-2.6.git with my Signed-off-by, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
