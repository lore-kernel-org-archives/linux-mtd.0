Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrcO-0000Da-N6
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:50:09 +0000
Received: by mail-pd0-f178.google.com with SMTP id y10so3074906pdj.23
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:49:47 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:49:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH v2] mtd: orion_nand: fix error code path in probe
Message-ID: <20141022084944.GK16128@brian-ubuntu>
References: <543F4CF0.8080404@free-electrons.com>
 <1413435515-12134-1-git-send-email-michael.opdenacker@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413435515-12134-1-git-send-email-michael.opdenacker@free-electrons.com>
Cc: andrew@lunn.ch, jg1.han@samsung.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 16, 2014 at 06:58:35AM +0200, Michael Opdenacker wrote:
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

Pushed to l2-mtd.git. Thanks!

Brian
