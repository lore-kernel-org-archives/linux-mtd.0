Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf6nO-0006pq-7a
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 08:20:16 +0000
Received: by fxm19 with SMTP id 19so6906601fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 00:19:59 -0800 (PST)
Subject: Re: [PATCH] amd76xrom: fix oops at boot when resources are not
	available
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
In-Reply-To: <20110108142437.GB3306@r2bh72.net.upc.cz>
References: <20110108142437.GB3306@r2bh72.net.upc.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 10:19:49 +0200
Message-ID: <1295338789.2470.55.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell Whitaker <russ@ashlandhome.net>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-01-08 at 15:24 +0100, Stanislaw Gruszka wrote:
> For some unknown reason resources needed by amd76xrom driver can not be
> available. Instead of return error, driver crash the kernel with
> messages like below. Patch fix that.

Picked and pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
