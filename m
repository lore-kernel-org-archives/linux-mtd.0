Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VALMB-00044T-VS
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 14:50:28 +0000
Message-ID: <1376664938.2089.384.camel@sauron.fi.intel.com>
Subject: Re: [patch] mtd: nand: silence some shift wrap warnings
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Aug 2013 17:55:38 +0300
In-Reply-To: <20130809094904.GC29282@elgon.mountain>
References: <20130809094904.GC29282@elgon.mountain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-08-09 at 12:49 +0300, Dan Carpenter wrote:
> There are static checkers which complain when we declare variables as
> 64 bit bitfields but only use the lower 32 bits because of shift
> wrapping.  In this case "len" is declared as u64 as opposed to unsigned
> long or something which might be 32 bits.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
