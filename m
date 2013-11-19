Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vimj3-0001ZM-VH
 for linux-mtd@lists.infradead.org; Tue, 19 Nov 2013 14:56:28 +0000
Date: Tue, 19 Nov 2013 11:56:02 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 2/3] mtd: gpmi: change pr_err to dev_err
Message-ID: <20131119145601.GA19739@localhost>
References: <1384829872-8714-1-git-send-email-b32955@freescale.com>
 <1384829872-8714-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1384829872-8714-3-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Tue, Nov 19, 2013 at 10:57:51AM +0800, Huang Shijie wrote:
>  
>  	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
>  	if (!this) {
> -		pr_err("Failed to allocate per-device memory\n");
> +		dev_err(&pdev->dev, "Failed to allocate per-device memory\n");
>  		return -ENOMEM;
>  	}
>  

For all the kmalloc variants you should *never* print *any* OOM messages.

If the kernel has ran out of memory to satisfy an allocation you'll get
far more descriptive errors from the mm subsystem, with a backtrace and
some more goodies ;-)

So, the patch should actually remove this entire print.

Joe Perches has been removing this messages all kernel wide:
http://archive.linuxvirtualserver.org/html/lvs-devel/2011-08/msg00001.html
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
