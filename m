Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWQjg-0007WX-SG
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 16:47:55 +0000
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 02BB88EA21
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2017 17:47:27 +0100 (CET)
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-2-git-send-email-clg@kaod.org>
 <20170124151353.5bbffae0@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7bdf47c3-d3b7-92a2-47c1-99e4bd6b4f44@kaod.org>
Date: Wed, 25 Jan 2017 17:47:13 +0100
MIME-Version: 1.0
In-Reply-To: <20170124151353.5bbffae0@bbrezillon>
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

On 01/24/2017 03:13 PM, Boris Brezillon wrote:
> Hi Cédric,
> 
> On Mon, 16 Jan 2017 14:27:03 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> This can be used to easily identify a specific chip on a system with
>> multiple chips.
>>
>> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/mtdcore.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 052772f7caef..bf61557b599d 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -654,6 +654,13 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
>>   */
>>  static void mtd_set_dev_defaults(struct mtd_info *mtd)
>>  {
>> +	/*
>> +	 * If DT support is enabled and we have a valid of_node pointer, try to
>> +	 * extract the MTD name from the label property.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_OF) && mtd->dev.of_node)
>> +		of_property_read_string(mtd->dev.of_node, "label", &mtd->name);
>> +
> 
> I realize this kind of thing would be better placed in mtd_set_of_node()
> (see the patch below). Modifying the mtd->name pointer in the back of
> MTD drivers is not such a good idea (suppose the driver allocated the
> memory with a regular kmalloc() and tries to free mtd->name in the remove
> path).
> 
> If we move that to mtd_set_of_node(), drivers that wants to support this
> label property just have to check if mtd->name is NULL (after calling
> mtd_set_of_node() or nand_set_flash_node()) before assigning a default
> name.
> For unmodified drivers we keep the existing behavior: they'll just
> unconditionally override mtd->name with their own value (which might or
> might not be dynamically allocated).

ok. So the expected behavior looks correct to me, but adding a call to 
of_property_read_string() in the inline below feels a little hacky. 
Doesn't it ? 

May be we need an extra check on IS_ENABLED(CONFIG_OF) also ? 

Thanks,

C.

>>  	if (mtd->dev.parent) {
>>  		if (!mtd->owner && mtd->dev.parent->driver)
>>  			mtd->owner = mtd->dev.parent->driver->owner;
> 
> --->8---
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052b9ff9..a12b68f941e3 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -385,6 +385,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
>                                    struct device_node *np)
>  {
>         mtd->dev.of_node = np;
> +
> +       of_property_read_string(np, "label", mtd->name);
>  }
>  
>  static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
> 
> 
