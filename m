Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXj1R-000822-MX
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 02:13:26 +0000
Message-ID: <5181CC19.8000904@freescale.com>
Date: Thu, 2 May 2013 10:14:49 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH V4 5/9] mtd: replace the hardcode with the onfi_feature()
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
 <1366967337-5534-6-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9BF544@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9BF544@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8830=E6=97=A5 18:04, Gupta, Pekon =E5=86=99=
=E9=81=93:
>> -	*busw =3D 0;
>> -	if (le16_to_cpu(p->features)&  1)
>> -		*busw =3D NAND_BUSWIDTH_16;
>> +
>> +	*busw =3D (onfi_feature(chip)&  ONFI_FEATURE_16_BIT_BUS) ?
>> +			NAND_BUSWIDTH_16 : 0;
> Is this really needed ? you have already checked the 'onfi_version' abo=
ve in
> nand_flash_detect_onfi() ..
> 	if (!chip->onfi_version) {
> 		pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
> 		return 0;
> 	}
>
>
I think checking the onfi_version has no relationship with this patch. :)
This patch is just replace the hardcode for 16-bit onfi nand check.


thanks
Huang Shijie
