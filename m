Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGzJn-0003xC-2Q
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 01:24:47 +0000
Received: by mail-pa0-x22a.google.com with SMTP id cy9so244804681pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 17:24:27 -0800 (PST)
Date: Wed, 6 Jan 2016 17:24:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Insu Yun <wuninsu@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, taesoo@gatech.edu,
 yeongjin.jang@gatech.edu, insu@gatech.edu, changwoo@gatech.edu
Subject: Re: [PATCH] mtd: fixing memory leak and handling failed kmalloc
Message-ID: <20160107012424.GV109450@google.com>
References: <1451414709-8581-1-git-send-email-wuninsu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451414709-8581-1-git-send-email-wuninsu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 29, 2015 at 01:45:09PM -0500, Insu Yun wrote:
> kmalloc needs to be handled when failing in memory pressure.
> Also, it has memory leak in error routine.
> 
> Signed-off-by: Insu Yun <wuninsu@gmail.com>

Applied to l2-mtd.git
