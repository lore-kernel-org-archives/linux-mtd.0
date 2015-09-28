Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zghiz-0000so-Gj
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 23:20:50 +0000
Received: by padhy16 with SMTP id hy16so186747189pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 16:20:28 -0700 (PDT)
Date: Mon, 28 Sep 2015 16:20:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Yaowei Bai <bywxiaobai@163.com>
Cc: viro@zeniv.linux.org.uk, dwmw2@infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] fs/jffs2: remove unnecessary new_valid_dev check
Message-ID: <20150928232026.GO31505@google.com>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
 <1443449738-5424-1-git-send-email-bywxiaobai@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443449738-5424-1-git-send-email-bywxiaobai@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 28, 2015 at 10:15:38PM +0800, Yaowei Bai wrote:
> As new_valid_dev always returns 1, so !new_valid_dev check is not
> needed, remove it.
> 
> Signed-off-by: Yaowei Bai <bywxiaobai@163.com>

Pushed to l2-mtd.git
