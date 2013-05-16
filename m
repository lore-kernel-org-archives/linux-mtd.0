Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcuZj-0006kE-Qg
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 09:34:16 +0000
Message-ID: <1368696992.15764.188.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 01/11] mtd: add datasheet's ECC information to
 nand_chip{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Thu, 16 May 2013 12:36:32 +0300
In-Reply-To: <51949378.6020005@freescale.com>
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-2-git-send-email-b32955@freescale.com>
 <1368619917.15764.99.camel@sauron.fi.intel.com>
 <51944184.7090107@freescale.com>
 <1368688465.15764.172.camel@sauron.fi.intel.com>
 <51949378.6020005@freescale.com>
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

On Thu, 2013-05-16 at 16:06 +0800, Huang Shijie wrote:
> what's about add the "_datasheet" for these two fields?
> such as
> 
> ecc_strength__datasheet;ecc_step__datasheet

May be, if these are not too long names. Or ecc_ds_strignth /
ecc_ds_step, for example.

-- 
Best Regards,
Artem Bityutskiy
