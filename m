Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcaXA-00078j-Pz
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 12:10:17 +0000
Message-ID: <1368619956.15764.100.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 02/11] mtd: increase max OOB size to 744
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 15 May 2013 15:12:36 +0300
In-Reply-To: <1368607232-2210-3-git-send-email-b32955@freescale.com>
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-3-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-15 at 16:40 +0800, Huang Shijie wrote:
> The oob size of Micron's MT29F64G08CBABAWP is 744 bytes.
> So increase the NAND_MAX_OOBSIZE to 744.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

OK, this patch is really independent. I do not know why you put it to
this series. Let me apply it separately.

-- 
Best Regards,
Artem Bityutskiy
