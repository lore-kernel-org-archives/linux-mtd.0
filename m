Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYrX-0003WY-Rx
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 12:24:56 +0000
Received: by fxm14 with SMTP id 14so3487668fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 05:24:54 -0700 (PDT)
Subject: Re: [PATCH 2/5] flash_{lock,unlock}: merge functionality
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307333354-26583-2-git-send-email-vapier@gentoo.org>
References: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
	<1307333354-26583-2-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 15:20:38 +0300
Message-ID: <1307362838.3112.48.camel@localhost>
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

On Mon, 2011-06-06 at 00:09 -0400, Mike Frysinger wrote:
> The flash_lock util has a bit of extra argument checking, and it supports
> a magic value of "-1" to mean "all blocks".
> 
> The flash_unlock util supports automatic 2nd/3rd arguments to unlock the
> whole flash.  It also supports multiple bases (not just hex) for selecting
> the range of the device to unlock.
> 
> So tweak both utilities so that they have equivalent functionality again
> by adding the missing features to each.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
