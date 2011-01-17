Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pel0e-0004y5-EA
	for linux-mtd@lists.infradead.org; Mon, 17 Jan 2011 09:04:21 +0000
Received: by fxm19 with SMTP id 19so5750827fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jan 2011 01:04:18 -0800 (PST)
Subject: Re: ubifs: sync() causes writes even if nothing is changed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4D33FB78.5010208@nokia.com>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala>  <4D33FB78.5010208@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 17 Jan 2011 11:04:14 +0200
Message-ID: <1295255054.2470.18.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Hans J. Koch" <hjk@linutronix.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-01-17 at 10:19 +0200, Adrian Hunter wrote:
> Possibly the LPT should be checked also.  Perhaps it can be dirty due
> to trivial garbage collection.

I'll check, thanks.

> Also, have you checked there are no degenerate cases where the commit
> is required for some other reason such as consolidating the log or the
> recovery  commit?

Right, I missed this, will check as well.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
