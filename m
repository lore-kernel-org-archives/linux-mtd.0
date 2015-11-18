Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zz7Xo-0001pY-Vk
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 18:33:25 +0000
Received: by padhx2 with SMTP id hx2so52537232pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 10:33:03 -0800 (PST)
Date: Wed, 18 Nov 2015 10:32:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH v2] mtd: fsl-quadspi: possible NULL dereference
Message-ID: <20151118183259.GD140057@google.com>
References: <1447699339-43027-1-git-send-email-computersforpeace@gmail.com>
 <1447699530-50014-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447699530-50014-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 10:45:30AM -0800, Brian Norris wrote:
> It is theoretically possible to probe this driver without a matching
> device tree, so let's guard against this.
> 
> Also, use the of_device_get_match_data() helper to make this a bit
> simpler.
> 
> Coverity complained about this one.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Han Xu <han.xu@freescale.com>
> ---
> v2:
>  * missed a 'const' warning
>  * s/reference/dereference in $subject

Pushed to l2-mtd.git
