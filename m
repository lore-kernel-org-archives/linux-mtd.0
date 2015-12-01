Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3pqq-00042A-HA
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 18:40:33 +0000
Received: by padhx2 with SMTP id hx2so13165601pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 10:40:11 -0800 (PST)
Date: Tue, 1 Dec 2015 10:40:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] spi/nor: Fix error message with unrecognized JEDEC
Message-ID: <20151201184009.GX64635@google.com>
References: <1448912477-27057-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448912477-27057-1-git-send-email-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 30, 2015 at 08:41:17PM +0100, Ricardo Ribalda Delgado wrote:
> The error message was:
> 
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
> 
> The new error message:
> 
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00, 00, 00
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> 
> v2: Changes by Marek Vasut

Pushed to l2-mtd.git
