Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1US7HP-000863-9v
 for linux-mtd@lists.infradead.org; Tue, 16 Apr 2013 14:54:44 +0000
Message-ID: <1366124195.23654.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 08/11] mtd: add a new field for ecc info in the
 nand_flash_dev{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 16 Apr 2013 17:56:35 +0300
In-Reply-To: <1363605534-24776-9-git-send-email-b32955@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
 <1363605534-24776-9-git-send-email-b32955@freescale.com>
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
> +#define ECC_INFO(strength, size)	(((strength) << 16) | (size))
> +#define ECC_STRENGTH(x)			(((x) >> 16) & 0xffff)
> +#define ECC_SIZE(x)			((x) & 0xffff)
> +	uint32_t ecc_info;
>  };

Could you please avoid putting macro definition in the middle of the
structure. Put it before the structure.

Also, probably prefixing with NAND_ would make sense?

-- 
Best Regards,
Artem Bityutskiy
