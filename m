Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQbJT-0004yi-RF
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:39:09 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v5 1/4] mtd: devices: elm: check for hardware engine's
 design constrains
Date: Thu, 20 Mar 2014 11:38:18 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB49CC@DBDE04.ent.ti.com>
References: <1393845563-7800-1-git-send-email-pekon@ti.com>
 <1393845563-7800-2-git-send-email-pekon@ti.com>
 <20140320105259.GM31517@norris-Latitude-E6410>
In-Reply-To: <20140320105259.GM31517@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 "Balbi,
 Felipe" <balbi@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]

Thanks a lot for picking up the other patch series.
These patches make OMAP NAND look cleaner, scalable and stable.

>> @@ -1559,9 +1561,10 @@ static int is_elm_present(struct omap_nand_info *=
info,
>>  	}
>>  	/* ELM module available, now configure it */
>>  	info->elm_dev =3D &pdev->dev;
>> -	if (elm_config(info->elm_dev, bch_type))
>> -		return -ENODEV;
>> -	return 0;
>> +	err =3D elm_config(info->elm_dev, bch_type,
>> +		(info->mtd.writesize / ecc->size), ecc->size, ecc->bytes);
>
>Isn't info->mtd.writesize / ecc->size the same as just ecc->steps?
>
'ecc->steps' gets its value in nand_scan_tail(), but this particular
check on ELM driver, gets executed before nand_scan_tail() is called
in driver probe(), so have do the ecc->steps calculation myself.

I'll include all other comments in next version..

with regards, pekon
