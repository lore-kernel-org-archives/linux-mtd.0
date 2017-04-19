Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0rlQ-0005H1-PG
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 15:43:30 +0000
Received: by mail-wm0-x244.google.com with SMTP id z129so5681707wmb.1
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 08:43:08 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] mtd: dataflash: Get rid of loop counter in
 jedec_probe()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org
References: <20170419152305.17226-1-andrew.smirnov@gmail.com>
 <20170419152305.17226-4-andrew.smirnov@gmail.com>
Cc: cphealy@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <490d8724-7cfe-601d-b5d4-95cc34c7a3c4@gmail.com>
Date: Wed, 19 Apr 2017 17:34:57 +0200
MIME-Version: 1.0
In-Reply-To: <20170419152305.17226-4-andrew.smirnov@gmail.com>
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

On 04/19/2017 05:23 PM, Andrey Smirnov wrote:
> "For" loop in jedec_probe can be simplified to not need counter
> 'i'. Convert the code and get rid of the variable.
> 
> Cc: cphealy@gmail.com
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
