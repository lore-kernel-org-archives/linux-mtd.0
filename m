Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or7Uy-0002oA-Sr
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 10:58:29 +0000
Received: by gwb10 with SMTP id 10so85612gwb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 03:58:27 -0700 (PDT)
Subject: Re: [PATCH] Add quick erase format option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefani Seibold <stefani@seibold.net>
In-Reply-To: <1283410392.6920.36.camel@wall-e.seibold.net>
References: <1281342353-18180-1-git-send-email-stefani@seibold.net>
	<1281343038.12908.25.camel@localhost>
	<1281343974.18398.13.camel@wall-e.seibold.net>
	<1281353344.2332.8.camel@brekeke>
	<1281362069.20181.16.camel@wall-e.seibold.net>
	<1283081435.2131.24.camel@brekeke>
	<1283236978.6083.28.camel@wall-e.seibold.net>
	<1283302043.2018.92.camel@brekeke>
	<1283410392.6920.36.camel@wall-e.seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 13:58:20 +0300
Message-ID: <1283425100.3085.5.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, "Enzinger,
	Robert \(EXT-Other - DE/Munich\)" <robert.enzinger.ext@nsn.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
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

On Thu, 2010-09-02 at 08:53 +0200, Stefani Seibold wrote: 
> --do-not-use-me is the best. But more seriously i think we should it
> split it into two options. --all-erased and --check-erased. The first
> assumes that all PEB are erased, while the second do the check if the
> PEB is erased and if not it will be erased.
> 
> So we can handle NAND's, which have a fast erase, and NOR's  which are
> very slow. With this we are able to pick the best option for the
> manufacturing.

I am fine with checking, but what bothers me is that you check only 64
bytes out of 128KiB - why this is enough to make sure the eraseblock is
erased?

Probably it is ok for you, but in for general use-case this is wrong,
even checking all 128KiB is wrong, because of the unstable bits.

What I think will make more sense is to add general option --verify or
something like that. It would read everything the utility wrote and
verify it is identical to what was written. Probably this can be done in
libmtd.

Then you will be able to combine --all-erased with --verify and achieve
what you want.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
