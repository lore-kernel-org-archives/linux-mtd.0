Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uanl1-0006pL-D8
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 13:53:12 +0000
Message-ID: <1368194136.26780.165.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: print @adr when write timeout occurs
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 10 May 2013 16:55:36 +0300
In-Reply-To: <1364809218-28393-1-git-send-email-b32955@freescale.com>
References: <1364809218-28393-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-04-01 at 17:40 +0800, Huang Shijie wrote:
> Print out the @adr when the write timeout occurs.
> This is useful to check if the write timeouts occur at the
> same address.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
