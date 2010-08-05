Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgsAt-0005zv-DL
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 04:35:24 +0000
Received: by fxm3 with SMTP id 3so3245053fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 21:35:22 -0700 (PDT)
Subject: Re: [PATCH] gen_nand: Fix support for multiple chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
In-Reply-To: <1280295414-3354-1-git-send-email-marek.vasut@gmail.com>
References: <1280295414-3354-1-git-send-email-marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 07:35:18 +0300
Message-Id: <1280982918.4363.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hsweeten@visionengravers.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-28 at 07:36 +0200, Marek Vasut wrote:
> This patch corrects a problem where gen_nand driver assumed there can be only
> one chip and ignored the pdata->chip.nr_chips value.
> 
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>

Pushed to my l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
