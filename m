Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjCWa-00023j-Ty
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 18:29:17 +0000
Received: by mail-ie0-f172.google.com with SMTP id qd12so5140480ieb.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2013 10:28:54 -0800 (PST)
Date: Wed, 20 Nov 2013 10:23:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/2] the clean-up for gpmi
Message-ID: <20131120182309.GH9468@ld-irv-0074.broadcom.com>
References: <1384913384-27991-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384913384-27991-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 20, 2013 at 10:09:42AM +0800, Huang Shijie wrote:
> v2 --> v3:
> 	remove the prints for OOM.
> 
> Huang Shijie (2):
>   mtd: gpmi: change pr_err to dev_err
>   mtd: gpmi: change pr_debug to dev_dbg

Pushed both to l2-mtd.git/next. Thanks!

Brian
