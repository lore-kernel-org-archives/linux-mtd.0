Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG2wl-0003pS-C3
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 07:51:32 +0000
Message-ID: <1363247544.11441.84.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: use more reasonable integer types
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Date: Thu, 14 Mar 2013 09:52:24 +0200
In-Reply-To: <1363176300-9016-1-git-send-email-dedekind1@gmail.com>
References: <1363176300-9016-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-13 at 14:05 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Use 'unsigned int' instead of 'unsigned long' in the NAND chip description data
> structure, because 32-bits is more than enough for our purposes. We do not need
> 64-bits, which is what we end up on 64-bit architectures. We declare many
> instances of this data structure, so this should help saving some amount of
> memory.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Pushed to l2-mtd.git.

-- 
Best Regards,
Artem Bityutskiy
