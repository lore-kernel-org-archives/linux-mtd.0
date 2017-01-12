Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRbYq-0007YG-Bn
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 09:20:47 +0000
Date: Thu, 12 Jan 2017 12:19:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 03/18] mtd-cfi_cmdset_0001: Add some spaces for better
 code readability
Message-ID: <20170112091926.GA15314@mwanda>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
 <a6f28358-3f8d-180e-9a59-b5ee276cb7d9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6f28358-3f8d-180e-9a59-b5ee276cb7d9@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 11, 2017 at 09:38:18PM +0100, SF Markus Elfring wrote:
> -		for (i=0; i<cfi->cfiq->NumEraseRegions; i++)
> -			for (j=0; j<cfi->numchips; j++)
> -				kfree(mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap);
> +		for (i = 0; i < cfi->cfiq->NumEraseRegions; i++)
> +			for (j = 0; j < cfi->numchips; j++)
> +				kfree(mtd->eraseregions[j
> +							* cfi->cfiq
> +							  ->NumEraseRegions
> +							+ i].lockmap);

No.

regards,
dan carpenter
