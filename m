Received: from mail-fx0-f67.google.com ([209.85.161.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PfAQ6-0008Bo-62
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 12:12:19 +0000
Received: by mail-fx0-f67.google.com with SMTP id 17so2571785fxm.6
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 04:12:17 -0800 (PST)
Subject: Re: [PATCH] mtd_blkdevs: local symbols should be static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <0D753D10438DA54287A00B027084269764CE0E550B@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269764CE0E550B@AUSP01VMBX24.collaborationhost.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 14:12:09 +0200
Message-ID: <1295352729.2470.134.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-11 at 18:46 -0600, H Hartley Sweeten wrote:
> The function blktrans_dev_release and blktrans_dev_put are only used
> locally in this file and should be static.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
