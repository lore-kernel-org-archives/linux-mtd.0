Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKUR4-0002WD-Jg
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 12:24:23 +0000
Received: by bkat2 with SMTP id t2so128130bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 05:24:17 -0700 (PDT)
Subject: Re: [PATCH V2 1/2] mtd: tests: don't use mtd0 as a default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sun, 30 Oct 2011 14:24:13 +0200
In-Reply-To: <1319921769-25028-1-git-send-email-w.sang@pengutronix.de>
References: <1319920531.2126.21.camel@koala>
	<1319921769-25028-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319977455.2126.25.camel@koala>
Mime-Version: 1.0
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

On Sat, 2011-10-29 at 22:56 +0200, Wolfram Sang wrote:
> mtd tests may erase the mtd device, so force the user to specify which
> mtd device to test by using the module parameter. Disable the default
> (using mtd0) since this may destroy a vital part of the flash if the
> module is inserted accidently or carelessly.
> 
> Reported-by: Roland Kletzing <devzero@web.de>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Pushed this one to l2-mtd-2.6.git, thanks!

Artem.
