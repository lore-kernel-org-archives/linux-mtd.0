Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQyV7-00077I-AF
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 12:56:57 +0000
Message-ID: <1410180990.10764.164.camel@sauron.fi.intel.com>
Subject: Re: [PATCH][V2] UBI: block: fix dereference on uninitialized dev
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Colin King <colin.king@canonical.com>
Date: Mon, 08 Sep 2014 15:56:30 +0300
In-Reply-To: <1408526378-12972-1-git-send-email-colin.king@canonical.com>
References: <1408526378-12972-1-git-send-email-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 ezequiel.garcia@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-08-20 at 10:19 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> commit 4df38926f337 ("UBI: block: Avoid disk size integer overflow")
> introduced a dereference on dev (which is not initialized at that
> point) when printing a warning message.  Re-order disk_capacity check
> after the dev is found.
> 
> Found by cppcheck:
>  [drivers/mtd/ubi/block.c:509]: (error) Uninitialized variable: dev

Picked this one, thanks!

-- 
Best Regards,
Artem Bityutskiy
