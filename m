Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXT3V-0004w9-8X
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 10:47:18 +0000
Message-ID: <1411728368.23429.64.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] UBI: ubi_eba_read_leb: Remove in vain variable
 assignment
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 26 Sep 2014 13:46:08 +0300
In-Reply-To: <1411375536-20067-1-git-send-email-richard@nod.at>
References: <1411375536-20067-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-09-22 at 10:45 +0200, Richard Weinberger wrote:
> There is no need to set err, it will be overwritten in any case
> later at:
>         if (scrub)
>                 err = ubi_wl_scrub_peb(ubi, pnum);
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed the first 2 patches, thanks!

-- 
Best Regards,
Artem Bityutskiy
