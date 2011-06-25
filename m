Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaMw5-0006rs-Ds
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 07:05:46 +0000
Received: by bwf12 with SMTP id 12so533586bwf.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 00:04:55 -0700 (PDT)
Subject: Re: [PATCH] build: remove old SYMLINKS variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 25 Jun 2011 10:04:48 +0300
In-Reply-To: <1308983401-27015-1-git-send-email-vapier@gentoo.org>
References: <1308983401-27015-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308985492.23868.6.camel@koala>
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

On Sat, 2011-06-25 at 02:30 -0400, Mike Frysinger wrote:
> This is only used to create symlinks to out of tree files.  I doubt it
> has any relevance anymore now that jffs2 has been merged into mainline.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  Makefile |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)

Pushed to mtd-utils.git, thanks!
-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
