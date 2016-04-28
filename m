Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avgwc-00033W-8j
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 08:05:06 +0000
Subject: Re: [PATCH 0/4] mtd: add support for pairing scheme description
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5721C41A.20105@nod.at>
Date: Thu, 28 Apr 2016 10:04:42 +0200
MIME-Version: 1.0
In-Reply-To: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
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

Am 25.04.2016 um 12:01 schrieb Boris Brezillon:
> Hi,
> 
> This series is the first step towards reliable MLC/TLC NAND support.
> Those patches allows the NAND layer to expose page pairing information
> to MTD users.
> The plan is to teach UBI about those constraints and let UBI code take
> the appropriate precautions when dealing with those multi-level cells
> NANDs. The way we'll handle this "paired pages" constraint will be
> described soon in a series adapting the UBI layer, so stay tune ;).
> 
> Note that this implementation only allows page pairing scheme description
> when the NAND has a full-id entry in the nand_ids table.
> This should be addressed in some way for ONFI and JEDEC NANDs, though
> I'm not sure how to handle this yet.
> 
> Best Regards,
> 
> Boris
> 
> Boris Brezillon (4):
>   mtd: introduce the mtd_pairing_scheme concept
>   mtd: nand: implement two pairing scheme
>   mtd: nand: add a pairing field to nand_flash_dev
>   mtd: nand: H27UCG8T2ATR: point to the correct pairing scheme
>     implementation

For the whole series:

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
