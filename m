Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enlVJ-0008Jh-Tp
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 13:29:16 +0000
From: Richard Weinberger <richard@nod.at>
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 maximlevitsky@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
 outreachy-kernel@googlegroups.com
Subject: Re: [PATCH NAND v2] mtd: nand: Replace printk() with appropriate
 pr_*macro()
Date: Mon, 19 Feb 2018 14:30:11 +0100
Message-ID: <5296610.PbIriun04K@blindfold>
In-Reply-To: <1519046025-9412-1-git-send-email-shreeya.patel23498@gmail.com>
References: <1519046025-9412-1-git-send-email-shreeya.patel23498@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shreeya,

Am Montag, 19. Februar 2018, 14:13:45 CET schrieb Shreeya Patel:
> The log levels embedded with the name are more concise than
> printk.
> Replace printks having a log level with the appropriate
> pr_*macro.
> 
> Signed-off-by: Shreeya Patel <shreeya.patel23498@gmail.com>

Multiple patches with the same subject are confusing. :)

Thanks,
//richard 
