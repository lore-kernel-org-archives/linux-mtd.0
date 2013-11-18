Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViVNS-000677-Ut
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 20:24:59 +0000
Received: by mail-ie0-f179.google.com with SMTP id u16so9174931iet.24
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 12:24:37 -0800 (PST)
Date: Mon, 18 Nov 2013 12:24:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 8/8] mtd: gpmi: change pr_debug to dev_dbg
Message-ID: <20131118202434.GD9468@ld-irv-0074.broadcom.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
 <1384410351-2169-9-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384410351-2169-9-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 02:25:51PM +0800, Huang Shijie wrote:
> Change all the pr_debug to dev_dbg.
> Remove the pr_fmt too, since we do not need it.

Not taking this patch yet, since I believe the pr_fmt() removal is
dependent on the previous patch.

Brian
