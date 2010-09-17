Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OwUKr-0001lb-UL
	for linux-mtd@lists.infradead.org; Fri, 17 Sep 2010 06:22:14 +0000
Received: by bwz19 with SMTP id 19so3315218bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Sep 2010 23:22:11 -0700 (PDT)
Subject: Re: [PATCH] nanddump: Rename --nobad to --noskipbad
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1284362113-26737-1-git-send-email-w.sang@pengutronix.de>
References: <1284359070.27765.155.camel@localhost>
	<1284362113-26737-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Sep 2010 09:20:20 +0300
Message-ID: <1284704420.2373.60.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-13 at 09:15 +0200, Wolfram Sang wrote:
> "nobad" might lead to the assumption that bad blocks are skipped, but this
> option does exactly the opposite. Use a more descriptive name.
> 
> Reported-by: Jon Povey <Jon.Povey@racelogic.co.uk>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Mike Frysinger <vapier@gentoo.org>

It does not apply to the latest mtd-utils tree. Would you please re-send
an updated version?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
