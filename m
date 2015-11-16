Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZySpY-0001Ga-Bs
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 23:05:01 +0000
Received: by pabfh17 with SMTP id fh17so192256581pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 15:04:39 -0800 (PST)
Date: Mon, 16 Nov 2015 15:04:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 0/6] pxa3xx_nand: Assorted changes
Message-ID: <20151116230436.GS8456@google.com>
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 04, 2015 at 01:13:40PM -0300, Ezequiel Garcia wrote:
> This series contains a number of fixes and cleanups.
> As described below, this series doesn't seem to fix any
> currently known regression. IMO, there's no need to pick
> any of this for v4.4-rc.
> 
> The first patch fixes a timeout found when issuing a CMD_PARAM,
> without using the keep-config option. This timeout happens
> only on NFCv2 (i.e. Armada 370/375/XP) with the keep-config option.
> 
> Since all the Armada 370/375/XP boards currently specify
> keep-config, no user should be affected by the timeout.
> 
> The second patch is a fix for some leftovers issues from the
> recent cleanup series by Antoine. Altough the patch can be
> considered a fix, I'm not aware of any regression so I can't
> argue it should be queued as a fix.
> 
> The rest of the patches are either cleanups or improvements.
> 
> Patch 3 simplifies the code around keep-config and removes
> a silly goto.
> 
> Patch 4 removes the open-coded NAND chip sensing.
> 
> Patch 5 removes an unused macro.
> 
> Path 6 uses enable/disable clk to save power in resume/suspend
> paths.

Pushed all 6 to l2-mtd.git. Thanks!
