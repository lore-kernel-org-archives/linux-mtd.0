Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDCBj-00055e-Bh
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 11:07:12 +0000
Message-ID: <1362568069.21850.28.camel@sauron>
Subject: Re: [PATCH V2 1/3] mtd: bcm47xxsflash: keep a reference to the BCMA
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 06 Mar 2013 13:07:49 +0200
In-Reply-To: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
References: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-06 at 12:01 +0100, Rafał Miłecki wrote:
> struct bcma_drv_cc;
> +
>  struct bcm47xxsflash {
> +	union {
> +		struct bcma_drv_cc *bcma_cc;
> +	};

Why union?

-- 
Best Regards,
Artem Bityutskiy
