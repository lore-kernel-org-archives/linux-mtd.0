Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZULKJ-0008Ir-Tw
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 21:00:16 +0000
Received: by pacti10 with SMTP id ti10so62478227pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2015 13:59:54 -0700 (PDT)
Date: Tue, 25 Aug 2015 13:59:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Tomer Barletz <barletz@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Fix switch-bool compilation warning
Message-ID: <20150825205951.GO81844@google.com>
References: <20150802134845.GA31982@virgo.local>
 <1438747224-14125-1-git-send-email-barletz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438747224-14125-1-git-send-email-barletz@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 04, 2015 at 09:00:24PM -0700, Tomer Barletz wrote:
> With gcc 5.1 I get:
> warning: switch condition has boolean value [-Wswitch-bool]
> 
> Signed-off-by: Tomer Barletz <barletz@gmail.com>

Applied to l2-mtd.git
