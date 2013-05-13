Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubmoa-0005q3-U7
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:04:57 +0000
Message-ID: <1368428828.5360.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: nand_base: Use io{read, write}*_rep functions
 for transfer
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Mon, 13 May 2013 10:07:08 +0300
In-Reply-To: <1365831133-22245-1-git-send-email-shc_work@mail.ru>
References: <1365831133-22245-1-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-04-13 at 09:32 +0400, Alexander Shiyan wrote:
> This patch replaces the usage of loops in the nand_base code with
> io{read,write}{8,16}_rep calls instead.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
