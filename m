Received: from mail-db9lp0249.outbound.messaging.microsoft.com
 ([213.199.154.249] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlEn4-00062z-V0
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 09:18:43 +0000
Message-ID: <5294683B.6010704@freescale.com>
Date: Tue, 26 Nov 2013 17:22:03 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <52944E45.6070803@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA4ECA1@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA4ECA1@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8826=E6=97=A5 15:49, Gupta, Pekon =E5=86=99=
=E9=81=93:
>> From: Huang Shijie [mailto:b32955@freescale.com]
> [...]
>>> @@ -3033,6 +3028,12 @@ static int nand_flash_detect_onfi(struct
>> mtd_info *mtd, struct nand_chip *chip,
>>>    	}
>> If it is 16bit bus, could we reconfigure the bus width in here?
>> it's better to limit the influence only in the ONFI code.
>>
> Yes I too wanted same, but then once a device is found in
> nand_flash_id[] table, ONFI probe is not done ..
> Refer below code in nand_base.c
> 	@@ nand_get_flash_type()
> 	if (!type->name || !type->pagesize) {
> 			/* Check is chip is ONFI compliant */
> 			if (nand_flash_detect_onfi(mtd, chip,&busw))
>
> Thus, if we want to truly auto-detection, then we need to
> set bus-width in both cases
> (1) when NAND device is detected based on nand_flash_id[] table
If the bus-width is not the same. we'd better return with -EINVAL to tell
the user that he has a wrong configuration.

so i do not suggest we remove the -EINVAL code of nand_get_flash_type().
(I am not sure whether we should remove the NAND_BUSWIDTH_AUTO, let=20
Brian judge it)


> (2) when NAND device is detected based on ONFI probe
>
Just as suspend/resume, if we do the same thing in the ONFI probe,

we do not need to remove the -EINVAL code of the nand_get_flash_type().


thanks
Huang Shijie
