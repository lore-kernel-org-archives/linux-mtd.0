Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oym9z-00073c-8C
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:48:27 +0000
Received: by mail-bw0-f49.google.com with SMTP id 19so1664060bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:48:26 -0700 (PDT)
Subject: Re: [PATCH] libfec: fix up pointer warnings in fec magic computation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285211283-17618-1-git-send-email-vapier@gentoo.org>
References: <1285211283-17618-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 16:46:43 +0300
Message-ID: <1285249603.29268.131.camel@localhost>
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

On Wed, 2010-09-22 at 23:08 -0400, Mike Frysinger wrote:
> The current fec code casts a pointer to an int which causes warnings on
> 64bit systems.  So create a macro for the duplicate/complicated magic
> computation, and add an unsigned long cast in it to fix the original
> problem.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
