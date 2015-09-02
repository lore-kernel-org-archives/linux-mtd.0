Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXF5q-0003h8-KN
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:57:18 +0000
Received: by pacfv12 with SMTP id fv12so23010807pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 13:56:58 -0700 (PDT)
Date: Wed, 2 Sep 2015 13:56:55 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexis Ballier <aballier@gentoo.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Marek Vasut <marex@denx.de>, Huang Shijie <shijie.huang@intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Ben Hutchings <ben@decadent.org.uk>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for sst25wf020a.
Message-ID: <20150902205655.GX81844@google.com>
References: <1439573741-24491-1-git-send-email-aballier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439573741-24491-1-git-send-email-aballier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 14, 2015 at 07:35:39PM +0200, Alexis Ballier wrote:
> It is a 256KiB flash with 4 KiB erase sectors
> and 64KiB overlay blocks.
> 
> This is the one available on Hardkernel's Odroid U3 shield.
> 
> Signed-off-by: Alexis Ballier <aballier@gentoo.org>

Applied to l2-mtd.git
