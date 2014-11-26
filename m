Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xth3G-0002Sw-Un
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 18:10:55 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so3322498pab.12
 for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2014 10:10:33 -0800 (PST)
Date: Wed, 26 Nov 2014 10:10:30 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: zhangxingcai <zhangxingcai@huawei.com>
Subject: Re: [PATCH 3/3] [PATCH] mtd: fix concurrent access to mtd->usecount
Message-ID: <20141126181030.GC21347@ld-irv-0074>
References: <1417008990-24413-1-git-send-email-zhangxingcai@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417008990-24413-1-git-send-email-zhangxingcai@huawei.com>
Cc: linux-mtd@lists.infradead.org, fengfuqiu@huawei.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, tanhaijun@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 26, 2014 at 09:36:30PM +0800, zhangxingcai wrote:
[...]

What series is this patch 3/3 of? It looks like it stands alone, and I
wasn't CC'd on anything else related to it.

Brian
