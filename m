Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf6zl-0002Y9-Jz
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 08:33:03 +0000
Received: by fxm19 with SMTP id 19so6915381fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 00:32:44 -0800 (PST)
Subject: Re: [PATCH] MTD: FTL layer: don't free input argument in
	add_mtd_blktrans_dev
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1294529106-32586-1-git-send-email-maximlevitsky@gmail.com>
References: <1294529106-32586-1-git-send-email-maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 10:32:37 +0200
Message-ID: <1295339557.2470.64.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, enh@google.com,
	linux-mtd@lists.infradead.org, nnk@google.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-01-09 at 01:25 +0200, Maxim Levitsky wrote:
> This one liner patch fixes double free that will occur if add_mtd_blktrans_dev
> fails. On failure it free input argument, but all its users
> also free it on error which is natural thing to do.
> Thus don't free it.
> 
> All credit for finding that bug belongs to reporters of the bug in the android bugzilla
> http://code.google.com/p/android/issues/detail?id=13761
> 
> Signed-of-by: Maxim Levitsky <maximlevitsky@gmail.com>

Signed-off-by, (off, not of). I'll fix this.

I'll change your subject line to:

mtd: mtd_blkdevs: fix double free on error path

a) We use "mtd:" prefix, not "MTD:".
b). mtd_blkdevs is not really an FTL layer, I think.
c). The subject line has to make it obvious whether this is a bugfix or
something else - it makes life of people who look at commit messages ans
search for stuff important stuff easier. Your subject line is
technically correct, but not very helpful.

Anyway, picked to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
