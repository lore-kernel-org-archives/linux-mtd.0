Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGHNf-0005Bh-Vx
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2016 02:29:52 +0000
Received: by mail-pf0-x22d.google.com with SMTP id q63so175746612pfb.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 18:29:31 -0800 (PST)
Date: Mon, 4 Jan 2016 18:29:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>,
 Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 Milton Chiang =?utf-8?B?KOaxn+aYjuaZjyk=?= <Milton.Chiang@mediatek.com>
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
Message-ID: <20160105022928.GF109450@google.com>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 15, 2015 at 10:48:20AM -0800, Brian Norris wrote:
> Spansion and Winbond have occasionally used the same manufacturer ID,
> and they don't support the same features. Particularly, writing SR=0
> seems to break read access for Spansion's s25fl064k. Unfortunately, we
> don't currently have a way to differentiate these Spansion and Winbond
> parts, so rather than regressing support for these Spansion flash, let's
> drop the new Winbond lock/unlock support for now. We can try to address
> Winbond support during the next release cycle.
> 
> Original discussion:
> 
> http://patchwork.ozlabs.org/patch/549173/
> http://patchwork.ozlabs.org/patch/553683/
> 
> Fixes: 357ca38d4751 ("mtd: spi-nor: support lock/unlock/is_locked for Winbond")
> Fixes: c6fc2171b249 ("mtd: spi-nor: disable protection for Winbond flash at startup")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Reported-by: Felix Fietkau <nbd@openwrt.org>
> Cc: Felix Fietkau <nbd@openwrt.org>

Felix,

Can I get a Tested-by? I'm going to send this for 4.4 still, if
possible.

Brian
