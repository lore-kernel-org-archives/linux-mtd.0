Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P07Tv-0002O2-BQ
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:46:35 +0000
Received: by bwz19 with SMTP id 19so4316726bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 23:46:34 -0700 (PDT)
Subject: Re: [PATCH v3] mtd-utils: new strtoX helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285569748-16152-1-git-send-email-vapier@gentoo.org>
References: <1285394808-29795-1-git-send-email-vapier@gentoo.org>
	<1285569748-16152-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 09:44:46 +0300
Message-ID: <1285569886.16181.7.camel@localhost>
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

On Mon, 2010-09-27 at 02:42 -0400, Mike Frysinger wrote:
> Simply usage of converting strings to numbers by adding some wrappers
> around the standard strtoX functions.  These helpers simplify the api
> of these functions a bit by providing an optional "error" pointer and
> automatic error message.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v3
> 	- merge into common.h now that PROGRAM_NAME has been sorted out

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
