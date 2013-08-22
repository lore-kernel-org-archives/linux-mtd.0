Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCaox-0000a9-TF
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 19:45:29 +0000
Received: by mail-pa0-f44.google.com with SMTP id fz6so1426262pac.31
 for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2013 12:45:05 -0700 (PDT)
Date: Thu, 22 Aug 2013 12:45:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: implement erasing support
Message-ID: <20130822194500.GC14837@ld-irv-0074.broadcom.com>
References: <1369163026-22257-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1369163026-22257-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 21, 2013 at 09:03:46PM +0200, Rafał Miłecki wrote:
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> This has been succesfully tested on BCM4706.
> ---
>  drivers/mtd/devices/bcm47xxsflash.c |   43 +++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)

Pushed to l2-mtd.git.

Thanks,
Brian
