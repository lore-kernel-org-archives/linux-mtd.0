Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7908CC47DD9
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 22:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utWdUFqg8ID0FiBUqS2rMiivQHsbQZKC5QTYUHqxurk=; b=09kAGkwJrgFsJd
	QFF0+FpqVT5CRC/nJoA4YEymwZSF3rzcS8ay6g7zxNgjXLmYt2JASX/XKuQYJXzffBqs5LuiCCpPy
	MTcoGg5hvVAp4iD/RvC8WdILvVgJCJerHtW26e2DAdRIyfmI2ltDcE00G748vpcc00erQ1HVCyoOi
	zURN48N/QzBPSIOOAZdeqg+NBXMKo6glcR563LIEc/c35o1pRo0xIQUbJTY78U9k+e54d6ACyaSb8
	XorSBXbTqIqvhLncjYSqZoMh2MTY042cHNUwA7kb8hGH4zWN9YHmnNPTn7Pykzp12UxDHAQHMxmRV
	pePcWCIajXQu5PbPvhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpbYB-0000000BNTa-1trf;
	Wed, 27 Mar 2024 22:15:15 +0000
Received: from 16.mo581.mail-out.ovh.net ([46.105.72.216])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpbY7-0000000BNSA-1TUM
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 22:15:13 +0000
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.17.147])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4V4gvv2qnfz19l7
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2024 22:15:07 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xfkn4 (unknown [10.110.178.52])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E1CF91FD2C;
	Wed, 27 Mar 2024 22:15:03 +0000 (UTC)
Received: from milecki.pl ([37.59.142.107])
	by ghost-submission-6684bf9d7b-xfkn4 with ESMTPSA
	id gjE7MWeaBGY6QxIAbVqslg
	(envelope-from <rafal@milecki.pl>); Wed, 27 Mar 2024 22:15:03 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-107S0012491a7f4-335c-4194-8bbd-5f1ada98fd90,
                    AD8588E3BB83D84E59DEA8CE8674EAB20989D6B2) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 31.11.218.106
Message-ID: <30bc0d38-b610-4397-ba42-46819d5507fc@milecki.pl>
Date: Wed, 27 Mar 2024 23:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: limit OTP NVMEM Cell parse to non Nand devices
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240322040951.16680-1-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20240322040951.16680-1-ansuelsmth@gmail.com>
X-Ovh-Tracer-Id: 11126987304968301369
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudduiedgudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgeekvdfgleeuteeludfghfduvdffjeekhfehteefvefggeelheeludeuiedvueejnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_151511_724354_9667398F 
X-CRM114-Status: GOOD (  14.32  )
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

On 22.03.2024 05:09, Christian Marangi wrote:
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 5887feb347a4..0de87bc63840 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -900,7 +900,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
>   	config.name = compatible;
>   	config.id = NVMEM_DEVID_AUTO;
>   	config.owner = THIS_MODULE;
> -	config.add_legacy_fixed_of_cells = true;
> +	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
>   	config.type = NVMEM_TYPE_OTP;
>   	config.root_only = true;
>   	config.ignore_wp = true;

I think there may be even more unwanted behaviour here. If
mtd_otp_nvmem_register() fails to find node with "user-otp" /
"factory-otp" compatible then it sets "config.of_node" to NULL but that
means NVMEM core still looks for NVMEM cells in device's "of_node".

I believe we should not look for OTP NVMEM cells out of the "user-otp" /
"factory-otp" compatible nodes.

So maybe what we need in the first place is just:
config.add_legacy_fixed_of_cells = !!np;
?

Any extra limitation of .add_legacy_fixed_of_cells should probably be
used only if we want to prevent new users of the legacy syntax. The
problem is that mtd.yaml binding allowed "user-otp" and "factory-otp"
with old syntax cells. It means every MTD device was allowed to have
them.

No in-kernel DTS even used "user-otp" or "factory-otp" with NVMEM legacy
cells but I'm not sure about downstream DTS files. Ideally we would do
config.add_legacy_fixed_of_cells = false;
but that could break compatibility with some downstream DTS files.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
