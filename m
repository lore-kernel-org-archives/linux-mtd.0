Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8xhn-0002JQ-RH
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 20:59:53 +0000
Received: by mail-pa0-f44.google.com with SMTP id et14so7207131pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 12:59:30 -0800 (PST)
Date: Wed, 7 Jan 2015 12:59:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Gu Zheng <guz.fnst@cn.fujitsu.com>
Subject: Re: [RESEND PATCH 1/3] mtd:mtdblock: remove the needless mtdblks_lock
Message-ID: <20150107205926.GO9759@ld-irv-0074>
References: <547E7348.5020204@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <547E7348.5020204@cn.fujitsu.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 03, 2014 at 10:19:52AM +0800, Gu Zheng wrote:
> The global lock mtdblks_lock was used to protect the original mtdblks
> array to avoid race conditions. As the mtdblks array was already gone,
> but the mtdblks_lock is left, and it causes latency when open/release dev.
> So we need to remove it here.
> 
> Signed-off-by: Gu Zheng <guz.fnst@cn.fujitsu.com>

Pushed this first patch to l2-mtd.git. Thanks!

I'm kinda ambivalent about the next two. They don't seem like necessary
cleanups, really. With the third patch, I think it's actually pretty
important that the caller understand that it's using container_of(). I
could be convinced otherwise though...

Brian
