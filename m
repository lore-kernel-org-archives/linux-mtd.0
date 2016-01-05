Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGHOQ-0006YU-Bs
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2016 02:30:40 +0000
Received: by mail-pf0-x230.google.com with SMTP id 78so213905024pfw.2
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 18:30:18 -0800 (PST)
Date: Mon, 4 Jan 2016 18:30:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>,
 Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 Milton Chiang =?utf-8?B?KOaxn+aYjuaZjyk=?= <Milton.Chiang@mediatek.com>
Subject: Re: [PATCH for-4.4 2/2] mtd: spi-nor: fix stm_is_locked_sr()
 parameters
Message-ID: <20160105023015.GG109450@google.com>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <1450205301-32207-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450205301-32207-2-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 15, 2015 at 10:48:21AM -0800, Brian Norris wrote:
> stm_is_locked_sr() takes the status register (SR) value as the last
> parameter, not the second.
> 
> Reported-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Bayi Cheng <bayi.cheng@mediatek.com>

Bayi,

Do you care to provide your Tested-by? I might get this into 4.4 as a
fix.

Brian
