Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq6rf-0008SG-72
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 19:51:35 +0000
Received: by mail-ob0-f179.google.com with SMTP id wm4so4295729obc.10
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 11:51:12 -0800 (PST)
Date: Mon, 9 Dec 2013 11:51:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH] JFFS2: NULL return of kmem_cache_zalloc should be handled.
Message-ID: <20131209195107.GS27149@ld-irv-0074.broadcom.com>
References: <1385980625-26545-1-git-send-email-yizhouzhou@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385980625-26545-1-git-send-email-yizhouzhou@ict.ac.cn>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Zhouyi Zhou <yizhouzhou@ict.ac.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 02, 2013 at 06:37:05PM +0800, Zhouyi Zhou wrote:
> NULL return of kmem_cache_zalloc should be handled in jffs2_alloc_xattr_datum
> and jff2_alloc_xattr_ref.
> 
> Signed-off-by: Zhouyi Zhou <yizhouzhou@ict.ac.cn>

Pushed to l2-mtd.git. Thanks!

Brian
