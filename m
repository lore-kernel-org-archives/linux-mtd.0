Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rc2Ga-0003EW-Q8
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 21:58:05 +0000
Received: by wgbdt11 with SMTP id dt11so6100494wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 13:58:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324157643.2240.2.camel@koala>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
 <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
 <1324157643.2240.2.camel@koala>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 17 Dec 2011 22:57:41 +0100
Message-ID: <CAOiHx=nwZ27ByyLDOXcy21x3_NJZKWU4AEJo3m3SfcposAbucA@mail.gmail.com>
Subject: Re: [PATCH 2/5] MTD: bcm63xxpart: make sure CFE and NVRAM partitions
 are at least 64K
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 December 2011 22:33, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Not that I have any knowledge about BCM platform, but still, I think
> it is good idea to explain why these partitions have to be at least
> 64KiB. Could you please do this, just for the sake of having good
> commit messages?

Sure, no problem. Should I sent the whole series again or is a V2 of
this one enough?


Jonas
