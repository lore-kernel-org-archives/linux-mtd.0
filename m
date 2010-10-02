Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P22tg-0003kw-3u
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 14:17:08 +0000
Received: by bwz19 with SMTP id 19so3767445bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Oct 2010 07:17:07 -0700 (PDT)
Subject: Re: [PATCH 2/2] sumtool/libfec: convert "()" to "(void)" in func defs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285953088-19593-2-git-send-email-vapier@gentoo.org>
References: <1285953088-19593-1-git-send-email-vapier@gentoo.org>
	<1285953088-19593-2-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 02 Oct 2010 17:17:02 +0300
Message-ID: <1286029022.32172.21.camel@brekeke>
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

On Fri, 2010-10-01 at 13:11 -0400, Mike Frysinger wrote:
> Since these functions take no parameters, declare them as such.  The
> subtle difference here is that gcc allows (without warning) people to
> accidentally call funcs declared with "()" with arguments.  Using void
> makes sure that gcc will reject such typos at compile time.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
