Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0Wn3-00086x-1b
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 09:48:01 +0000
Received: by bwz19 with SMTP id 19so5507311bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 02:47:57 -0700 (PDT)
Subject: Re: [PATCH 4/4] mtd-utils: unify flash_erase and flash_eraseall
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285293221-25028-4-git-send-email-vapier@gentoo.org>
References: <1285293221-25028-1-git-send-email-vapier@gentoo.org>
	<1285293221-25028-4-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 12:46:07 +0300
Message-ID: <1285667167.2437.66.camel@localhost>
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

On Thu, 2010-09-23 at 21:53 -0400, Mike Frysinger wrote:
> These have overlapping functionality, and while flash_eraseall supports
> newer 64bit ioctls, flash_erase does not.  So rather than graft support
> onto flash_erase, merge the functionality of two into flash_erase so we
> only have to support one util from now on.
> 
> A simple wrapper is provided to ease old flash_eraseall users into the
> new combined flash_erase util.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

And BTW, thanks for good clean-ups!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
