Received: from mail-oa0-x22c.google.com ([2607:f8b0:4003:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLkRu-0006nr-2C
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 01:51:30 +0000
Received: by mail-oa0-f44.google.com with SMTP id g12so720732oah.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 18:51:09 -0700 (PDT)
Date: Mon, 16 Sep 2013 18:51:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: wang.bo116@zte.com.cn
Subject: Re: [PATCH] UBIFS: remove unnecessary code in ubifs_garbage_collect
Message-ID: <20130917015105.GM4550@ld-irv-0074.broadcom.com>
References: <OF476A1E1E.10D82F3D-ON48257BC9.002911AE-48257BC9.002A75A8@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF476A1E1E.10D82F3D-ON48257BC9.002911AE-48257BC9.002A75A8@zte.com.cn>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 16, 2013 at 03:43:36PM +0800, wang.bo116@zte.com.cn wrote:
> Hi,
> 	In ubifs_garbage_collect,local variable "space_before" calculate twice. In fact, at the
> beginning of the loop, there is no need to calculate this variable. Calculate it before call
> "ubifs_garbage_collect_leb" is enough. This patch just remove the unnecessary calculate code.
> 
> 
> 
> Signed-off-by: wang bo <wang.bo116@zte.com.cn>

Acked-by: Brian Norris <computersforpeace@gmail.com>
