Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1US6KW-0006M6-Bh
 for linux-mtd@lists.infradead.org; Tue, 16 Apr 2013 13:53:54 +0000
Message-ID: <1366120517.2768.109.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 00/11] mtd: add datasheet's ECC information to nand_chip{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 16 Apr 2013 16:55:17 +0300
In-Reply-To: <1363605534-24776-1-git-send-email-b32955@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 matthieu.castet@parrot.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-18 at 19:18 +0800, Huang Shijie wrote:
> 1.) Why add the ECC information to the nand_chip{} ?
>    Each nand chip has its requirement for the ECC correctability, such as
>    "4bit ECC for each 512Byte" or "40bit ECC for each 1024Byte".
>    This ECC info is very important to the nand controller, such as gpmi.

Unfortunately no-one reviewed your patches. Let me CC Brian.

I've pushed patches 1-3 to l2-mtd.git so far.

-- 
Best Regards,
Artem Bityutskiy
