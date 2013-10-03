Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRkOW-0005tm-IB
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 15:00:49 +0000
Message-ID: <1380812414.27358.440.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] UBI: fix refill_wl_user_pool()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 03 Oct 2013 18:00:14 +0300
In-Reply-To: <1380376516-30144-2-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
 <1380376516-30144-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: richard.genoud@gmail.com, linux-mtd@lists.infradead.org,
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

On Sat, 2013-09-28 at 15:55 +0200, Richard Weinberger wrote:
> If no free PEBs are available refill_wl_user_pool() must not
> return with -ENOSPC immediately.
> It has to block till produce_free_peb() produced a free PEB.
> 
> Reported-and-Tested-by: Richard Genoud <richard.genoud@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

What is pool size, I wonder?

-- 
Best Regards,
Artem Bityutskiy
