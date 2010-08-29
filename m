Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OpozB-0001l0-Dk
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 21:00:17 +0000
Received: by yxf34 with SMTP id 34so2163111yxf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 14:00:15 -0700 (PDT)
Subject: Re: ubi : kernel panic on erroneous block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <1283114768.2003.222.camel@brekeke>
References: <4C61223F.30100@parrot.com>  <1283114768.2003.222.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 00:00:09 +0300
Message-ID: <1283115609.1948.14.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-08-29 at 23:46 +0300, Artem Bityutskiy wrote:
> Because of inlining, your stack-dump lacks some function calls. I think
> it was: ubifs_replay_journal() -> replay_log_leb() -> ubifs_scan()
> -> ... Then we had -EBADMSG, and returned back to 'replay_log_leb()'.
> Then we call 'ubifs_recover_log_leb()', which scans the LEB again.
> 
> Yes, this is sub-optimal to scan twice, but this is how the thing is
> implemented. I can try to fix it later - but this is not so important
> now, let's first deal with your issues. But please, feel free to bug me
> later and remind about this.

An additional idea: we can strengthen 'ubi_io_read()' and make it re-try
several times if there was -EBADMSG. It already retires for 'read !=
len' case, but probably we should make it retry in case of any error.

But this is not a fix, just an improvement. Lets do this at the end,
when we have addressed your issues, because otherwise it will be more
difficult to reproduce.

So, let's postpone this, but please, bug me and remind about this.

> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] UBIFS: do not oops when erroneous PEB is scheduled for scrubbing

And of course the prefix should be "UBI:".

I've pushed this patch to the UBI tree as well.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
