Received: from mail-pd0-f178.google.com ([209.85.192.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCbz0-0002S8-S4
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 20:59:56 +0000
Received: by mail-pd0-f178.google.com with SMTP id w10so2391842pde.37
 for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2013 13:59:30 -0700 (PDT)
Date: Thu, 22 Aug 2013 13:59:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [RFC][PATCH] mtd: bcm47xxsflash: writing support
Message-ID: <20130822205926.GD14837@ld-irv-0074.broadcom.com>
References: <1369226342-20102-1-git-send-email-zajec5@gmail.com>
 <20130822194345.GB14837@ld-irv-0074.broadcom.com>
 <CACna6rwbARGHmD=CkvR_vRBLfkTamOrEXEyJhqBesXX5gS0csg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rwbARGHmD=CkvR_vRBLfkTamOrEXEyJhqBesXX5gS0csg@mail.gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 22, 2013 at 10:03:22PM +0200, Rafał Miłecki wrote:
> 2013/8/22 Brian Norris <computersforpeace@gmail.com>:
> > Hi Rafal,
> >
> > On Wed, May 22, 2013 at 02:39:02PM +0200, Rafał Miłecki wrote:
> >> ---
> >>  drivers/mtd/devices/bcm47xxsflash.c |  130 +++++++++++++++++++++++++++++++++--
> >>  1 file changed, 126 insertions(+), 4 deletions(-)
> >
> > Can I get a 'Signed-off-by'? Otherwise, is this patch good to go?
> 
> Of course! I posted it as RFC, so didn't add S-o-b, but no-one
> objected and this patch seems to be fine. I use it daily for half a
> year, it was recently picked up by OpenWrt and I didn't get any bug
> reports. So I think it's totally fine to push it :)
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Applied to l2-mtd.git.

Brian
