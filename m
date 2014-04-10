Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKC2-0007vE-Jg
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 18:59:23 +0000
Received: by mail-ig0-f181.google.com with SMTP id h18so4165735igc.2
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 11:59:01 -0700 (PDT)
Date: Thu, 10 Apr 2014 11:58:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 7/9] mtd: st_spi_fsm: kill duplicate CMD definitions
Message-ID: <20140410185856.GI32070@ld-irv-0074>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-7-git-send-email-computersforpeace@gmail.com>
 <20140410075653.GI4214@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140410075653.GI4214@lee--X1>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 10, 2014 at 08:56:53AM +0100, Lee Jones wrote:
> JOOI, have you build tested your changes?

Yes, I compile-tested yours. (But as Huang noticed, I failed to build
fsl-quadspi; my bad.)

> Non-tested:
>   Acked-by: Lee Jones <lee.jones@linaro.org>

Thanks. I'll be sending out v2 with a few tweaks to the other parts of
this series.

Brian
