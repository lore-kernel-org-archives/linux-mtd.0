Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz7M4-00074l-7V
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 12:26:20 +0000
Received: by fxm4 with SMTP id 4so2127090fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 05:26:19 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: convert to common.h/min
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285293137-24887-1-git-send-email-vapier@gentoo.org>
References: <1285293137-24887-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 15:24:38 +0300
Message-ID: <1285331078.17426.2.camel@localhost>
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
> Kill off duplicated min() defines and convert to the common.h one.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
