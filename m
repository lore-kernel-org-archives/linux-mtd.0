Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USHpQ-00038s-4L
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 02:10:32 +0000
Message-ID: <516E04EF.1020307@freescale.com>
Date: Wed, 17 Apr 2013 10:11:59 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 08/11] mtd: add a new field for ecc info in the
 nand_flash_dev{}
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>	
 <1363605534-24776-9-git-send-email-b32955@freescale.com>
 <1366124195.23654.7.camel@sauron.fi.intel.com>
In-Reply-To: <1366124195.23654.7.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 matthieu.castet@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8816=E6=97=A5 22:56, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Mon, 2013-03-18 at 19:18 +0800, Huang Shijie wrote:
>> +#define ECC_INFO(strength, size)	(((strength)<<  16) | (size))
>> +#define ECC_STRENGTH(x)			(((x)>>  16)&  0xffff)
>> +#define ECC_SIZE(x)			((x)&  0xffff)
>> +	uint32_t ecc_info;
>>   };
> Could you please avoid putting macro definition in the middle of the
> structure. Put it before the structure.
>
> Also, probably prefixing with NAND_ would make sense?
got it.

thanks
Huang Shijie
