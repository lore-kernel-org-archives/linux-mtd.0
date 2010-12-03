Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POTDA-0005zL-7R
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 10:49:56 +0000
Received: by bwz5 with SMTP id 5so8509440bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Dec 2010 02:49:54 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20101203110719.3a9d14f2@wker>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<20101203110719.3a9d14f2@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Dec 2010 12:49:21 +0200
Message-ID: <1291373361.2365.52.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-03 at 11:07 +0100, Anatolij Gustschin wrote:
> This reset after clearing EC header and before clearing the VID
> seems to be quite rare event. I tested with your patch and with
> the mtd->writebuffer set to 64. Since no issues appeared while running
> a nightly test (1662 test cycles succeeded), I interrupted the test
> and simulated the reset in nor_erase_prepare() by adding a call of the
> machine restart callback before clearing the VID header's magic:

Let's merge it upstream as a bugfix then? Can I have your Tested-by:
Anatolij Gustschin <agust@denx.de> ? Or you want to do more testing for
it?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
