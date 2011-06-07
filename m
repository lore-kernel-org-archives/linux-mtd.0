Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTr0c-00041R-BI
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:47:30 +0000
Received: by fxm14 with SMTP id 14so4250758fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:47:28 -0700 (PDT)
Subject: Re: [PATCH 6/6] flash_info: punt in favor of mtdinfo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307427548-29306-6-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-6-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 10:43:11 +0300
Message-ID: <1307432591.11104.67.camel@localhost>
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
> Now that the mtdinfo utility can do everything that flash_info
> could do (and better), punt it.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  Makefile     |    2 +-
>  flash_info.c |  141 ----------------------------------------------------------
>  2 files changed, 1 insertions(+), 142 deletions(-)
>  delete mode 100644 flash_info.c

Let's give it some deprecation period. Would it be possible to add an
entry to feature-removal-schedule.txt instead, and print a warning in
flash_info that it will be removed in mtd-utils-1.4.6. So we'll let it
be in 1.4.5 with this warning. Then I'll remove it myself in 1.4.6.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
