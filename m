Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKGCW-0008Ia-Ur
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 21:12:25 +0000
Received: by bke11 with SMTP id 11so2699393bke.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Oct 2011 14:12:22 -0700 (PDT)
Subject: Re: [PATCH V2 1/2] mtd: tests: don't use mtd0 as a default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sun, 30 Oct 2011 00:12:18 +0300
In-Reply-To: <1319921769-25028-1-git-send-email-w.sang@pengutronix.de>
References: <1319920531.2126.21.camel@koala>
	<1319921769-25028-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319922741.2126.24.camel@koala>
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
> +	if (dev < 0) {
> +		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
> +		printk(PRINT_PREF "WARNING: The data on this device will be ERASED!\n");
> +		return -EINVAL;

Thanks, but would it please be possible to use KERN_CRIT for the warning
to make sure the user actually sees it in the console?

Artem.
