Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1C80-0003R0-KK
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 05:56:25 +0000
Received: by fxm15 with SMTP id 15so1339643fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 22:56:23 -0700 (PDT)
Subject: Re: [PATCH 1/3 v2] mtd-utils: new memory wrappers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285824458-21933-1-git-send-email-vapier@gentoo.org>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
	<1285824458-21933-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Sep 2010 08:54:16 +0300
Message-ID: <1285826056.11684.23.camel@localhost>
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

On Thu, 2010-09-30 at 01:27 -0400, Mike Frysinger wrote:
> The mkfs.jffs2 program has local wrappers for memory related functions
> that are useful beyond mkfs.jffs2, so break them out into a common header.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2

Pushed this one and 2/4 v2 and 3/3 to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
