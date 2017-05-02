Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5e2v-0007aG-Tt
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 20:05:20 +0000
Subject: Re: [PATCH v2 0/2] Add NAND driver mach dependency constraint
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org
References: <20170502194952.4188-1-ezequiel@vanguardiasur.com.ar>
Cc: boris.brezillon@free-electrons.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <16371fa7-ebaf-6901-e2a4-d1623924932e@nod.at>
Date: Tue, 2 May 2017 22:04:50 +0200
MIME-Version: 1.0
In-Reply-To: <20170502194952.4188-1-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.05.2017 um 21:49 schrieb Ezequiel Garcia:
> Just two tiny and silly patches I came across while doing
> other things and testing with tiny_defconfig.
> 
> Changes from v1:
> 
>   * Add COMPILE_TEST, suggested by Boris.
> 
> Ezequiel Garcia (2):
>   mtd: nand: Add Hisilicon machine dependency
>   mtd: nand: Add Mediatek machine dependency

Both look good to me.

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
