Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P07Rm-0006vz-O2
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:44:23 +0000
Received: by bwz19 with SMTP id 19so4315947bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 23:44:21 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: common.h: clean up PROGRAM_NAME usage
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285569626-16021-1-git-send-email-vapier@gentoo.org>
References: <1285569626-16021-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 09:42:33 +0300
Message-ID: <1285569753.16181.6.camel@localhost>
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

On Mon, 2010-09-27 at 02:40 -0400, Mike Frysinger wrote:
> Make PROGRAM_NAME required in order to include common.h so we can rely
> on it existing.
> 
> Further, stop embedding PROGRAM_NAME in every error message so that we
> can save string space with it being declare only once.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  include/common.h |   25 ++++++++++++-------------
>  1 files changed, 12 insertions(+), 13 deletions(-)

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
