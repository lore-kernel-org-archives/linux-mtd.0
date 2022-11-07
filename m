Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E2CC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VabkuAT1wva4Ta6S2KMcDtUXyK8xNIEatgIoy6qweHI=; b=3jOb4iBq10dPYg
	UpzcLU+gXeqxRBMxBhJPD1HcX6vG6zHf8xnLqK6f505bBrzy5gqLvCh7F9TSZ36KZgvb9FaeXPCoY
	4E0aMOFTBqSH0E8EfAMV4yQ4bcXrYIWKo4trjEI5u/gI0eq8FPosgmg3NByq3LlgV33DYS6PbmnsI
	uBIfraSYzgz97hCDmCpbfc0oQ5PQvLhlkRrfEbs17QVL2FxIbXLwNFocgzk7G5514/g8hcfQzSbOm
	KlCnesKbUhQV2TClpsfjP5FIBZcYETngUhIpRxeWJpy/xszzjheUoFDB3ZUmKx9Zg5FcwRnmtmni7
	Fmzfi+eaMLQNlvvgquOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4Yu-00Fyw7-Lg; Mon, 07 Nov 2022 16:01:24 +0000
Received: from 18.mo582.mail-out.ovh.net ([46.105.73.110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4Yq-00Fyuq-1o
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:01:22 +0000
Received: from player693.ha.ovh.net (unknown [10.110.171.173])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id C2BEA2493F
	for <linux-mtd@lists.infradead.org>; Mon,  7 Nov 2022 16:01:11 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
	(Authenticated sender: rafal@milecki.pl)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id D813A3071665A;
	Mon,  7 Nov 2022 16:01:04 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G002277d2aac-3570-423b-9565-975ba2f56ae4,
                    25B4C09D18989E316CCFFAFCA2B6B1B761CAC7E4) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <4a9cbb40-e83f-b117-3ea4-38ff582e2db8@milecki.pl>
Date: Mon, 7 Nov 2022 17:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized
 variable bug
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <Y1gCALFWXYYwqV1P@kili> <20221107165238.17bbc8fe@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20221107165238.17bbc8fe@xps-13>
X-Ovh-Tracer-Id: 3154208593138264955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepheekvedtiedufeeffeejveffvdetuefhgeffgfevfeffjeekueeiteeuvedtuedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080120_427162_3977C9A7 
X-CRM114-Status: GOOD (  17.74  )
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

On 7.11.2022 16:52, Miquel Raynal wrote:
> Hi Dan,
> 
> dan.carpenter@oracle.com wrote on Tue, 25 Oct 2022 18:34:24 +0300:
> 
>> On 64 bit systems, the highest 32 bits of the "offset" variable are
>> not initialized.  Also the existing code is not endian safe (it will
>> fail on big endian systems).  Change the type of "offset" to a u32.
>>
>> Fixes: aec4d5f5ffd0 ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>   drivers/mtd/parsers/tplink_safeloader.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
>> index 23584a477391..f601e7bd8627 100644
>> --- a/drivers/mtd/parsers/tplink_safeloader.c
>> +++ b/drivers/mtd/parsers/tplink_safeloader.c
> 
> I am sorry but I don't have this file in my tree, what kernel are you
> using?

https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=mtd/next
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=mtd/next&id=aec4d5f5ffd0f0092bd9dc21ea90e0bc237d4b74

(committer Miquel Raynal ;) )


>> @@ -23,8 +23,8 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
>>   	struct safeloader_cmn_header hdr;
>>   	struct device_node *np;
>>   	size_t bytes_read;
>> -	size_t offset;
>>   	size_t size;
>> +	u32 offset;
>>   	char *buf;
>>   	int err;
>>   
>> @@ -34,14 +34,14 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
>>   	else
>>   		np = of_get_child_by_name(np, "partitions");
>>   
>> -	if (of_property_read_u32(np, "partitions-table-offset", (u32 *)&offset)) {
>> +	if (of_property_read_u32(np, "partitions-table-offset", &offset)) {
>>   		pr_err("Failed to get partitions table offset\n");
>>   		goto err_put;
>>   	}
>>   
>>   	err = mtd_read(mtd, offset, sizeof(hdr), &bytes_read, (uint8_t *)&hdr);
>>   	if (err && !mtd_is_bitflip(err)) {
>> -		pr_err("Failed to read from %s at 0x%zx\n", mtd->name, offset);
>> +		pr_err("Failed to read from %s at 0x%x\n", mtd->name, offset);
>>   		goto err_put;
>>   	}
>>   

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
