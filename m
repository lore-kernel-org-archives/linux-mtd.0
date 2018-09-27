Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5cVs-0006kr-2c
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 20:04:00 +0000
Received: by mail-ot1-f66.google.com with SMTP id i12-v6so3840874otl.1
 for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2018 13:03:21 -0700 (PDT)
Date: Thu, 27 Sep 2018 15:03:19 -0500
From: Rob Herring <robh@kernel.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: robh@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v3 8/8] dt-binding: mtd: Document gpio-addr-flash
Message-ID: <20180927200319.GA5099@bogus>
References: <20180925204813.GA6450@bogus>
 <20180926063934.9229-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926063934.9229-1-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 Sep 2018 08:39:34 +0200, Ricardo Ribalda Delgado wrote:
> Add documentation for gpio-addr-flash. This binding allow creating
> flash devices that are paged using GPIOs.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> 
> Changelog v3: 
> 
> - Changes suggested by Rob Herring (Thanks!)
>   - Add gpio description
>   - Improve partition
> 
>  .../bindings/mtd/gpio-addr-flash.txt          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
