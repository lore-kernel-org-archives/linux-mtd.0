Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYY6X-0003Xb-Rn
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2016 11:59:42 +0000
Message-ID: <1456315158.4719.3.camel@linux.intel.com>
Subject: Re: [PATCH] mtd: onenand: fix deadlock in onenand_block_markbad
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Kyungmin Park
 <kyungmin.park@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Date: Wed, 24 Feb 2016 13:59:18 +0200
In-Reply-To: <1455988749-14563-1-git-send-email-aaro.koskinen@iki.fi>
References: <1455988749-14563-1-git-send-email-aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2016-02-20 at 19:19 +0200, Aaro Koskinen wrote:
> -       ret = mtd_block_markbad(mtd, ofs);
> +       this->block_markbad(mtd, ofs);
>         onenand_release_device(mtd);
>         return ret;

What do we return then?

-- 
Best Regards,
Artem Bityutskiy
