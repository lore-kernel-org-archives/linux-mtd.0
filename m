Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeffA-0000Lw-SH
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 07:39:57 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NDJ00I3V19UCQB0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 16:39:30 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Michael Opdenacker' <michael.opdenacker@free-electrons.com>
References: <543F4CF0.8080404@free-electrons.com>
 <1413435515-12134-1-git-send-email-michael.opdenacker@free-electrons.com>
In-reply-to: <1413435515-12134-1-git-send-email-michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH v2] mtd: orion_nand: fix error code path in probe
Date: Thu, 16 Oct 2014 16:39:30 +0900
Message-id: <000e01cfe914$528cf160$f7a6d420$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: andrew@lunn.ch, 'Jingoo Han' <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, October 16, 2014 1:59 PM, Michael Opdenacker wrote:
> 
> This replaces kzalloc() and ioremap() calls by devm_ functions
> in the probe() routine, which automatically release the corresponding
> resources when probe() fails or when the device is removed.
> 
> This simplifies simplifies the error management code, and brings
> the below improvements or changes:
> 
> A. Fixing a bug reported by "make coccicheck":
> 
> If "board = devm_kzalloc()" fails, the probe() function jumps
> incorrectly to label "no_res" and therefore returns without
> running iounmap().
> 
> B. Requesting the memory region
> 
> Using devm_ioremap_resource() makes the probe() function request
> the corresponding memory region before running ioremap(), as
> it is supposed to do.
> 
> C. Standardizing the error codes:
> 
> The use of devm_ioremap_resource() changes the return value:
>  * -ENOMEM instead of -EIO in case of ioremap() failure,
>  * -EINVAL instead of -ENODEV in case of platform_get_resource()
>    failure.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/mtd/nand/orion_nand.c | 39 +++++++++++----------------------------
>  1 file changed, 11 insertions(+), 28 deletions(-)
