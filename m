Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6Hfp-0000lm-6x
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2013 10:05:57 +0000
Message-ID: <1375697454.14869.423.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: detect OOB size for Toshiba 24nm raw SLC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 05 Aug 2013 13:10:54 +0300
In-Reply-To: <1372191479-28470-1-git-send-email-computersforpeace@gmail.com>
References: <1372191479-28470-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-06-25 at 13:17 -0700, Brian Norris wrote:
> Toshiba NAND datasheets have not been very forthcoming on OOB size
> information; they do not provide any bitfields in the ID string for
> spare area. In their 24nm technology flash, however, Toshiba migrated
> their NAND to have 32 bytes spare per 512 bytes of page area (up from
> the traditional 16 bytes), as they now require 8-bit ECC or higher.

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
