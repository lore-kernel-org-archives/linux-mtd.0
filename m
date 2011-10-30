Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKc5q-0005zF-NV
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 20:34:59 +0000
Received: by bkat2 with SMTP id t2so374790bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 13:34:56 -0700 (PDT)
Subject: Re: [PATCH V2 2/2] mtd: tests: annotate as DANGEROUS in Kconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sun, 30 Oct 2011 22:34:53 +0200
In-Reply-To: <1319992129-13588-1-git-send-email-w.sang@pengutronix.de>
References: <1319977792.2126.30.camel@koala>
	<1319992129-13588-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1320006895.2126.61.camel@koala>
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

On Sun, 2011-10-30 at 17:28 +0100, Wolfram Sang wrote:
> +	  WARNING: Some of the tests will ERASE THE CONTENT of mtd devices!
> +	  Do not use these tests unless you are sure you really need to.

Thanks, I've pushed this patch but amended the above text a bit:
+         WARNING: some of the tests will ERASE entire MTD device which they
+         test. Do not use these tests unless you really know what you do.
