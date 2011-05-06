Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIQNu-0002U9-5o
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 19:08:18 +0000
Received: by ewy3 with SMTP id 3so1197418ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 12:08:16 -0700 (PDT)
Subject: Re: [PATCH RESEND] mtd: onenand: onenand_base: check for region !=
	NULL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: john.maxin@nokia.com
In-Reply-To: <77DFD0EF40BC5042BB7221A1EFFF7570A167@008-AM1MPN1-021.mgdnok.nokia.com>
References: <77DFD0EF40BC5042BB7221A1EFFF7570A167@008-AM1MPN1-021.mgdnok.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 22:04:46 +0300
Message-ID: <1304708686.7222.103.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 09:17 +0000, john.maxin@nokia.com wrote:
> Coverity has reported that inside the function "onenand_block_by_block_erase()" 
> in onenand_base.c, we should add a check to prevent the incrementing of 
> possible NULL value for "region"
> 
> Signed-off-by: Maxin B. John <john.maxin@nokia.com>

This patch is not against the upstream kernel, I could not apply it. But
it is trivial enough and I could manually apply it. Pushed to
l2-mtd-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
