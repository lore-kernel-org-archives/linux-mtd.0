Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9zNR-0007em-9e
 for linux-mtd@lists.infradead.org; Wed, 23 Jul 2014 16:26:49 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH] mtd: nand: omap: save Bad-Block-Table (BBT) on device
Date: Wed, 23 Jul 2014 16:26:19 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EB064F3@DBDE04.ent.ti.com>
References: <1406116461-27089-1-git-send-email-pekon@ti.com>
 <20140723120510.GA19677@arch.cereza>
In-Reply-To: <20140723120510.GA19677@arch.cereza>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Quadros,
 Roger" <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

>From: Ezequiel Garcia [mailto:ezequiel@vanguardiasur.com.ar]
>>On 23 Jul 05:24 PM, Pekon Gupta wrote:
>> This patch makes OMAP NAND driver to
>> - save Bad-Block-Table (BBT) on NAND Flash device
>> - scan on device BBT during probe
>>
>
>Doesn't this break backward compatibility? Please correct me if I'm wrong
>here, but if I apply this patch, and boot with my current NAND flash
>contents, the kernel won't have any place to store the BBT (assuming
>there are no blocks reserved).

Good point. I'll rather like your opinion to judge my below understanding
as you were recently involved in some NAND BBT features additions..

When bbt_options "NAND_BBT_USE_FLASH" is enabled, default BBT
options will be used which are:

$KERNEL/drivers/mtd/nand_bbt.c
static struct nand_bbt_descr bbt_main_descr =3D {
	.options =3D NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,

As default options have NAND_BBT_CREATE and NAND_BBT_WRITE,
so kernel will try to reserve erase-blocks for main-BBT and mirror-BBT
towards end of NAND device.

- Case-1: If there is un-allocated space (not allocated to any partition)
  at end of Flash device then it will be used. And there is no problem.

- Case-2: If there is no free space towards the end of flash, then ...
As per my understanding, the create_bbt() would try scanning whole
NAND to find empty blocks and then it creates BBT wherever it finds
empty blocks. And those blocks are marked as BAD with BBT signature
to prevent getting erased or over-written by any user-data.

Is my understanding correct?
If yes, then this will not break backward compatibility, as on upgrading
the kernel new BBT will be automatically written on first boot. And
it will be used in subsequent boots.
Need feedbacks ...

with regards, pekon
