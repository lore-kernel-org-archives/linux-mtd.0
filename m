Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq4FH-0002Vi-VY
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 13:17:56 +0000
Received: by vws11 with SMTP id 11so5554730vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 06:17:43 -0700 (PDT)
Subject: Re: [patch] mtd/pcmciamtd: remove dead code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20100824115627.GD29330@bicker>
References: <20100824115627.GD29330@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 16:17:35 +0300
Message-ID: <1283174255.12995.78.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Karsten Keil <keil@b1-systems.de>, kernel-janitors@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Magnus Damm <damm@opensource.se>, Alexander Kurz <linux@kbdbabel.org>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-24 at 13:56 +0200, Dan Carpenter wrote:
> This code isn't reachable.  I looked through the git history and it
> hasn't been reachable for years.  Someone removed the label to silence
> gcc's unused label warning but these few lines accidentally got left
> behind.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
