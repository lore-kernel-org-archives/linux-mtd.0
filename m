Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OvO24-0005Hs-Qi
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 05:26:18 +0000
Received: by bwz19 with SMTP id 19so101672bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 22:26:15 -0700 (PDT)
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <AANLkTin4u=jQOxxuTwzMHrEEg=vDc2TSTah_=_Li02xx@mail.gmail.com>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
	<1284308851.1783.23.camel@brekeke>
	<AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>
	<1284358990.27765.154.camel@localhost>
	<AANLkTin4u=jQOxxuTwzMHrEEg=vDc2TSTah_=_Li02xx@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Sep 2010 08:26:07 +0300
Message-ID: <1284441967.2084.18.camel@brekeke>
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

On Mon, 2010-09-13 at 21:21 -0400, Mike Frysinger wrote:
> so once we have the ability to erase them, you'll merge this ?

Let's see, why not. How about what I suggest below.

> not that i see why we're restricting this behavior in the first place

First of all, bad eraseblock is the eraseblock which should not be used,
because it is bad. Writing to a bad eraseblock should not be allowed.

Your use-case is that an eraseblock is marked as bad incorrectly - by a
mistake or due to some problems.

So what you need is an operation which makes it good again and let's you
use it.

Once you add such operation, you will mark needed eraseblocks as good
again (effectively, erase them, and unmark in in-RAM and/or on-flash
BBD). After this you will not need --nobad option, because the
eraseblock is already good.

> ... policy is for the end user to determine ... this is putting
> artificial limits for no real reason that i can see.

But the problem is not artificial limits. The problem is that I do not
think your option is usable at all, because, as I explained, bad
eraseblock is not necessarily writable, it's contents and the state is
unpredictable. It may contain unstable bits, for example. You really
need to erase it before writing.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
