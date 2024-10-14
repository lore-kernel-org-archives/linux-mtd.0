Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5ECD16265
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2024 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwjUml0daM3BBbGvv9b8Ljgq++eBX2Rt5JHUenC1w6g=; b=ic06ityzEasKeC
	O2oqLzzisO4BdENJfGYL/0w1bXF0w+cBXMBVFtXeePWVpzjddqeMhc1AiykOi95iW3U/7eJjD5igH
	cWoB4PnvmzImNA+4YYDogNS7J21vsmG83nvuwGfJgD/Bhni8xfTo10SK0aiqBRRPkxH+8CO9O5VpV
	7MUW8nayPgLr4TFxgbNaQcoERKp9v7UMHRxwOpI2XNOncefBcxrVfb9Y3dIqurdrpNB3feJuDdwdG
	GZNYKEKD3/N7E47YIFRQlkFtlNHNOHNMyI8lnlrtsT1M4wx486B2irEl6YQJTC/8mZ+5DT1L6RqMy
	NoxHcWt8bgTg4cJgLgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LHm-00000005Jxp-3u9W;
	Mon, 14 Oct 2024 13:38:58 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KB3-000000054rN-30jy
	for linux-mtd@lists.infradead.org;
	Mon, 14 Oct 2024 12:28:00 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DE8E2120009;
	Mon, 14 Oct 2024 15:27:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DE8E2120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1728908867;
	bh=Hm+XhRX4TIgzDknahBKuXWyWd5Q9+AsIAU5whoj+RvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=KNSzbho3rCQbwO2Frovwko8WO5o4sGngh1zAL313SYy3/ui6gZKFZBNLc6e5nk9at
	 2eWPFDbtV0LnGTCjTlWezWoPthRRhkFKxpvbgYIjPXNDpLaZiMTgIn4UwhGREpfVBt
	 rjHAfTF0l414Y6QDs59AtVqeW0XtLoXxWwmUoNZwNOJjBKhKfS2v5Dr57Fh+84NYqG
	 K7S+CFvGeT4tGUB1aGjeoiPvDEmvyjQa4bhE8wIqhUNIvor4YfGqw8TARuLCRipKah
	 LR8HAA3tGbdFEjKzO6GmQQNeIFLXeidOdcmiBYCkx/76DE+qu+WgNiCXV/ISqcgciZ
	 COUALLAp9L9sQ==
Received: from smtp.sberdevices.ru (unknown [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 14 Oct 2024 15:27:47 +0300 (MSK)
Message-ID: <4ddd0588-0ff5-4c31-94b0-c9f0e453d98f@salutedevices.com>
Date: Mon, 14 Oct 2024 15:27:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] mtd: spinand: add OTP support
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Michael Walle" <michael@walle.cc>, Mark Brown <broonie@kernel.org>, Chia-Lin
 Kao <acelan.kao@canonical.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
	"Ezra Buehler" <ezra.buehler@husqvarnagroup.com>, Sridharan S N
	<quic_sridsn@quicinc.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexey Romanov <avromanov@salutedevices.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <kernel@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
 <20240827174920.316756-3-mmkurbanov@salutedevices.com>
 <20241001111225.36cb9701@xps-13>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
In-Reply-To: <20241001111225.36cb9701@xps-13>
X-Originating-IP: [185.8.125.200]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188416 [Oct 14 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/14 10:53:00 #26751613
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_052758_465421_CACA4894 
X-CRM114-Status: GOOD (  13.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

On 10/1/24 12:12, Miquel Raynal wrote:

>> +/**
>> + * spinand_set_mtd_otp_ops() - Set up OTP methods
>> + * @spinand: the spinand device
>> + *
>> + * Set up OTP methods.
>> + */
>> +void spinand_set_mtd_otp_ops(struct spinand_device *spinand)
>> +{
>> +	struct mtd_info *mtd = spinand_to_mtd(spinand);
>> +
>> +	if (!spinand->otp->ops)
> 
> Could we use something else as check? It feels odd to check for otp ops
> and then just ignore the fact that they are here. Maybe check npages or
> otp_size() ?

A developer may not specify OTP callbacks:
SPINAND_OTP_INFO(otp_pages, NULL /* OTP ops */)

Or do you mean that it is better to check in each function
spinand_mtd_otp_{info,read,write,lock}? E.g.:
static int spinand_mtd_otp_erase(struct mtd_info *mtd, loff_t ofs, size_t len)
{
	struct spinand_device *spinand = mtd_to_spinand(mtd);
	const struct spinand_otp_ops *ops = spinand->otp->ops;
	int ret;

	if (!ops || !ops->erase)
		return -EOPNOTSUPP;


-- 
Best Regards,
Martin Kurbanov


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
