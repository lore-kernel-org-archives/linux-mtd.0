Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P07ev-0000sU-Qf
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:58:00 +0000
Received: by bwz19 with SMTP id 19so4321108bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 23:57:54 -0700 (PDT)
Subject: Re: [PATCH v3] mtd-utils: unify flash_erase and flash_eraseall
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285570258-17068-1-git-send-email-vapier@gentoo.org>
References: <1285394847-29844-1-git-send-email-vapier@gentoo.org>
	<1285570258-17068-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 09:56:06 +0300
Message-ID: <1285570566.16181.9.camel@localhost>
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

On Mon, 2010-09-27 at 02:50 -0400, Mike Frysinger wrote:
> These have overlapping functionality, and while flash_eraseall supports
> newer 64bit ioctls, flash_erase does not.  So rather than graft support
> onto flash_erase, merge the functionality of two into flash_erase so we
> only have to support one util from now on.
> 
> A simple wrapper is provided to ease old flash_eraseall users into the
> new combined flash_erase util.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v3
> 	- rebase after recent common.h changes

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
