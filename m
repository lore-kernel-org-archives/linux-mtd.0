Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTo0g-0001KY-Tu
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:35:23 +0000
Received: by eyh6 with SMTP id 6so1933502eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 21:35:20 -0700 (PDT)
Subject: Re: [PATCH 1/4] flash_info: convert to common.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 07:31:04 +0300
Message-ID: <1307421064.11104.7.camel@localhost>
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

On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  flash_info.c |   27 +++++++++++++++++----------
>  1 files changed, 17 insertions(+), 10 deletions(-)

How about killing this utility completely and use mtdinfo from ubi-utils
instead? Yes, before creating mtdinfo I should have noticed flash_info,
but I did not. Did you look at mtdinfo?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
