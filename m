Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zq7-0007Ju-4W
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:32:38 +0000
Received: by pfu207 with SMTP id 207so33073046pfu.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:32:14 -0800 (PST)
Date: Fri, 4 Dec 2015 15:32:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Bayi Cheng <bayi.cheng@mediatek.com>
Subject: Re: [PATCH] mtd: mtk-quadspi: drop unnecessary .owner assignment
Message-ID: <20151204233211.GG120110@google.com>
References: <1448070013-139538-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448070013-139538-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 20, 2015 at 05:40:13PM -0800, Brian Norris wrote:
> As of commit 807f16d4db95 ("mtd: core: set some defaults when
> dev.parent is set"), the MTD core will set this for us.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Bayi Cheng <bayi.cheng@mediatek.com>

Applied to l2-mtd.git
