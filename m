Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYxM-0003kX-Jy
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 12:30:57 +0000
Received: by fxm14 with SMTP id 14so3492535fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 05:30:55 -0700 (PDT)
Subject: Re: [PATCH 4/5] flash_{lock,unlock}: convert to common code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307333354-26583-4-git-send-email-vapier@gentoo.org>
References: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
	<1307333354-26583-4-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 15:26:38 +0300
Message-ID: <1307363198.3112.51.camel@localhost>
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
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  flash_unlock.c |   75 ++++++++++++++++++++++++++++++-------------------------
>  1 files changed, 41 insertions(+), 34 deletions(-)

Pushed, but tweaked a bit ...

> +	/*
> +	 * Get the device info to compare to command line sizes
> +	 */

Made the comment style to be the same as we use in the kernel - one line
for short comments. Changed the existing comment as well. It could be a
separate patch, but let's use a simplified way in this case :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
