Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcAc4-0003c5-Cg
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 09:01:53 +0000
Message-ID: <1383296488.2722.74.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand_bbt: kill NAND_BBT_SCANALLPAGES
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Fri, 01 Nov 2013 11:01:28 +0200
In-Reply-To: <20131031190432.GB2498@localhost>
References: <1383186575-31328-1-git-send-email-computersforpeace@gmail.com>
 <20131031190432.GB2498@localhost>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-10-31 at 16:04 -0300, Ezequiel Garcia wrote:
> On Wed, Oct 30, 2013 at 10:29:35PM -0400, Brian Norris wrote:
> > Now that the last user of NAND_BBT_SCANALLPAGES has been removed, let's
> > kill this peculiar BBT feature flag.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Reviewed-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Yes, I do agree that we do not need to keep dead code just in case.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
Best Regards,
Artem Bityutskiy
