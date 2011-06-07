Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTq6Z-0002vR-NF
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:49:36 +0000
Received: by eyh6 with SMTP id 6so1961683eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 23:49:33 -0700 (PDT)
Subject: Re: [PATCH 3/6] libmtd: use O_CLOEXEC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307427548-29306-3-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-3-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 09:45:16 +0300
Message-ID: <1307429116.11104.40.camel@localhost>
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

On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
> Not strictly necessary, but this is good library behavior and
> should carry no runtime overhead.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  include/common.h |    5 +++++
>  lib/libmtd.c     |   10 +++++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)

Pushed this one, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
