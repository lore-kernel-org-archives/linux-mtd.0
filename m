Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf78B-0005cj-0Z
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 08:41:35 +0000
Received: by fxm19 with SMTP id 19so6921164fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 00:41:28 -0800 (PST)
Subject: Re: Confusion over mkfs.ubifs versions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Lambert <dave@lambsys.com>
In-Reply-To: <4D2B79BF.6080304@lambsys.com>
References: <4D2B79BF.6080304@lambsys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 10:41:24 +0200
Message-ID: <1295340084.2470.72.camel@koala>
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

On Mon, 2011-01-10 at 15:27 -0600, David Lambert wrote:
> After upgrading to Ubuntu 10.10 I noticed that the stock mkfs.ubifs 
> (version 1.3) failed to compute checksums correctly. I compiled my own 
> version from the git source of mtd-utils which announces itself as 
> version 1.4; this worked fine. Being curious I logged onto a machine 
> running Ubuntu 10.4 and checked the version of mkfs.ubifs and also found 
> it to be 1.3, but this version computes checksums correctly! Is there a 
> sub-version of mkfs.ubifs between 1.3 and 1.4 that is not shown by using 
> --version? Am I missing something critical here?

Since mtd-utils are not managed very well, and we were not tagging them
regularly enough, I think Ubuntu guys just picked a non-tagged snapshot
which had that bug. Just take newer version please, or ask Ubunto folks
to do this.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
