Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1ZLM-00023x-Mz
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 06:43:45 +0000
Received: by fxm15 with SMTP id 15so2352127fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 23:43:43 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: enable garbage collection of unused
	function/data sections
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285911434-9186-1-git-send-email-vapier@gentoo.org>
References: <1285911434-9186-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Oct 2010 09:41:26 +0300
Message-ID: <1285915286.11684.69.camel@localhost>
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

On Fri, 2010-10-01 at 01:37 -0400, Mike Frysinger wrote:
> On my default build, this cumulatively shaves off ~100KiB of unused
> code and data from the mtd-utils programs.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  common.mk |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Pushed all your patches, thanks for cleaning this stuff up!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
