Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz6qY-0007Yn-G3
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 11:53:47 +0000
Received: by fxm4 with SMTP id 4so2109168fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 04:53:44 -0700 (PDT)
Subject: Re: [PATCH RESEND][MTD]MLC device check in OneNAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
In-Reply-To: <001701cb5bdd$3fd69a80$bf83cf80$%hs@samsung.com>
References: <001701cb5bdd$3fd69a80$bf83cf80$%hs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 14:52:04 +0300
Message-ID: <1285329124.29268.175.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: v.dalal@samsung.com, gupta.raghav@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-24 at 17:10 +0530, Rohit Hassan Sathyanarayan wrote:
> Signed-off-by: Rohit HS <rohit.hs@samsung.com>
> Signed-off-by: Raghav Gupta <gupta.raghav@samsung.com>

Almost perfect. However:

1. All mtd patches should have "mtd:" prefix.
2. Add some description about what you do and why into the commit
message.
3. I think combining is not good, better do it old way - first patch
introduces the flag, second uses it in OneNAND

Sorry for being picky, but I really want to show you how to send patches
properly once and later get good series from you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
