Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBnL1-0006fK-LG
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 14:55:16 +0000
Message-ID: <1377010839.2089.571.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix invalidate_fastmap()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 20 Aug 2013 18:00:39 +0300
In-Reply-To: <1376944309-11342-1-git-send-email-richard@nod.at>
References: <1376944309-11342-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-19 at 22:31 +0200, Richard Weinberger wrote:
> Onging tests uncovered that invalidate_fastmap() is broken.
> It must not call ubi_wl_put_fm_peb() because all PEBs used
> by the old fastmap have already been put back.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed to linux-ubi.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
