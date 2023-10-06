Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86050E92FF9
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8h/zZOkohqZNeJC5JJP5bqWdtSBUZ493alUK3guPug=; b=0LfSnG3Zp/r0Ek
	T3dgEnystFrrnX4Judn/+MsV0UJxCQWhNs/wtAovX71b91UOcQsPvLIvm+ldeMa8q7ZHdu2Uvj2cP
	WQ+gA8n9YQeX9xMAVz3YyxlNWc0gIwITA03UIhDxK9c7RRIcV9nblML0w04DR9Jrv9T2EjrK8+TLy
	3iEu9BBE1jmR3+4XV8PqSZbJ/+uHL6Ee92gd0yKeMVopI1eFjLPfJEKVmNQZXblyYUS3N+aleirvA
	yHJh/vVwkgMJIfg8htHOeWO2Gw+6wEAf+zFI76PBS36tH6IKR1wwbFrykYabY8s4dlV+ge70W8Bdy
	fRppld5j7Ve3gr+CMemg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoge5-005Kkh-1Z;
	Fri, 06 Oct 2023 08:57:17 +0000
Received: from 4.mo575.mail-out.ovh.net ([46.105.59.63])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoge1-005Kjb-1X
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 08:57:16 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.143.183])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 342E72B18C
	for <linux-mtd@lists.infradead.org>; Fri,  6 Oct 2023 08:56:44 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-sjltm (unknown [10.108.4.142])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A6FD21FFEB;
	Fri,  6 Oct 2023 08:56:06 +0000 (UTC)
Received: from milecki.pl ([37.59.142.95])
	by ghost-submission-6684bf9d7b-sjltm with ESMTPSA
	id p7moHqbLH2WiZgAAtb1txw
	(envelope-from <rafal@milecki.pl>); Fri, 06 Oct 2023 08:56:06 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0012bd9b646-870e-4c40-a2c0-065502643ead,
                    6C3A962D5FB84EDB42FF21950F28EC7FA4520884) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 31.11.218.106
Message-ID: <9a902653-7a67-4dbb-a522-1592dcdcada8@milecki.pl>
Date: Fri, 6 Oct 2023 10:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: Ensure NVMEM layouts get their of_node
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>
References: <20231004220437.405959-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20231004220437.405959-1-miquel.raynal@bootlin.com>
X-Ovh-Tracer-Id: 14675260861028608942
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgfeugfeljefgvdefhfegjeehjedthfehgeeuvdeukedugffhledthfeutefhhfdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_015713_823623_B8D44D69 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Miquel,

On 5.10.2023 00:04, Miquel Raynal wrote:
> All the nvmem-layouts logic expects an of_node to be available. When mtd
> started registering nvmem devices, the exact exposure was not yet
> decided and thus the no_of_node field was set to 1 to avoid exposing
> "too much". This has been lowered since we want children nodes of mtd
> devices with the "nvmem-cells" compatible to be actually registered in
> NVMEM. This is now also the case of the nvmem-layout containers.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I already sent a patch for that and it goes even further by completely
dropping "no_of_node" which isn't needed anymore. See:
[PATCH] Revert "nvmem: add new config option"
https://lore.kernel.org/lkml/ba3c419a-6511-480a-b5f2-6c418f9c02e7@gmail.com/t/

It's waiting for over 2 months already and just recently I re-asked
Srini to queue it so hopefully it won't miss another merge window.


> ---
>   drivers/mtd/mtdcore.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 061745acb9a7..60b670c42be5 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -543,6 +543,13 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
>   	return retlen == bytes ? 0 : -EIO;
>   }
>   
> +static bool mtd_contains_nvmem_layout(struct mtd_info *mtd)
> +{
> +	/* of_find_node_by_name() calls of_node_put() on the starting node */
> +	of_node_get(mtd->dev.of_node);
> +	return of_find_node_by_name(mtd->dev.of_node, "nvmem-layout");
> +}
> +
>   static int mtd_nvmem_add(struct mtd_info *mtd)
>   {
>   	struct device_node *node = mtd_get_of_node(mtd);
> @@ -559,7 +566,8 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>   	config.read_only = true;
>   	config.root_only = true;
>   	config.ignore_wp = true;
> -	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
> +	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells") ||
> +			    !mtd_contains_nvmem_layout(mtd);
>   	config.priv = mtd;
>   
>   	mtd->nvmem = nvmem_register(&config);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
