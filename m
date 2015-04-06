Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YevaY-0005dT-FR
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 01:12:30 +0000
Received: by pddn5 with SMTP id n5so28594389pdd.2
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 18:12:09 -0700 (PDT)
Date: Sun, 5 Apr 2015 18:12:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 1/2] mtd: mtd_oobtest: Fix bitflip_limit usage in test
 case 3
Message-ID: <20150406011206.GK2677@norris-Latitude-E6410>
References: <1417792720-3017-1-git-send-email-rogerq@ti.com>
 <1417792720-3017-2-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417792720-3017-2-git-send-email-rogerq@ti.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, akinobu.mita@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 05, 2014 at 05:18:39PM +0200, Roger Quadros wrote:
> In test case 3, we set vary_offset to write at different
> offsets and lengths in the OOB available area. We need to
> do the bitflip_limit check while checking for 0xff outside the
> OOB offset + length area that we didn't modify during write.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>

Applied patch 1 to l2-mtd.git. Patch 2 couldn't be applied cleanly.

Brian
