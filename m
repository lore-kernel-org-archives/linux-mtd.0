Message-ID: <4FBFB364.70601@newsguy.com>
Date: Fri, 25 May 2012 09:29:24 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/2] mtd mxc_nand: move ecc strengh setup before
 nand_scan_tail
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
 <1337955762-19157-2-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1337955762-19157-2-git-send-email-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/25/2012 07:22 AM, Sascha Hauer wrote:
> Since this commit:
> 
>   commit 6a918bade9dab40aaef80559bd1169c69e8d69cb
>   Author: Mike Dunn <mikedunn@newsguy.com>
>   Date:   Sun Mar 11 14:21:11 2012 -0700
> 
>      mtd: flash drivers set ecc strength
> 
> The mxc_nand driver fails with:
> 
> Driver must set ecc.strength when using hardware ECC
> 
> This is because nand_scan_tail checks for correct ecc strength
> settings, so we must set them up before nand_scan_tail.


Oops, sorry Sascha.  This was compile-tested only, but I should have ensured
strength was set before call to nand_scan_tail().

Thanks,
Mike
