Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYbTS-0003pU-Mo
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 16:40:09 +0000
Subject: Re: [PATCH] mtd: spi-nor: cqspi: remove redundant dead code on error
 return check
To: Colin King <colin.king@canonical.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
References: <20170131155317.20106-1-colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <630cf780-6cf5-ff5d-1a83-e360074483b4@nod.at>
Date: Tue, 31 Jan 2017 17:39:41 +0100
MIME-Version: 1.0
In-Reply-To: <20170131155317.20106-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 31.01.2017 um 16:53 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Checking for ret < 0 is redundant because a previous check on ret
> being non-zero already handles the ret < 0 case. Remove the redundant
> code. Found by CoverityScan, CID#1398863, CID#1398864
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
