Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f60P1-0000zC-8I
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 21:02:08 +0000
Received: by mail-wm0-x22a.google.com with SMTP id b21so997492wme.4
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 14:01:56 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: hisi: Avoid generic function names
To: Ezequiel Garcia <ezequiel@collabora.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, boris.brezillon@bootlin.com
References: <20180410200106.21173-1-ezequiel@collabora.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f2f9a818-e5d8-eb88-3a6c-56674d712f49@gmail.com>
Date: Tue, 10 Apr 2018 22:58:00 +0200
MIME-Version: 1.0
In-Reply-To: <20180410200106.21173-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/10/2018 10:01 PM, Ezequiel Garcia wrote:
> Using generic names such as get_if_type() is frowned
> upon: it suggests a core function (which is not),
> and then it makes code navigation harder.
> 
> Given drivers are often used as starting point
> to write other drivers, generic names tend to spread
> like the flu. Cure the problem.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
