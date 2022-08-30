Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B309ECAAD1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuEs5t9BRDjFmyfSZYgcjKYtDP7XoICJ0yqqqfxc0G4=; b=Kq3N7yuUI81t7zQBYzd0tjled1
	dynU7t5dY+HcYVgXSFcyCG+aYhMKNz2zJBdV0UNCufx+jj9N41ltFgGbGlJHja4hZPNpDv41zUORb
	OzuJKZQN3SsKpyu4nZimpMkCVmJZ2NiWxPBEi+N9zT/lqFZNJmjAd6reZUae0sNkwNNi1sO2igpEn
	/AYl2Vbl4nKfqFVB7GADrK52Mjh7C0TPoBfYdVK6mSH7CPQfIDWzoX8KQnhpfg04NDTFUMyju5+Sg
	RiWOLFY7LzoCYAjWjVL6WvmKuFiT5J5omZg5X7Ss8wqgN4/le367JFYWUvF0kWg9yj9gP9BXvGuT4
	QbD1O23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT278-00HYlO-7V; Tue, 30 Aug 2022 14:21:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT26t-00HYeH-OF; Tue, 30 Aug 2022 14:21:01 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F400B121;
	Tue, 30 Aug 2022 16:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661869255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ufgo92+9MD8lMZnJHj9JynwICztvJiv6z2nBDKJvsyU=;
	b=2yILkXih+cAfHWb8i3cp/6iRnfOrNCytTMCkSciINo9wWDbNKv1Fn9jWenJYKua0/vjE04
	aoxqLXbBcB2/Oe+kW78QNsAXD1pkHlJTv3M1V/5vjJ0/eJmyi29tWbDb4VMT4DgIDX7eta
	KdP7m8cj1Yh0ELjMnqleaTCEeMFKRunCmPsdLK8Otxp31CgWKGxF/W4EaZgv/zi4roTt6E
	1NvmXNqWYyzwysYs4OMlGxbQvDH0Dj950OCe1aikpPAv3gOh13SlHizqbeoPoP/Pcd5lMs
	3oB+zX+iWMm0Q+RgQM64NoGQFLpTP2We4OEIkQchlA3alLQ+/Sowy7OkqYM9GQ==
MIME-Version: 1.0
Date: Tue, 30 Aug 2022 16:20:54 +0200
From: Michael Walle <michael@walle.cc>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li
 Yang <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 07/14] nvmem: core: add per-cell post processing
In-Reply-To: <ddae21bf-a51b-7266-60ba-8a10c293888a@linaro.org>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-8-michael@walle.cc>
 <ddae21bf-a51b-7266-60ba-8a10c293888a@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9592f45176ae77799836391df92bb29e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_072100_016590_DCB445DD 
X-CRM114-Status: GOOD (  25.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2022-08-30 15:37, schrieb Srinivas Kandagatla:
> On 25/08/2022 22:44, Michael Walle wrote:
>> Instead of relying on the name the consumer is using for the cell, 
>> like
>> it is done for the nvmem .cell_post_process configuration parameter,
>> provide a per-cell post processing hook. This can then be populated by
>> the NVMEM provider (or the NVMEM layout) when adding the cell.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>   drivers/nvmem/core.c           | 16 ++++++++++++++++
>>   include/linux/nvmem-consumer.h |  5 +++++
>>   2 files changed, 21 insertions(+)
>> 
>> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>> index 5357fc378700..cbfbe6264e6c 100644
>> --- a/drivers/nvmem/core.c
>> +++ b/drivers/nvmem/core.c
>> @@ -52,6 +52,7 @@ struct nvmem_cell_entry {
>>   	int			bytes;
>>   	int			bit_offset;
>>   	int			nbits;
>> +	nvmem_cell_post_process_t post_process;
> 
> 
> two post_processing callbacks for cells is confusing tbh, we could
> totally move to use of cell->post_process.
> 
> one idea is to point cell->post_process to nvmem->cell_post_process
> during cell creation time which should clean this up a bit.

You'll then trigger the read-only check below for all the cells
if nvmem->cell_post_process is set.

> Other option is to move to using layouts for every thing.

As mentioned in a previous reply, I can't see how it could be
achieved. The problem here is that:
  (1) the layout isn't creating the cells, the OF parser is
  (2) even if we would create the cells, we wouldn't know
      which cell needs the post_process. So we are back to
      the situation above, were we have to add it to all
      the cells, making them read-only. [We depend on the
      name of the nvmem-consumer to apply the hook.

> prefixing post_process with read should also make it explicit that
> this callback is very specific to reads only.

good idea.

-michael

>>   	struct device_node	*np;
>>   	struct nvmem_device	*nvmem;
>>   	struct list_head	node;
>> @@ -468,6 +469,7 @@ static int 
>> nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
>>   	cell->offset = info->offset;
>>   	cell->bytes = info->bytes;
>>   	cell->name = info->name;
>> +	cell->post_process = info->post_process;
>>     	cell->bit_offset = info->bit_offset;
>>   	cell->nbits = info->nbits;
>> @@ -1500,6 +1502,13 @@ static int __nvmem_cell_read(struct 
>> nvmem_device *nvmem,
>>   	if (cell->bit_offset || cell->nbits)
>>   		nvmem_shift_read_buffer_in_place(cell, buf);
>>   +	if (cell->post_process) {
>> +		rc = cell->post_process(nvmem->priv, id, index,
>> +					cell->offset, buf, cell->bytes);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>>   	if (nvmem->cell_post_process) {
>>   		rc = nvmem->cell_post_process(nvmem->priv, id, index,
>>   					      cell->offset, buf, cell->bytes);
>> @@ -1608,6 +1617,13 @@ static int __nvmem_cell_entry_write(struct 
>> nvmem_cell_entry *cell, void *buf, si
>>   	    (cell->bit_offset == 0 && len != cell->bytes))
>>   		return -EINVAL;
>>   +	/*
>> +	 * Any cells which have a post_process hook are read-only because we
>> +	 * cannot reverse the operation and it might affect other cells, 
>> too.
>> +	 */
>> +	if (cell->post_process)
>> +		return -EINVAL;
> 
> Post process was always implicitly for reads only, this check should
> also tie the loose ends of cell_post_processing callback.
> 
> 
> --srini
>> +
>>   	if (cell->bit_offset || cell->nbits) {
>>   		buf = nvmem_cell_prepare_write_buffer(cell, buf, len);
>>   		if (IS_ERR(buf))
>> diff --git a/include/linux/nvmem-consumer.h 
>> b/include/linux/nvmem-consumer.h
>> index 980f9c9ac0bc..761b8ef78adc 100644
>> --- a/include/linux/nvmem-consumer.h
>> +++ b/include/linux/nvmem-consumer.h
>> @@ -19,6 +19,10 @@ struct device_node;
>>   struct nvmem_cell;
>>   struct nvmem_device;
>>   +/* duplicated from nvmem-provider.h */
>> +typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, 
>> int index,
>> +					 unsigned int offset, void *buf, size_t bytes);
>> +
>>   struct nvmem_cell_info {
>>   	const char		*name;
>>   	unsigned int		offset;
>> @@ -26,6 +30,7 @@ struct nvmem_cell_info {
>>   	unsigned int		bit_offset;
>>   	unsigned int		nbits;
>>   	struct device_node	*np;
>> +	nvmem_cell_post_process_t post_process;
>>   };
>>     /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
