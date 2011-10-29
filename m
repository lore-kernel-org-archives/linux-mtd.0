Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKFSr-0007tu-6Y
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 20:25:13 +0000
Received: by bke11 with SMTP id 11so2681502bke.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Oct 2011 13:25:11 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: tests: don't use mtd0 as a default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 29 Oct 2011 23:25:07 +0300
In-Reply-To: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319919909.2126.15.camel@koala>
Mime-Version: 1.0
Cc: Roland Kletzing <devzero@web.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-10-25 at 11:09 +0200, Wolfram Sang wrote:
> mtd tests may erase the mtd device, so force the user to specify which
> mtd device to test by using the module parameter. Disable the default
> (using mtd0) since this may destroy a vital part of the flash if the
> module is inserted accidently or carelessly.
> 
> Reported-by: Roland Kletzing <devzero@web.de>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Note, I've pushed this patch to l2-mtd-2.6.git, thanks!

Artem.
