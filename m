Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VixHF-000133-IY
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 02:12:26 +0000
Received: by mail-ie0-f176.google.com with SMTP id at1so2249074iec.35
 for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2013 18:12:02 -0800 (PST)
Date: Tue, 19 Nov 2013 18:11:58 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 1/3] mtd: gpmi: remove the unnecessary pr_err()
Message-ID: <20131120021158.GG9468@ld-irv-0074.broadcom.com>
References: <1384829872-8714-1-git-send-email-b32955@freescale.com>
 <1384829872-8714-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384829872-8714-2-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 19, 2013 at 10:57:50AM +0800, Huang Shijie wrote:
> The error messages for the failure of dmaengine_prep_slave_sg are
> not necessary, this patch removes all these pr_err, and returns with
> the proper error code -EINVAL, not -1.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed patch 1 to l2-mtd.git/next. I'll wait for a new version of 2 and
3.

Brian
