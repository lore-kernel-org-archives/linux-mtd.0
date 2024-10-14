Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1061D16261
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2024 13:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73cI6mN6QtRg+hFOglVAZNCWlXTmMkKAglcOqL9ooug=; b=dQXJTWqP3czlHr
	SoU7V1icnhVXmVYM+1wJmyxtUAr7eN7LIwV5Pz/+ahJQFNe2vjzQcAW+FfN+EtUJqJmjKpfUM110i
	8KPEaNKJMAFHKw4pK2oXsivlIIdz/PX0Gw356v093NA7FMtHLBC5yEm4rYHN2aMGqNHoREB0ZBpGo
	HPN/B2htG8hM+11FjaUXGAM/rzhrrZERQaru/QcGryHKtAXCM5aJ9+SrNxwxCsp7TCMR4eDq8vBe6
	PZLIgL1UodZA9e38ZLknGgMj12xh+dZNeKsCr90XewRsbvPwxhElfX5rrPNHiqmGI0I54nH8iNP/x
	buKQf5WvTy1xfInupx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LJJ-00000005KZy-0UcO;
	Mon, 14 Oct 2024 13:40:33 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KVI-000000058UR-1zSV
	for linux-mtd@lists.infradead.org;
	Mon, 14 Oct 2024 12:48:54 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DB919120002;
	Mon, 14 Oct 2024 15:48:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DB919120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1728910127;
	bh=fVQkNp8dSUOXm1yK+m0qUmR2UNH6+5o94IDMSLhf9sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Py72VoAWN2BnJvnMjcHil7KH6qNU5mVPuYINUUD08b6e/XCIGF33JUHag2ffnFPof
	 OeJG1UcbkpOcCMeQPvUBUb/QhYOrx17f+tRKlRpg7PR62QVe/JFKJYz+CeD6d0VcA6
	 BaiU798CoBm8H+uOlqKaGPp77iXURa/ao9TR6uIxmzmJ0oIkCjAVRt2qc4ira6yyLN
	 7c7RmJfOEb4TyeMHii8iu/lcLrGZgrWG6JHT0AzGK+YG0NyXZn/zoBALbvqLKIT43V
	 dJRLXFhQtQOIXyZcstEqMxHLJZ1/pYCxGzMJzlBCtCHwDrBu/hzUGnVE5r+SpiO+0t
	 89H0Lk3CUn+Ag==
Received: from smtp.sberdevices.ru (unknown [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 14 Oct 2024 15:48:47 +0300 (MSK)
Message-ID: <de27927d-ce37-4c0f-85d0-e32bae3f0ef9@salutedevices.com>
Date: Mon, 14 Oct 2024 15:48:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] mtd: spinand: micron: OTP access for
 MT29F2G01ABAGD
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
 <20240827174920.316756-5-mmkurbanov@salutedevices.com>
 <20241001113108.4fdb6360@xps-13>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
In-Reply-To: <20241001113108.4fdb6360@xps-13>
X-Originating-IP: [185.8.125.200]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188417 [Oct 14 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/14 10:53:00 #26751613
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_054852_995615_5FBC3365 
X-CRM114-Status: GOOD (  11.96  )
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

On 10/1/24 12:31, Miquel Raynal wrote:

>> +#define MICRON_MT29F2G01ABAGD_OTP_PAGES			12
>> +#define MICRON_MT29F2G01ABAGD_OTP_PAGE_SIZE		2176
> 
> In the core we did add the data size and the OOB size to get the OTP
> page size. I would prefer something dynamic here as well, otherwise the
> implementation is very device specific for now reason?

Do you mean:
otp_page_size = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand)

>> +		size_t i = 0;
>> +
>> +		/* If all zeros, then the OTP area is locked. */
>> +		while (i < buf_size && *(uint32_t *)(&buf[i]) == 0)
>> +			i += 4;
> 
> Shall we expect buf_size to always be a multiple of 4? (real question)

This function is only for the nand flash MT29F2G01ABAGD that has a page
size multiple of 4.

-- 
Best Regards,
Martin Kurbanov


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
