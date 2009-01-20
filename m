Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPEja-0006uZ-Jz
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 11:25:33 +0000
Date: Tue, 20 Jan 2009 12:25:25 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] ubiupdatevol: make the -t parameter work again
Message-ID: <20090120112525.GA31113@Chamillionaire.breakpoint.cc>
References: <20081217101554.GA4999@www.tglx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20081217101554.GA4999@www.tglx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping

* Sebastian Andrzej Siewior | 2008-12-17 11:15:54 [+0100]:

>From bigeasy at linutronix.de  Wed Dec 17 05:15:54 2008
>From: bigeasy at linutronix.de (Sebastian Andrzej Siewior)
>Date: Wed, 17 Dec 2008 11:15:54 +0100
>Subject: [PATCH] ubiupdatevol: make the -t parameter work again
>Message-ID: <20081217101554.GA4999@www.tglx.de>
>
>The execution of
>|./ubiupdatevol /dev/ubi0 -t
>will fail because 'argv[optind + 1]' is undefined and the later executed
>'strcmp(args.img, "-")' will segfault.
>So I can hack around and supply a dummy image or fix it that way.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
>---
> ubi-utils/new-utils/src/ubiupdatevol.c |   13 +++++++++----
> 1 files changed, 9 insertions(+), 4 deletions(-)
>
>diff --git a/ubi-utils/new-utils/src/ubiupdatevol.c b/ubi-utils/new-utils/src/ubiupdatevol.c
>index 5eeaa3c..c83731c 100644
>--- a/ubi-utils/new-utils/src/ubiupdatevol.c
>+++ b/ubi-utils/new-utils/src/ubiupdatevol.c
>@@ -157,10 +157,15 @@ static int parse_opt(int argc, char * const argv[])
> 	args.node = argv[optind];
> 	args.img  = argv[optind + 1];
> 
>-	if (strcmp(args.img, "-") == 0)
>-		args.use_stdin = 1;
>-	if (args.use_stdin && !args.size)
>-		return errmsg("file size must be specified if input is stdin");
>+	if (args.img && args.truncate)
>+		return errmsg("You can't truncate and specify an image (use -h for help)");
>+
>+	if (args.img && !args.truncate) {
>+		if (strcmp(args.img, "-") == 0)
>+			args.use_stdin = 1;
>+		if (args.use_stdin && !args.size)
>+			return errmsg("file size must be specified if input is stdin");
>+	}
> 
> 	return 0;
> }
>-- 
>1.5.6.5
>

Sebastian
