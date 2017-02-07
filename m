Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbBWt-0003Jf-Sz
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2017 19:34:22 +0000
Subject: Re: [PATCH v8 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
To: Zach Brown <zach.brown@ni.com>, dwmw2@infradead.org
References: <1484076621-7789-1-git-send-email-zach.brown@ni.com>
 <1484076621-7789-3-git-send-email-zach.brown@ni.com>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <acc83b35-6dd6-9cd0-6f7c-e0aa3f866ed0@nod.at>
Date: Tue, 7 Feb 2017 20:33:53 +0100
MIME-Version: 1.0
In-Reply-To: <1484076621-7789-3-git-send-email-zach.brown@ni.com>
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

Am 10.01.2017 um 20:30 schrieb Zach Brown:
> From: Jeff Westfahl <jeff.westfahl@ni.com>
> 
> If the user has not set max_beb_per1024 using either the cmdline or
> Kconfig options for doing so, use the MTD function 'max_bad_blocks' to
> compute the UBI bad_peb_limit.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>

Does this patch go via the MTD tree?
In this case:
Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
