Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtcGp-0002wu-3J
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 11:27:48 +0000
Received: by mail-ve0-f171.google.com with SMTP id b10so3615747vea.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2013 04:27:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1372655942.22014.2.camel@sauron.fi.intel.com>
References: <1367863561-11534-1-git-send-email-fabio.estevam@freescale.com>
 <1367863561-11534-5-git-send-email-fabio.estevam@freescale.com>
 <1372655942.22014.2.camel@sauron.fi.intel.com>
Date: Mon, 1 Jul 2013 08:27:21 -0300
Message-ID: <CAOMZO5B2tROWW9Qo5wDs4c9BCgXS0uHdf_vQLAZ7u8OwzG6gAg@mail.gmail.com>
Subject: Re: [PATCH 05/13] mtd: gpmi-nand : Let device core handle pinctrl
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 1, 2013 at 2:19 AM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
> On Mon, 2013-05-06 at 15:05 -0300, Fabio Estevam wrote:
>> Since commit ab78029 (drivers/pinctrl: grab default handles from device core),
>> we can rely on device core for handling pinctrl.
>>
>> So remove devm_pinctrl_get_select_default() from the driver.
>>
>> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Cc: <linux-mtd@lists.infradead.org>
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Thanks, Artem.

Could you please apply this into your tree?
