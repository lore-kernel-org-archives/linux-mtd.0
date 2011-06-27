Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbHGY-00045Y-Ge
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 19:14:39 +0000
Received: by bwf12 with SMTP id 12so2155647bwf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 12:14:34 -0700 (PDT)
Subject: Re: [RFC] ubiblk: read-only block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: david.wagner@free-electrons.com
Date: Mon, 27 Jun 2011 22:14:30 +0300
In-Reply-To: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1309202072.24805.4.camel@koala>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks, for the driver.

On Fri, 2011-06-24 at 15:34 +0200, david.wagner@free-electrons.com
wrote:
> I'm submitting it for review, comments (on the concept as well as on the
> implementation) and advice.  It is my first kernel module - a lot of code was
> taken from mtd_blkdevs and some from gluebi.

If you borrow code from anywhere, you should preserve Copyrights.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
