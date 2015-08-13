Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPvwi-0004oy-MR
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 17:05:41 +0000
Received: by oio137 with SMTP id 137so30175835oio.0
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 10:05:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SN1PR0301MB16469016E92281F646579FCB827D0@SN1PR0301MB1646.namprd03.prod.outlook.com>
References: <1439378899-5660-1-git-send-email-festevam@gmail.com>
 <20150813031239.GF108786@google.com>
 <SN1PR0301MB16469016E92281F646579FCB827D0@SN1PR0301MB1646.namprd03.prod.outlook.com>
Date: Thu, 13 Aug 2015 14:05:19 -0300
Message-ID: <CAOMZO5BD4a+Yj++_jBg-Rji3WrHX2TxkAWp29fV5GX2CSq6MQw@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: Kconfig: Remove unneeded help message
From: Fabio Estevam <festevam@gmail.com>
To: Li Frank <Frank.Li@freescale.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Fabio Estevam <Fabio.Estevam@freescale.com>,
 Huang Shijie <shijie.huang@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Xu Han <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frank,

On Thu, Aug 13, 2015 at 1:49 PM, Li Frank <Frank.Li@freescale.com> wrote:

>> I'm inclined to accept this patch, but I'm curious what the intention for the
>> original statement was. Does this mean "this controller could support generic
>> SPI, but this driver only bothers to implement the NOR flash protocol"?
>
> This controller doesn't support generic SPI.
> Just support connect to SPI NOR flash.

Thanks for the clarification.

I changed the Kconfig in v2 to make this clear as per your suggestion.

Regards,

Fabio Estevam
