Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oylzr-0003rw-P9
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:38:00 +0000
Received: by bwz19 with SMTP id 19so1652085bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:37:58 -0700 (PDT)
Subject: Re: [PATCH] rbtree: avoid redefining offsetof
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285208020-24905-1-git-send-email-vapier@gentoo.org>
References: <1285208020-24905-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 16:36:15 +0300
Message-ID: <1285248975.29268.126.camel@localhost>
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

On Wed, 2010-09-22 at 22:13 -0400, Mike Frysinger wrote:
> Newer versions of gcc will define & export offsetof, so we don't
> want to unconditionally define it.  Otherwise we hit:
> 	In file included from mkfs.jffs2.c:76:0:
> 	rbtree.h:134:0: warning: "offsetof" redefined
> 	/usr/lib/gcc/x86_64-pc-linux-gnu/4.5.1/include/stddef.h:411:0: note:
> 		this is the location of the previous definition
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
