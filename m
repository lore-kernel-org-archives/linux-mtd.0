Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUYee-0000XA-LL
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 06:23:45 +0000
Received: by ewy3 with SMTP id 3so527421ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 23:23:41 -0700 (PDT)
Subject: Re: [PATCH] mtdinfo: remove now unused ubigen info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307559148-28483-1-git-send-email-vapier@gentoo.org>
References: <1307559148-28483-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 09:19:23 +0300
Message-ID: <1307600363.7374.1.camel@localhost>
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

On Wed, 2011-06-08 at 14:52 -0400, Mike Frysinger wrote:
> A previous commit moved the code using this var into a diff func.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  ubi-utils/src/mtdinfo.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Pushed, thanks you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
