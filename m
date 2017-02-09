Received: from mail-wm0-f68.google.com ([74.125.82.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbvVl-0002Js-Kc
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 20:40:15 +0000
Received: by mail-wm0-f68.google.com with SMTP id r18so4611156wmd.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 12:39:53 -0800 (PST)
Subject: Re: [PATCH v3 0/2] Add a "label" property to the mtd device
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1486632068-14894-1-git-send-email-clg@kaod.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ceb3ad29-a5fc-86d5-a2f3-dd2c1620fc57@gmail.com>
Date: Thu, 9 Feb 2017 21:25:32 +0100
MIME-Version: 1.0
In-Reply-To: <1486632068-14894-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/09/2017 10:21 AM, Cédric Le Goater wrote:
> Hello,
> 
> Herer are a couple of patches adding a "label" property to the mtd
> device, which can be used to identify a specific chip on a system with
> multiple chips. This is common on the OpenPower boards, there can be
> four chips holding the firmware for the BMC and the firmware for the
> host, plus chips with golden images for recovery.

Series is
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> Thanks,
> 
> C.
> 
>  Changes since v2:
> 
>  - only assign device name from label if mtd->name is undefined
> 
>  Changes since v1:
> 
>  - moved the use of the "label" property from mtd_set_dev_defaults()
>    to mtd_set_of_node() to let drivers keep control on how mtd->name
>    is set and allocated.
> 
> Cédric Le Goater (2):
>   mtd: name the mtd device with an optional label property
>   dt-bindings: mtd: add a common label property to all mtd devices
> 
>  Documentation/devicetree/bindings/mtd/common.txt | 15 +++++++++++++++
>  include/linux/mtd/mtd.h                          |  3 +++
>  2 files changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/common.txt
> 


-- 
Best regards,
Marek Vasut
