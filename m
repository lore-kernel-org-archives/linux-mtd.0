Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OpgsB-0007cP-R3
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 12:20:32 +0000
Received: by yxf34 with SMTP id 34so2055287yxf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 05:20:31 -0700 (PDT)
Subject: Re: [PATCH] Add quick erase format option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefani Seibold <stefani@seibold.net>
In-Reply-To: <1283081435.2131.24.camel@brekeke>
References: <1281342353-18180-1-git-send-email-stefani@seibold.net>
	<1281343038.12908.25.camel@localhost>
	<1281343974.18398.13.camel@wall-e.seibold.net>
	<1281353344.2332.8.camel@brekeke>
	<1281362069.20181.16.camel@wall-e.seibold.net>
	<1283081435.2131.24.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 15:20:24 +0300
Message-ID: <1283084424.2131.40.camel@brekeke>
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

On Sun, 2010-08-29 at 14:30 +0300, Artem Bityutskiy wrote:
> The reason why this flushing is needed is that we want to make sure
> that
> there are no PEBs which belonged to a volume with the same ID. Indeed,
> imaging you have volume 5 with many used LEBs. Then you remove this
> volume, so that all its LEBs are scheduled for erasure. Then you
> create
> a new volume with the same ID = 5. If we do not flush the queue, we
> may
> end up with rubbish from the older volume 5 in the new one. 

Err, it is important to say that we'll end up with the rubbish if we
have an unclean reboot after the new volume with ID 5 is created, but
before all PEBs belonging to the old volume with ID 5 are erased.
Hopefully, my explanation is not too messy :-)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
