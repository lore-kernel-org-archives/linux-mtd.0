Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaeeD-0002wy-U8
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 05:14:06 +0000
Received: by mail-pa0-f49.google.com with SMTP id lj1so11614711pab.8
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 22:13:42 -0700 (PDT)
Date: Wed, 16 Apr 2014 22:13:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: fix __iomem annotations
Message-ID: <20140417051338.GI5512@norris-Latitude-E6410>
References: <1397638079-1894-1-git-send-email-computersforpeace@gmail.com>
 <534E4528.6030700@freescale.com>
 <20140416091512.GG5512@norris-Latitude-E6410>
 <534E4BA7.2040901@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <534E4BA7.2040901@freescale.com>
Cc: Marek Vasut <marex@denx.de>, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 16, 2014 at 05:21:43PM +0800, Huang Shijie wrote:
> 于 2014年04月16日 17:15, Brian Norris 写道:
> >Pushed to l2-mtd.git/spinor.
> I think you can rebase patches in the spinor branch to the master
> branch now.

I merged spinor into master for now, so it will be in -next. I think
I'll keep the separate branch, in case we need something stable for
others to pull in.

> After the rebase, we can add the patch for the *defconfig for the
> linux-next.

Yeah, I guess we should send patches. I'll try to do that soon.

Brian
