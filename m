Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKUZA-0002cx-NB
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 12:32:45 +0000
Received: by bkat2 with SMTP id t2so132068bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 05:32:43 -0700 (PDT)
Subject: Re: [PATCH V3 1/2] mtd: tests: don't use mtd0 as a default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sun, 30 Oct 2011 14:32:40 +0200
In-Reply-To: <1319926313-22738-1-git-send-email-w.sang@pengutronix.de>
References: <1319922741.2126.24.camel@koala>
	<1319926313-22738-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319977961.2126.32.camel@koala>
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

On Sun, 2011-10-30 at 00:11 +0200, Wolfram Sang wrote:
> mtd tests may erase the mtd device, so force the user to specify which
> mtd device to test by using the module parameter. Disable the default
> (using mtd0) since this may destroy a vital part of the flash if the
> module is inserted accidently or carelessly.
> 
> Reported-by: Roland Kletzing <devzero@web.de>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Sorry for messy replies. I actually pushed V3 of the first patch and did
not take the 2/2 patch.

Artem.
