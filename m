Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1cDg-0005o5-Qy
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 17:19:47 +0000
Received: by mail-wm0-x241.google.com with SMTP id d79so6090145wmi.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Apr 2017 10:19:24 -0700 (PDT)
Subject: Re: [PATCH v5 5/6] mtd: dataflash: Make use of "extened device
 information"
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org
References: <20170421163026.24884-1-andrew.smirnov@gmail.com>
 <20170421163026.24884-5-andrew.smirnov@gmail.com>
Cc: cphealy@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c998bbb1-1545-ce56-2f74-5fb83721269a@gmail.com>
Date: Fri, 21 Apr 2017 19:19:21 +0200
MIME-Version: 1.0
In-Reply-To: <20170421163026.24884-5-andrew.smirnov@gmail.com>
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

On 04/21/2017 06:30 PM, Andrey Smirnov wrote:
> In anticipation of supporting chips that need it, extend the size of
> struct flash_info's 'jedec_id' field to make room 2 byte of extended
> device information as well as add code to fetch this data during
> jedec_probe().
> 
> Cc: cphealy@gmail.com
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
> 
> Changes since [v4]:
> 
> 	- Corrected value of SUP_EXTID from BIT(3) to 0x0004
> 
> 	- Collected Acked-by from Marek

Super, entire series is great, thanks !

-- 
Best regards,
Marek Vasut
