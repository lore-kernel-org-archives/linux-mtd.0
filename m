Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSY8u-00081C-4D
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:54:24 +0000
Received: by bwz14 with SMTP id 14so1012791bwz.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 08:54:22 -0800 (PST)
Subject: Re: [PATCH 27/30] mtd: don't use flush_scheduled_work()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tejun Heo <tj@kernel.org>
In-Reply-To: <1292086307-19211-28-git-send-email-tj@kernel.org>
References: <1292086307-19211-1-git-send-email-tj@kernel.org>
	<1292086307-19211-28-git-send-email-tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 18:53:53 +0200
Message-ID: <1292345633.2538.101.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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

On Sat, 2010-12-11 at 17:51 +0100, Tejun Heo wrote:
> flush_scheduled_work() is deprecated and scheduled to be removed.
> Directly flush cxt->work_{erase|write} on removal instead.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> ---
> This is part of a series to remove flush_scheduled_work() usage to
> prepare for deprecation of flush_scheduled_work().  Patches in this
> series are self contained and mostly straight-forward.
> 
> Please feel free to take it into the appropriate tree, or just ack it.
> In the latter case, I'll merge the patch through the workqueue tree
> during the next merge window.
> 
> If you're seeing this patch for the second time, it's because the
> commit hasn't showed up in mainline yet.  Please let me know what
> should be done.

Pushed to l2-mtd-2.6.git, thanks. This means this will be merged to the
mtd tree a bit later and will go upstream.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
