Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y08YU-0007uy-5b
 for linux-mtd@lists.infradead.org; Sun, 14 Dec 2014 12:45:46 +0000
Received: by mail-wi0-f176.google.com with SMTP id ex7so6469851wid.3
 for <linux-mtd@lists.infradead.org>; Sun, 14 Dec 2014 04:45:20 -0800 (PST)
Message-ID: <548D85F1.5080606@vanguardiasur.com.ar>
Date: Sun, 14 Dec 2014 09:43:29 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: UBI: Add support for scatter gather and blk-mq
References: <1416845080-16663-1-git-send-email-richard@nod.at>
In-Reply-To: <1416845080-16663-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Richard,

On 11/24/2014 01:04 PM, Richard Weinberger wrote:
> This two patches implement blk-mq support for the UBI block driver.
> As the scatter gather part is rather generic I've moved it directl
> into UBI such that it can be reused later.
> So far only reading data into a scatter gather list is possible.
> After implementing  ubi_eba_read_leb_sg() we could slowly start
> removing a bunch of vmalloc() from the UBI core code and use scatter gather.
> This should lower the memory footprint of UBI.
> 
> [PATCH 1/2] UBI: Add initial support for scatter gather
> [PATCH 2/2] UBI: Block: Add blk-mq support
> 

Tried to apply these to take a look and run some tests, but 2/2 got
rejected. Which tag did you base them?

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
