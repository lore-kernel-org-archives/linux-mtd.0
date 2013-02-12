Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5I4a-0006Xb-OQ
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 15:47:09 +0000
Message-ID: <1360684037.12703.117.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 12 Feb 2013 17:47:17 +0200
In-Reply-To: <1359349039-11510-2-git-send-email-b32955@freescale.com>
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>
 <1359349039-11510-2-git-send-email-b32955@freescale.com>
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

On Mon, 2013-01-28 at 12:57 +0800, Huang Shijie wrote:
> +       {"SmartMedia 256MiB 3,3V",      {0, 0x71}, 512, 256, 0x4000 },
> +       {"SmartMedia 256MiB 3,3V ROM",  {0, 0x5b}, 512, 256, 0x4000,
> NAND_ROM},

Sorry for a possibly stupid question, but what does it buy you adding
another "0" to all the entries? I see you add another table, which you
look up if the "traditional" table does not work. Why you need to add
these zeroes?

-- 
Best Regards,
Artem Bityutskiy
