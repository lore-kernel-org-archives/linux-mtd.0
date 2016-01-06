Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGxKu-0003HY-4k
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 23:17:48 +0000
Received: by mail-pa0-x236.google.com with SMTP id cy9so242405297pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 15:17:27 -0800 (PST)
Date: Wed, 6 Jan 2016 15:17:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geliang Tang <geliangtang@163.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] jffs2: use to_delayed_work
Message-ID: <20160106231724.GN109450@google.com>
References: <87ea17d237ec636e674f8be097a7e65cbce4d252.1451656900.git.geliangtang@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ea17d237ec636e674f8be097a7e65cbce4d252.1451656900.git.geliangtang@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 01, 2016 at 10:06:27PM +0800, Geliang Tang wrote:
> Use to_delayed_work() instead of open-coding it.
> 
> Signed-off-by: Geliang Tang <geliangtang@163.com>

Applied to l2-mtd.git
