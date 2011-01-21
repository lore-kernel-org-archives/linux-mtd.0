Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PgEvs-0005dc-Ht
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2011 11:13:34 +0000
Received: by bwz5 with SMTP id 5so1386224bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Jan 2011 03:13:24 -0800 (PST)
Subject: Re: [PATCH v2 3/3] UBIFS: do not start the commit if there is
	nothing to commit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <87ei8apf8a.fsf@vostro.fn.ogness.net>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala> <4D33FB78.5010208@nokia.com>
	<1295335817.2470.31.camel@koala> <1295336185.2470.33.camel@koala>
	<87ei8apf8a.fsf@vostro.fn.ogness.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 21 Jan 2011 13:13:20 +0200
Message-ID: <1295608400.3186.2.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-18 at 13:29 +0100, John Ogness wrote:
> Hi,
> 
> With these patches, there is no longer an erase for _every_
> sync. However, there is still one erase that occurs when ubifs is
> mounted. The following script will cause an erase with each sync.
> 
> while true; do
>     mount -t ubifs ubi0_2 /tmp/mnt
>     sync
>     umount /tmp/mnt
> done

Hi, thanks, I need to look why there are still erases after mount.
Probably this is actually part of mounting, not part of the first sync.
But otherwise it sounds like you are satisfied, right? But I also have
to do power cut tests emulation before really pushing this forward.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
