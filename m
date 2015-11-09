Received: from shards.monkeyblade.net ([2001:4f8:3:36:211:85ff:fe63:a549])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvpHS-0006jJ-Ir
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 16:26:55 +0000
Date: Mon, 09 Nov 2015 11:26:29 -0500 (EST)
Message-Id: <20151109.112629.1860510744923009883.davem@davemloft.net>
To: jack@suse.cz
Cc: penguin-kernel@I-love.SAKURA.ne.jp, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux@arm.linux.org.uk, linux-acpi@vger.kernel.org,
 drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oleg.drokin@intel.com,
 andreas.dilger@intel.com, codalist@coda.cs.cmu.edu,
 linux-mtd@lists.infradead.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] tree wide: Use kvfree() than conditional kfree()/vfree()
From: David Miller <davem@davemloft.net>
In-Reply-To: <20151109121126.GD11149@quack.suse.cz>
References: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <20151109121126.GD11149@quack.suse.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jan Kara <jack@suse.cz>
Date: Mon, 9 Nov 2015 13:11:26 +0100

> You can add
> 
> Acked-by: Jan Kara <jack@suse.com>
> 
> for the UDF and fs/xattr.c parts.

Please do not quote and entire large patch just to give an ACK.

Just quote the minimum necessary context, which is usually just
the commit message.
