Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rc1tP-0002eX-SE
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 21:34:08 +0000
Received: by lahc1 with SMTP id c1so2848567lah.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 13:34:05 -0800 (PST)
Subject: Re: [PATCH 2/5] MTD: bcm63xxpart: make sure CFE and NVRAM
 partitions are at least 64K
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 17 Dec 2011 23:33:58 +0200
In-Reply-To: <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
 <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1324157643.2240.2.camel@koala>
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-12-17 at 13:58 +0100, Jonas Gorski wrote:
> The CFE and NVRAM are always at least 64K big, so make sure their
> partitions are never smaller than this in case the flash has smaller
> erase sectors.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Not that I have any knowledge about BCM platform, but still, I think
it is good idea to explain why these partitions have to be at least
64KiB. Could you please do this, just for the sake of having good
commit messages?

Artem.
